{extends file="layouts/main.tpl"}

{block name="body"}

<section class="recipes-page">

  <h1>
    {if isset($category)}
      {$category.cat_name} Recipes
    {else}
      Recipes
    {/if}
  </h1>

  <p class="welcome-text">
    {if isset($category)}
      Browse our wide range of {$category.cat_name} recipes below.
    {else}
      Browse our wide range of recipes below.
    {/if}
  </p>

  <div class="recipes-grid">

    {foreach from=$recipes item=recipe}

      <a href="index.php?p=recipe&id={$recipe.recipe_id}"
         class="card-link">

        <article class="recipe-card">

          <img
            src="user-images/{$recipe.recipe_image}"
            alt="{$recipe.recipe_name}"
            class="recipe-card-photo">

          <h3>{$recipe.recipe_name}</h3>

        </article>

      </a>

    {/foreach}

  </div>

</section>

{/block}