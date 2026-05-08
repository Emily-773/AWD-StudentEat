{extends file="layouts/main.tpl"}

{block name="body"}

<section class="account-page">

  <h1 class="mb-4 pb-2">Change Your Password</h1>

  <div class="btn-group mb-4"
       role="group"
       aria-label="Account menu">

    <a href="index.php?p=account"
       class="btn btn-secondary">
       Home
    </a>

    <a href="index.php?p=favourite"
       class="btn btn-secondary">
       Favourite Recipes
    </a>

    <a href="index.php?p=myrecipes"
       class="btn btn-secondary">
       My Recipes
    </a>

    <a href="index.php?p=add"
       class="btn btn-secondary">
       Add Recipe
    </a>

    <a href="index.php?p=changepassword"
       class="btn btn-secondary">
       Change Password
    </a>

  </div>

  {if $error}
    <div class="alert-error">
      {$error}
    </div>
  {else if $success}
    <div class="alert-success">
      {$success}
    </div>
  {/if}

  <form action=""
        method="post"
        class="form-light">

    <div class="form-group">
      <label for="currentPassword">
        Current Password
      </label>

      <input type="password"
             id="currentPassword"
             name="currentPassword"
             required>
    </div>

    <div class="form-group">
      <label for="newPassword">
        New Password
      </label>

      <input type="password"
             id="newPassword"
             name="newPassword"
             minlength="8"
             required>
    </div>

    <button type="submit"
            class="btn-submit">
      Change Password
    </button>

  </form>

</section>

{/block}