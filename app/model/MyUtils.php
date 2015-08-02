<?php

namespace App\Model;

use Nette,
	Nette\Utils\Strings;


/**
 * My utilities
 */
class MyUtils extends Nette\Object
{
	public static function fillVar($promenna, $pokudPrazdna, $pokudPlna = NULL, $chciNull = FALSE)
	{
		if (($pokudPlna === NULL) && ($chciNull === FALSE)) {
			$pokudPlna = $promenna;
		}
		$odpoved = (isset($promenna) && (!(trim($promenna) == FALSE))) ? $pokudPlna : $pokudPrazdna;
		return $odpoved;
	}
}