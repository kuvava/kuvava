<?php

namespace App\Presenters;

use Nette,
	App\Model;


/**
 * Base presenter for all application presenters.
 */
abstract class BasePresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context */
	protected $database;
	public function injectDatabase(Nette\Database\Context $database)
	{
		$this->database = $database;
	}
	protected function getStranka(){
		$idStranek = array(
			'Homepage' => 1,
			'OsobniPromenyKontakt' => 2,
			'ModerniPromenaVizaze' => 3,
			'TeamVizazFoceni' => 4,
			'PromenaVzhledu' => 5,
			'ZmenaImageZeny' => 6,
			'ZmenaImageMuze' => 7
			);
		$stranka = $this->database->table('stranka')->get($idStranek[$this->name]);
		if ($stranka) {
			return $stranka;
		} else {
			$this->shootError();
		}
	}
	protected function shootError($message = 'Omlouváme se, ale stránku nelze nalézt.<br>Kontaktujte prosím správce webu: urbanovi&#64;<!-- -->kuvava.cz<br>nebo si vyberte jiný obsah v menu.', $class = 'fr', $errorText = 'Odkazovaný obsah nelze nalézt.')
	{
		$this->flashMessage($message,$class);
		$this->error($errorText);
	}
	public function beforeRender()
	{
		if (!in_array($this->name, array('Error','Nastroje','Sign'), TRUE)){
			$this->template->stranka = $this->getStranka();
		}
	}
}
