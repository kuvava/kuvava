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
		$parentDir =  __DIR__ . '/../../www/download';
		$rootZip = Finder::findFiles('*.zip')->in($parentDir);
		$subdirectories = Finder::findDirectories('*')->in($parentDir);
		$subdirZip = array();
		foreach ($subdirectories as $key => $value) {
			$zipFiles = array();
			$zipFiles = Finder::findFiles('*.zip')->in($key);
			if (count($zipFiles) > 0) {
				$subdirZip[$value->getFilename()] = $zipFiles;
			}
		}
		$this->template->rootZip = $rootZip;
		$this->template->subdirZip = $subdirZip;
	}

}
