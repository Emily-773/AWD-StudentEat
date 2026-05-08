{extends file="layouts/main.tpl"}

{block name="body"}

<section class="student-hero" aria-labelledby="student-hero-title">
  <picture>
    <source srcset="images/logo-large.webp" type="image/webp">
    <img src="images/logo-large.png"
         alt="StudentEat mascot logo"
         class="student-hero-logo"
         width="500"
         height="500">
  </picture>

  <p class="student-eyebrow">Simple meals for busy students</p>

  <h1 id="student-hero-title">Welcome to StudentEat</h1>

  <p class="student-hero-text">
    Find simple, affordable and tasty recipes designed for university life.
    Browse meal ideas, explore categories and discover student-friendly food inspiration.
  </p>

  <div class="student-hero-actions">
    <a href="index.php?p=recipes">Explore Recipes</a>
    <a href="index.php?p=categories">View Categories</a>
  </div>
</section>

<section class="student-featured" aria-labelledby="featured-recipes-title">

  <p class="student-eyebrow">Popular inspiration</p>

  <h2 id="featured-recipes-title">Featured Recipes</h2>

  <p>Quick recipe ideas to help students cook with confidence.</p>

 <div class="css-carousel">

  <a href="index.php?p=recipes" class="css-slide slide-one">
    <img src="recipe-images/pasta.jpg" alt="Creamy Pasta">
    <h3>Creamy Pasta</h3>
  </a>

  <a href="index.php?p=recipes" class="css-slide slide-two">
    <img src="recipe-images/burger.jpg" alt="Cheesy Burger">
    <h3>Cheesy Burger</h3>
  </a>

  <a href="index.php?p=recipes" class="css-slide slide-three">
    <img src="recipe-images/cake.jpg" alt="Chocolate Cake">
    <h3>Chocolate Cake</h3>
  </a>

  <a href="index.php?p=recipes" class="css-slide slide-four">
    <img src="recipe-images/salad.jpg" alt="Fresh Salad">
    <h3>Fresh Salad</h3>
  </a>

</div>

  </div>

</section>

{/block}