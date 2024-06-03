<?php

namespace app\controllers;

class App
{

	public function __construct()
	{
		$this->route();
	}

	private function route() {
		$url = $this->getUrl();
		$route = $this->upperCamelCase($url);
		$controller = $this->matchRoute($route);

		if (class_exists($controller)) {
			new $controller();
		} else {
			throw new Exception("Контроллер $controller не найден", 404);
		}

	}

	private function getUrl(): string
	{
		$url = $_SERVER['REQUEST_URI'] ?? '/';
		return ltrim($url, '/');
	}

	private function upperCamelCase(string $url) : string {
		return lcfirst($url);
	}

	private function matchRoute(string $route) : string {
		$controller = 'app\controllers\\';
		
		if ($route === '') {
			$controller .= 'Main';
		} else {
			$controller .= $route;
		}

		return  $controller . 'Controller';
	}

}