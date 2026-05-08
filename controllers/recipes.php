<?php

$recipes = [];
$category = null;

if (isset($_GET['id']) && $_GET['id'] !== '') {

    $cat_id = (int) $_GET['id'];

    // Get recipes for selected category
    $Recipe = new Recipe($Conn);
    $recipes = $Recipe->getAllRecipesForCategory($cat_id);

    // Get selected category details
    $Category = new Category($Conn);
    $category = $Category->getCategory($cat_id);

} else {

    // Get all recipes if no category selected
    $Recipe = new Recipe($Conn);
    $recipes = $Recipe->getAllRecipes();
}

$Smarty->assign('recipes', $recipes);
$Smarty->assign('category', $category);