{extends file="layouts/main.tpl"}

{block name="body"}

<section class="recipes-page">

  <h1>Recipe Categories</h1>

  <p class="welcome-text">
    Browse recipe categories and discover meal inspiration.
  </p>

  <div class="recipes-grid">

    {foreach from=$categories item=category}

      <a href="index.php?p=recipes&id={$category.cat_id}" class="card-link">

        <article class="recipe-card">

          <img
            src="user-images/categories/{$category.cat_image}"
            alt="{$category.cat_name}"
            class="recipe-card-photo">

          <h3>{$category.cat_name}</h3>

        </article>

      </a>

    {/foreach}

  </div>

</section>

{/block}