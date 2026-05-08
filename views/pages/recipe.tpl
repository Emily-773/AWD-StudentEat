{extends file="layouts/main.tpl"}

{block name="body"}

<section class="recipe-detail-page">

  <h1>Creamy Pasta</h1>

  <div class="recipe-detail-layout">

    <div class="recipe-gallery">

      <button type="button" class="recipe-lightbox-btn" data-img="recipe-images/pasta.jpg">
        <img src="recipe-images/pasta.jpg" alt="Creamy pasta">
      </button>

      <button type="button" class="recipe-lightbox-btn" data-img="recipe-images/salad.jpg">
        <img src="recipe-images/salad.jpg" alt="Fresh salad">
      </button>

      <button type="button" class="recipe-lightbox-btn" data-img="recipe-images/soup.jpg">
        <img src="recipe-images/soup.jpg" alt="Tomato soup">
      </button>

      <button type="button" class="recipe-lightbox-btn" data-img="recipe-images/burger.jpg">
        <img src="recipe-images/burger.jpg" alt="Cheesy burger">
      </button>

      <button type="button" class="recipe-lightbox-btn" data-img="recipe-images/pizza.jpg">
        <img src="recipe-images/pizza.jpg" alt="Pepperoni pizza">
      </button>

      <button type="button" class="recipe-lightbox-btn" data-img="recipe-images/cake.jpg">
        <img src="recipe-images/cake.jpg" alt="Chocolate cake">
      </button>

    </div>

    <div class="recipe-detail-content">

      <p>A simple and affordable pasta recipe, ideal for students who want a quick lunch or dinner.</p>
      <p>This recipe uses easy ingredients and can be adapted with vegetables, cheese, or herbs.</p>

      <h2>Recipe Details</h2>

      <ul class="recipe-features">
        <li><i class="fa-regular fa-clock"></i> 20 Min</li>
        <li><i class="fa-solid fa-users"></i> 4 Servings</li>
        <li><i class="fa-solid fa-pound-sign"></i> Budget</li>
        <li><i class="fa-solid fa-tags"></i> pasta, quick, student meal</li>
      </ul>

    </div>

  </div>

</section>

{/block}