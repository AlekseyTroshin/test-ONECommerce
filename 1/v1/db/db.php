<?php

function connect(): PDO
{
    return new PDO(DSN);
}
