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
	}
	public function renderPosunoutVyrezFotky($photoId)
	{
		$row = $this->database->table('vsechny_fotky')->get($photoId);
		if ($row->tvar == 'ctverec') {
			$this->flashMessage('U fotografie čtvercového tvaru ('. $photoId . '.' . $row->fileextension .') nelze posunovat výřezem.','fr');
			$this->redirect('Nastroje:zobrazVsechnyFoto');
		} else {
			$this->template->row = $row;
		}
	}

}
