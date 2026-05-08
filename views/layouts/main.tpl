<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>StudentEat</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.2/css/all.min.css">
  <link rel="stylesheet" href="./css/styles.css">
</head>

<body id="page-{$view_name}">

<header class="student-site-header">
  <div class="container student-header-inner">

    <a href="index.php" class="student-logo-link">
      <picture>
        <source srcset="./images/logo-navbar.webp" type="image/webp">
        <img src="./images/logo-navbar.png"
             alt="StudentEat logo"
             class="student-navbar-logo"
             width="180"
             height="180">
      </picture>
    </a>

    <nav class="student-nav" aria-label="Main Navigation">
      <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="index.php?p=categories">Categories</a></li>
        <li><a href="index.php?p=recipes">Recipes</a></li>

        {if $user_data}

          <li>
            <span class="student-welcome">
              Welcome {$user_data.user_email}
            </span>
          </li>

          <li>
            <a href="index.php?p=account">Account</a>
          </li>

          <li>
            <a href="index.php?p=logout">Logout</a>
          </li>

        {else}

          <li>
            <a href="index.php?p=login">Login / Register</a>
          </li>

        {/if}

      </ul>
    </nav>

    <form action="index.php"
          method="get"
          class="student-search-form"
          role="search">

      <input type="hidden" name="p" value="search">

      <input type="search"
             name="query"
             placeholder="Search recipes..."
             aria-label="Search recipes">

      <button type="submit">Search</button>

    </form>

  </div>
</header>

<main class="container student-main">
  {block name="body"}{/block}
</main>

<script src="./js/scripts.min.js"></script>

</body>
</html>