<?php

$Category = new Category($Conn);
$categories = $Category->getAllCategories();

$Smarty->assign('categories', $categories);

if ($_POST) {

    $error = "";

    if (!$_POST['recipe_name']) {
        $error = "Recipe name not set";
    } else if (!$_POST['recipe_instructions']) {
        $error = "Recipe instructions not set";
    } else if (!$_POST['recipe_time']) {
        $error = "Recipe time not set";
    } else if (!$_POST['recipe_servings']) {
        $error = "Recipe servings not set";
    } else if (!$_FILES['recipe_image']['name']) {
        $error = "Please upload a recipe image";
    }

    if ($error) {

        $Smarty->assign('error', $error);

    } else {

        $random = substr(str_shuffle(md5(microtime())), 0, 10);
        $new_filename = $random . $_FILES['recipe_image']['name'];

        if (move_uploaded_file(
            $_FILES['recipe_image']['tmp_name'],
            __DIR__ . '/../user-images/' . $new_filename
        )) {

            $_POST['recipe_image'] = $new_filename;

            $Recipe = new Recipe($Conn);
            $attempt = $Recipe->addRecipe($_POST);

            if ($attempt) {
                $Smarty->assign('success', "Your recipe has been added.");
            } else {
                $Smarty->assign('error', "An error occurred.");
            }

        } else {
            $Smarty->assign('error', "Image upload failed.");
        }
    }
}