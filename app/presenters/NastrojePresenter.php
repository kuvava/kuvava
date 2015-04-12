<?php

namespace App\Presenters;

use Nette,
	App\Model,
	Nette\Utils\Finder;
	


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
			if ($width > $height) {$tvar = 'nasirku';}
			elseif ($width < $height) {$tvar = 'navysku';}
			elseif ($width = $height) {$tvar = 'ctverec';}
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
				$this->redirect('Nastroje:zpracujMiniatury', $photoId, 'l',$filename,$tvar);
			} else {
				$this->flashMessage('Přenos souboru <strong>' . $filename . '</strong> se nezdařil.', 'fr');
				$this->redirect('Nastroje:');
			}
			
		}
		$this->flashMessage('Ve složce <strong>to-do/</strong> již nejsou žádné další <strong>.jpg</strong> soubory ke zpracování.');
		$this->redirect('Nastroje:');
	}
	public function actionZpracujMiniatury($photoId,$sizeCat,$filename,$tvar)
	{
		if (!$this->user->isInRole('admin')){
			$this->flashMessage('Pro přístup do sekce "nástroje" musíte být přihlášen jako uživatel s administrátorskými právy.','fr');
			$this->redirect('Sign:in');
		}
		
		
		
		$this->redirect('Nastroje:zpracujFotky');
	}

}
