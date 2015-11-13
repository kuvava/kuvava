<?php

namespace App;

use Nette,
	Nette\Application\Routers\RouteList,
	Nette\Application\Routers\Route,
	Nette\Application\Routers\SimpleRouter;


/**
 * Router factory.
 */
class RouterFactory
{

	/**
	 * @return \Nette\Application\IRouter
	 */
	public static function createRouter()
	{
		$router = new RouteList();
		$router[] = new Route('[_<presenter=Homepage>/][-<action=default>/][<id [0-9]+>/][<url .+>/]', array(
			'url' => array(
				Route::FILTER_OUT => function ($string) {return implode("/", array_map("rawurlencode", explode("/", $string)));}
			)
		));
		return $router;
	}

}
