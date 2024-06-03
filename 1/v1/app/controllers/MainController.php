<?php

namespace app\controllers;

class MainController
{

	public function __construct()
	{
		includeView('main/index');
	}

}