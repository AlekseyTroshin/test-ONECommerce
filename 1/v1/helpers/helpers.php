<?php

function includeView(string $template, array $data = []): void
{
    extract($data);
    include VIEW . '/' . $template . '.php';
}