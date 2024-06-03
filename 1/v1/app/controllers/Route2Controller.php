<?php

namespace app\controllers;

class Route2Controller
{

	public function __construct()
	{
		$date = "Today: " . date("Y-m-d l");
		
		includeView('route2/index', compact('date'));
	}

}