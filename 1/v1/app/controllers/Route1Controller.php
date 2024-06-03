<?php

namespace app\controllers;

use app\models\Model;
use PDOException;

class Route1Controller
{

	public function __construct()
	{
		try {
			$response = (new Model())->getDB();

		} catch (PDOException $e) {
			$response = "Sorry ! No Connect";

		} finally {
			includeView('route1/index', compact('response'));
		}
	}

}