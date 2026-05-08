<?php

session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL & ~E_NOTICE);

require_once(__DIR__ . '/includes/boot.include.php');

// =========================
// GET PAGE NAME
// =========================
if (isset($_GET['p']) && $_GET['p'] !== '') {
    $page = $_GET['p'];
} else {
    $page = 'home';
}

// =========================
// SECURE PAGES
// =========================
$secure_pages = [
    'account',
    'changepassword',
    'favourite',
    'myrecipes',
    'add'
];

if (in_array($page, $secure_pages)) {
    if (!isset($_SESSION['is_loggedin']) || $_SESSION['is_loggedin'] !== true) {
        header("Location: index.php?p=login");
        exit();
    }
}

// =========================
// LOAD PAGE
// =========================
$Smarty->assign('view_name', $page);

require_once(__DIR__ . '/controllers/' . $page . '.php');
$Smarty->display('pages/' . $page . '.tpl');