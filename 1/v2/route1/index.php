<?php

require_once dirname(__DIR__) . '/config/init.php';

try {
	$db = connect();

	echo "Connect !!!";
} catch (PDOException $e) {
	echo "Sorry ! No Connect";
}

?>


<h1>Route 1</h1>
<a href="route2">route2</a>
<br>
<a href="route3">route3</a>