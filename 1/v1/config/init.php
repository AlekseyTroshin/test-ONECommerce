<?php

define('ROOT', dirname(__DIR__));
const DB = ROOT . '/db';
const VIEW = ROOT . '/app/views';

require_once 'config_db.php';
require_once DB . '/db.php';
require_once ROOT . '/helpers/helpers.php';

require_once ROOT . '/vendor/autoload.php';

