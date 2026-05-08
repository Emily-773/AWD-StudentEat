<?php

function autoload($classname) {
    $file = __DIR__ . '/../classes/' . strtolower($classname) . '.class.php';

    if (file_exists($file)) {
        require_once($file);
    }
}

spl_autoload_register('autoload');