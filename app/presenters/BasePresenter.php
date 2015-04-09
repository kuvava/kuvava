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
			if ($stranka->editor_zmeneno != 'ne'){
				$texy = new \Texy;
				$stranka->update(array(
					'obsah_html_nahore' => $texy->process(
						$stranka->ref('editor_obsahu_stranky')->obsah_texy_nahore
					),
					'obsah_html_dole' => $texy->process(
						$stranka->ref('editor_obsahu_stranky')->obsah_texy_dole
					),
				));
				$zaloha = array(
					'stranka_id' => $stranka->id,
					'texy_nahore' => $stranka->ref('editor_obsahu_stranky')->obsah_texy_nahore,
					'texy_dole' => $stranka->ref('editor_obsahu_stranky')->obsah_texy_dole,
					'html_nahore' => $stranka->obsah_html_nahore,
					'html_dole' => $stranka->obsah_html_dole
				);
				$this->database->table('zaloha_obsah')->insert($zaloha);
				$stranka->update(array('editor_zmeneno' => 'ne'));
			}
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
		if (!in_array($this->name, array('Error','Nastroje'), TRUE)){
			$this->template->stranka = $this->getStranka();
		}
	}
}
