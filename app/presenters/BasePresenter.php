<?php

namespace App\Presenters;

use Nette,
	App\Model;


/**
 * Base presenter for all application presenters.
 */
abstract class BasePresenter extends Nette\Application\UI\Presenter
{
	protected function shootError($message = 'Omlouváme se, ale stránku nelze nalézt.<br>Kontaktujte prosím správce webu: urbanovi&#64;<!-- -->kuvava.cz<br>nebo si vyberte jiný obsah v menu.', $class = 'fr', $errorText = 'Odkazovaný obsah nelze nalézt.')
	{
		$this->flashMessage($message,$class);
		$this->error($errorText);
	}
}
