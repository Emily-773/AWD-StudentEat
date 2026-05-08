<?php

$User = new User($Conn);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $currentPassword = $_POST['currentPassword'] ?? '';
    $newPassword = $_POST['newPassword'] ?? '';

    if ($currentPassword === '') {

        $Smarty->assign('error', 'Current password not set');

    } elseif ($newPassword === '') {

        $Smarty->assign('error', 'New password not set');

    } elseif (strlen($newPassword) < 8) {

        $Smarty->assign('error', 'New password must be at least 8 characters');

    } else {

        $change_pass = $User->changeUserPassword(
            $currentPassword,
            $newPassword
        );

        if ($change_pass) {

            $Smarty->assign(
                'success',
                'Password has been updated successfully.'
            );

        } else {

            $Smarty->assign(
                'error',
                'Current password is incorrect.'
            );

        }
    }
}