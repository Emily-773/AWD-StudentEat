{extends file="layouts/main.tpl"}

{block name="body"}

<section class="container py-5">

    <h1>Add New Recipe</h1>

    {if isset($error)}
        <div class="alert alert-danger">
            {$error}
        </div>
    {/if}

    {if isset($success)}
        <div class="alert alert-success">
            {$success}
        </div>
    {/if}

    <form method="POST"
          enctype="multipart/form-data"
          class="form-light">

        <!-- Recipe Name -->
        <div class="mb-3">
            <label class="form-label" for="recipe_name">
                Recipe Name
            </label>

            <input type="text"
                   class="form-control"
                   id="recipe_name"
                   name="recipe_name">
        </div>

        <!-- Category -->
        <div class="mb-3">
            <label class="form-label" for="cat_id">
                Recipe Category
            </label>

            <select class="form-control"
                    id="cat_id"
                    name="cat_id">

                {foreach from=$categories item=category}
                    <option value="{$category.cat_id}">
                        {$category.cat_name}
                    </option>
                {/foreach}

            </select>
        </div>

        <!-- Image -->
        <div class="mb-3">
            <label for="formFile" class="form-label">
                Recipe Image
            </label>

            <input class="form-control"
                   type="file"
                   id="formFile"
                   name="recipe_image">
        </div>

        <!-- Time -->
        <div class="mb-3">
            <label class="form-label" for="recipe_time">
                Recipe Time
            </label>

            <input type="text"
                   class="form-control"
                   id="recipe_time"
                   name="recipe_time">
        </div>

        <!-- Servings -->
        <div class="mb-3">
            <label class="form-label" for="recipe_servings">
                Recipe Servings
            </label>

            <input type="text"
                   class="form-control"
                   id="recipe_servings"
                   name="recipe_servings">
        </div>

        <!-- Budget -->
        <div class="mb-3">
            <label class="form-label" for="recipe_budget">
                Recipe Budget
            </label>

            <select class="form-control"
                    id="recipe_budget"
                    name="recipe_budget">

                <option value="1">Budget</option>
                <option value="2">Medium</option>
                <option value="3">Expensive</option>

            </select>
        </div>

        <!-- Instructions -->
        <div class="mb-3">
            <label class="form-label"
                   for="recipe_instructions">

                Recipe Instructions
            </label>

            <textarea class="form-control"
                      id="recipe_instructions"
                      name="recipe_instructions"></textarea>
        </div>

        <button type="submit"
                class="btn btn-primary">

            Add Recipe
        </button>

    </form>

</section>

{/block}