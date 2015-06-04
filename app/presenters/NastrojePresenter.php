<?php

namespace App\Presenters;

use Nette,
	App\Model,
	Nette\Utils\Finder,
	Nette\Utils\Image;
	


/**
 * Nastroje presenter.
 */
class NastrojePresenter extends BasePresenter
{

	public function startup()
	{
		parent::startup();
		if (!$this->user->isInRole('admin')){
			$this->flashMessage('Pro přístup do sekce "nástroje" musíte být přihlášen jako uživatel s administrátorskými právy.','fr');
			$this->redirect('Sign:in');
		}
	}
	public function beforeRender()
	{
		parent::beforeRender();
		$zmeneneStranky = $this->database->table('stranka')->where('editor_zmeneno != ?', 'ne');
		\Tracy\Debugger::barDump($zmeneneStranky->count());
		if ($zmeneneStranky->count() > 0) {
			$texy = new \Texy;
			$texy->headingModule->top = 2;
			$texy->imageModule->root  = '/images/main-content/';
			$texy->imageModule->leftClass  = 'tifl';
			$texy->imageModule->rightClass  = 'tifr';
			$now = new Nette\DateTime;
			foreach ($zmeneneStranky as $stranka){
				$obsahujeGalerii = 'ne';
				$fragmentHtml = array();
				$castiStranky = $stranka->related('editor_obsahu_stranky')->order('poradi, id');
				if ($castiStranky->count() > 0) {
					foreach ($castiStranky as $fragment) {
						$zaloha = array();
						$posledniZalohaTexy = NULL;
						if ($fragment->galerie_skupina_fotek_id == NULL) {
							$posledniZaloha = $this->database->table('zaloha_obsah')
								->where('editor_obsahu_stranky_id = ?', $fragment->id)
								->order('id DESC')
								->limit(1)
								->fetch();
							if ($posledniZaloha) {
								$posledniZalohaTexy = $posledniZaloha->texy;
							} else {
								$posledniZalohaTexy = NULL;
							}
							$posledniZaloha = NULL;
							if ($posledniZalohaTexy != $fragment->obsah_texy){
								$zaloha = array(
									'editor_obsahu_stranky_id' => $fragment->id,
									'stranka_id' => $fragment->stranka_id,
									'poradi' => $fragment->poradi,
									'pocet_sloupcu' => $fragment->pocet_sloupcu,
									'texy' => $fragment->obsah_texy,
									'datum' => $now
								);
								$this->database->table('zaloha_obsah')->insert($zaloha);
							}
							$posledniZalohaTexy = NULL;
							$zaloha = array();
							$fragmentHtml[$fragment->id] = $texy->process($fragment->obsah_texy);
						} else {
							$obsahujeGalerii = 'ano';
						}	
					}
					$tempTemplate = NULL;
					$tempTemplate = $this->createTemplate()
						->setFile(__DIR__ . '/templates/components/renderMainContent.latte')
						->setParameters(array('casti' => $castiStranky, 'htmlFragmenty' => $fragmentHtml));
					$tempTemplate = (string)$tempTemplate;
					$stranka->update(array('obsah_html_nahore' => $tempTemplate));
				}
				$this->flashMessage('Upravena stránka id ' . $stranka->id);
				$stranka->update(array('obsahuje_galerii' => $obsahujeGalerii , 'editor_zmeneno' => 'ne'));
			}
		}
		
	}
	
	public function actionPregenerujObsah()
	{
		$this->database->table('stranka')->update(array('editor_zmeneno' => 'ano'));
		$this->redirect('Nastroje:');
	}
	
	public function actionZpracujFotky()
	{
		if (!$this->user->isInRole('admin')){
			$this->flashMessage('Pro přístup do sekce "nástroje" musíte být přihlášen jako uživatel s administrátorskými právy.','fr');
			$this->redirect('Sign:in');
		}
		
		$parentDir =  __DIR__ . '/../../www/images/gallery/to-do/';
		$rootJpg = Finder::findFiles('*.jpg','*.JPG')->in($parentDir);
		foreach ($rootJpg as $key => $value) {
			list($width, $height, $type, $html_attr) = getimagesize($key);
			$size = $value->getSize();
			$fileextension = Nette\Utils\Strings::lower($value->getExtension());
			$tvar = 'neznamy';
			if ($width > $height) {$tvar = 'nasirku';
			} elseif ($width < $height) {$tvar = 'navysku';
			} elseif ($width == $height) {$tvar = 'ctverec';
			}
			
			$insertion = array(
				'size' => $size,
				'width' => $width,
				'height' => $height,
				'html_attr' => $html_attr,
				'fileextension' => $fileextension,
				'tvar' => $tvar,
			);
			
			$table = $this->database->table('vsechny_fotky');
			$table->insert($insertion);
			$photoId = $table->max('id');
			$filename = $photoId . '.' . $fileextension;
			$success = rename($key, $parentDir . '/../all/' . $filename);
			if ($success) {
				$this->flashMessage('Přenos souboru <strong><a href="/images/gallery/all/' . $filename .'" target="_blank">' . $filename . '</a></strong> se zdařil.');
				$this->redirect('Nastroje:zpracujMiniatury', $photoId, 'l',$filename);
			} else {
				$this->flashMessage('Přenos souboru <strong>' . $filename . '</strong> se nezdařil.', 'fr');
				$this->redirect('Nastroje:');
			}
			
		}
		$this->flashMessage('Ve složce <strong>to-do/</strong> již nejsou žádné další <strong>.jpg</strong> soubory ke zpracování.');
		$this->redirect('Nastroje:');
	}
	public function actionZpracujMiniatury($photoId,$sizeCat,$filename)
	{
		if (!$this->user->isInRole('admin')){
			$this->flashMessage('Pro přístup do sekce "nástroje" musíte být přihlášen jako uživatel s administrátorskými právy.','fr');
			$this->redirect('Sign:in');
		}
		$resizeDimension = 1200;
		if ($sizeCat == 'l') {$resizeDimension = 1200;
		} elseif ($sizeCat == 'm') {$resizeDimension = 800;
		} elseif ($sizeCat == 's') {$resizeDimension = 200;
		}
		
		$imagesDir =  __DIR__ . '/../../www/images/gallery/all/';
		$currentSourceFile = $imagesDir . $filename;
		if ($sizeCat == 'l') {$currentSourceFile = $imagesDir . $filename;
		} elseif ($sizeCat == 'm') {$currentSourceFile = $imagesDir . 'thumbs/l/' . $filename;
		} elseif ($sizeCat == 's') {$currentSourceFile = $imagesDir . 'thumbs/m/' . $filename;
		}
		
		/*\Tracy\Debugger::barDump('for size:' . $sizeCat . ', resize source:' . $currentSourceFile);*/
		$image = Image::fromFile($currentSourceFile);
		if ($sizeCat == 's'){
			$image->resize($resizeDimension, $resizeDimension, Image::SHRINK_ONLY | Image::FILL);
		} else {
			$image->resize($resizeDimension, $resizeDimension, Image::SHRINK_ONLY);
		}
		/*$image->sharpen();*/
		$partUrlResizedFile = 'thumbs/' . $sizeCat . '/' . $filename;
		$resizedFile = $imagesDir . $partUrlResizedFile;
		$image->save($resizedFile, 80, Image::JPEG);
		list($width, $height, $type, $html_attr) = getimagesize($resizedFile);
		$size = filesize($resizedFile);
		
		if ($size > 0 && $width > 0 && $height > 0) {
			$updating = array(
				$sizeCat . '_size' => $size,
				$sizeCat . '_width' => $width,
				$sizeCat . '_height' => $height,
				$sizeCat . '_html_attr' => $html_attr,
			);
			$this->database->table('vsechny_fotky')->get($photoId)->update($updating);
			$this->flashMessage('Výroba miniatury <strong><a href="/images/gallery/all/' . $partUrlResizedFile .'" target="_blank">' . $partUrlResizedFile . '</a></strong> se zdařila.');
			
			if ($sizeCat == 's') {
				$this->redirect('Nastroje:zpracujFotky');
			} else {
				$targetSizeCat = ($sizeCat == 'l' ? 'm' : 's');
				$this->redirect('Nastroje:zpracujMiniatury', $photoId, $targetSizeCat, $filename);
			}	
		} else {
			$this->flashMessage('Při výrobě miniatury<strong>' . $partUrlResizedFile . '</strong>došlo k chybě.', 'fr');
			$this->redirect('Nastroje:');
		}
	}
	
	public function renderZobrazVsechnyFoto()
	{
		$this->template->tabulkaFotek = $this->database->table('vsechny_fotky');
		$this->template->flashUId = $this->getParameter('flashUId');
	}
	public function renderPosunoutVyrezFotky($photoId)
	{
		$row = $this->database->table('vsechny_fotky')->get($photoId);
		if (!$row){
			$this->flashMessage('Fotografii číslo ' . $photoId . ' nelze v databázi nalézt.', 'fr');
			$this->redirect('Nastroje:zobrazVsechnyFoto');
		}
		if ($row->tvar == 'ctverec') {
			$this->flashMessage('U fotografie čtvercového tvaru ('. $photoId . '.' . $row->fileextension .') nelze posunovat výřezem.','fr');
			$this->redirect('Nastroje:zobrazVsechnyFoto');
		} else {
			$this->template->row = $row;
		}
	}
	public function ActionUlozPosunutiVyrezu($photoId,$procentPosunu)
	{
		$row = $this->database->table('vsechny_fotky')->get($photoId);
		if (!$row){
			$this->flashMessage('Fotografii číslo ' . $photoId . ' nelze v databázi nalézt.', 'fr');
			$this->redirect('Nastroje:zobrazVsechnyFoto');
		}
		$row->update(array('nahled_posun'=>$procentPosunu));
		$this->flashMessage('Uložení hodnoty ' . $procentPosunu . '% bylo úšpěšné (posun výřezu miniatury fotografie číslo '. $photoId . ')');
		$this->redirect('Nastroje:zobrazVsechnyFoto#photoid' . $photoId, array('flashUId' => $photoId));
	}

}
