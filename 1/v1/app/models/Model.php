<?php

namespace app\models;

class Model
{

	public function getDB(): string 
	{
		try {
			connect();

			return "Connect !!!";
		} catch (PDOException $e) {
			return "Sorry ! No Connect";
		} 
	}

}