<?php

namespace App\Presenters;

use Nette,
	App\Model;


/**
 * Homepage presenter.
 */
class HomepagePresenter extends BasePresenter
{

	protected function getStranka()
	{
		$url = $this->getParameter('url');
		if (!$url) {
			$url = '';
		}
		$stranka = $this->database->table('stranka')->where('url = ?', $url)->order('id')->limit(1)->fetch();
		if ($stranka) {
			if ($stranka->redirect !== NULL) {
				$url = $this->database->table('stranka')->get($stranka->redirect)->url;
				$params = array('url' => $url);
				$this->redirect(301,'Homepage:default',$params);
			}
			return $stranka;
		} else {
			$this->shootError();
		}
	}

	
	
	public function renderDefault()
	{
		$this->template->html = $this->getStranka()->related('stranka_html_celek')->order('id')->limit(1)
			->fetch()->html;
		if(!$this->template->html) {
			$this->shootError();
		}
	}

}
