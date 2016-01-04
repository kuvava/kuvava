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
	protected function shootError($message = 'Omlouváme se, ale stránku nelze nalézt.<br>Kontaktujte prosím správce webu: urban&#64;<!-- -->kuvava.cz<br>nebo si vyberte jiný obsah v menu.', $class = 'fr', $errorText = 'Odkazovaný obsah nelze nalézt.')
	{
		$this->flashMessage($message,$class);
		$this->error($errorText);
	}
	protected function getBasicMenu($leveling = FALSE)
	{
		$whereCond = 'menu_id = ?';
		$whereCond = $leveling ? $whereCond : $whereCond . ' AND menu_rodic IS NULL';
		$menu = $this->database->table('menu_polozky')->where($whereCond, 0)
			->order('poradi, id');
		if ($menu->fetch()) {
			return $menu;
		} else {
			$this->shootError('Chyba při načítání menu z databáze!');
		}
	}
}
