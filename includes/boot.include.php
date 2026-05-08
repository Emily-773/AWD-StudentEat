<?php

require_once(__DIR__ . '/config.include.php');
require_once(__DIR__ . '/db.include.php');
require_once(__DIR__ . '/../vendor/autoload.php');
require_once(__DIR__ . '/autoloader.include.php');

use Smarty\Smarty;

$Smarty = new Smarty();

$Smarty->setTemplateDir(__DIR__ . '/../views')
       ->setCompileDir(__DIR__ . '/../smarty/templates_c')
       ->setCacheDir(__DIR__ . '/../smarty/cache')
       ->setConfigDir(__DIR__ . '/../smarty/configs');

/* -----------------------------------
   LOAD CLASSES
----------------------------------- */

require_once(__DIR__ . '/../classes/category.class.php');
require_once(__DIR__ . '/../classes/recipe.class.php');

/* -----------------------------------
   Active Logged In User
----------------------------------- */

if (isset($_SESSION['is_loggedin']) && $_SESSION['is_loggedin'] === true) {

    $User = new User($Conn);

    $active_user_data = $User->getUser(
        $_SESSION['user_data']['user_id']
    );

    $Smarty->assign('user_data', $active_user_data);

} else {

    $Smarty->assign('user_data', false);

}