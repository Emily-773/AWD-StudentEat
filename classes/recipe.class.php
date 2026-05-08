<?php

class Recipe {

    protected $Conn;

    public function __construct($Conn) {
        $this->Conn = $Conn;
    }

    // GET ALL RECIPES
    public function getAllRecipes() {

        $query = "
            SELECT *
            FROM recipes
            ORDER BY recipe_name ASC
        ";

        $stmt = $this->Conn->prepare($query);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // GET RECIPES BY CATEGORY
    public function getRecipesByCategory($cat_id) {

        $query = "
            SELECT *
            FROM recipes
            WHERE cat_id = :cat_id
            ORDER BY recipe_name ASC
        ";

        $stmt = $this->Conn->prepare($query);

        $stmt->execute([
            'cat_id' => $cat_id
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // ADD RECIPE
    public function addRecipe($data) {

        $query = "
            INSERT INTO recipes
            (
                cat_id,
                user_id,
                recipe_name,
                recipe_image,
                recipe_time,
                recipe_servings,
                recipe_budget,
                recipe_instructions,
                recipe_tags
            )
            VALUES
            (
                :cat_id,
                :user_id,
                :recipe_name,
                :recipe_image,
                :recipe_time,
                :recipe_servings,
                :recipe_budget,
                :recipe_instructions,
                :recipe_tags
            )
        ";

        $stmt = $this->Conn->prepare($query);

        $data['user_id'] =
            $_SESSION['user_data']['user_id'];

        // Default empty tags
        $data['recipe_tags'] = '';

        return $stmt->execute($data);
    }

    // GET RECIPES FOR CATEGORY
    public function getAllRecipesForCategory($category_id) {

        $query = "
            SELECT *
            FROM recipes
            WHERE cat_id = :cat_id
        ";

        $stmt = $this->Conn->prepare($query);

        $stmt->execute([
            'cat_id' => $category_id
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}