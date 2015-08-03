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
			return $stranka;
		} else {
			$this->shootError();
		}
	}

	public function beforeRender()
	{
		
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
