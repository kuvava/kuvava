<?php

namespace App\Presenters;

use Nette,
	App\Model;


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
	
	public function actionZpracujFotky($hash)
	{
		
	}
	public function actionZpracujMiniatury($hash,$photoId,$size)
	{
		
	}

}
