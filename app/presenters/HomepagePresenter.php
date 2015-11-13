<?php

namespace App\Presenters;

use Nette,
	App\Model,
	Nette\Utils\Finder;


/**
 * Homepage presenter.
 */
class HomepagePresenter extends BasePresenter
{

	public function beforeRender()
	{
		$currPath = $this->getParameter('url');
		$currDir = '/download/';
		if ($currPath) {
			$currDir = $currDir . 'skryte/' . $currPath . '/';
			$currPath = '/skryte/' . $currPath;
		}
		$parentDir =  __DIR__ . '/../../www/download' . $currPath;
		if (!is_dir($parentDir)) {
			$this->redirect('Homepage:default');
		}
		$rootZip = Finder::findFiles('*.zip')->in($parentDir);
		$subdirectories = Finder::findDirectories('*')->exclude('skryte')->in($parentDir);
		$subdirZip = array();
		foreach ($subdirectories as $key => $value) {
			$zipFiles = array();
			$zipFiles = Finder::findFiles('*.zip')->in($key);
			if (count($zipFiles) > 0) {
				$subdirZip[$value->getFilename()] = $zipFiles;
			}
		}
		if ((count($rootZip) > 0) || (count($subdirZip) > 0)) {
			$this->template->rootZip = $rootZip;
			$this->template->subdirZip = $subdirZip;
			$this->template->currDir = $currDir;
			$this->template->keStazeni = 'ano';
		} else {
			if ($currPath) {
				$this->redirect('Homepage:default');
			}
			$this->template->keStazeni = 'ne';
		}
	}

}
