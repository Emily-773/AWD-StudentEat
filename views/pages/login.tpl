{extends file="layouts/main.tpl"}

{block name="body"}

<h1 class="text-center mb-5">Login & Register</h1>

{if $message}
  <div class="alert alert-info text-center">
    {$message}
  </div>
{/if}

<div class="row">

  <!-- LOGIN -->
  <div class="col-md-6">
    <h2>Login</h2>

    <form id="login-form" method="post" action="index.php?p=login">
      <div class="mb-3">
        <label class="form-label" for="login_email">Email address</label>
        <input type="email" class="form-control" id="login_email" name="email" required>
      </div>

      <div class="mb-3">
        <label class="form-label" for="login_password">Password</label>
        <input type="password" class="form-control" id="login_password" name="password" required>
      </div>

      <!-- ✅ IMPORTANT -->
      <button type="submit" name="login" value="1" class="btn btn-studenteat">
        Login
      </button>
    </form>
  </div>

  <!-- REGISTER -->
  <div class="col-md-6">
    <h2>Register</h2>

    <form id="registration-form" method="post" action="index.php?p=login">
      <div class="mb-3">
        <label class="form-label" for="reg_email">Email address</label>
        <input type="email" class="form-control" id="reg_email" name="email" required>
      </div>

      <div class="mb-3">
        <label class="form-label" for="reg_password">Password</label>
        <input type="password" class="form-control" id="reg_password" name="password" required>
      </div>

      <div class="mb-3">
        <label class="form-label" for="reg_password_confirm">Confirm Password</label>
        <input type="password" class="form-control" id="reg_password_confirm" name="password_confirm" required>
      </div>

      <!-- ✅ IMPORTANT -->
      <button type="submit" name="register" value="1" class="btn btn-primary">
        Register
      </button>
    </form>
  </div>

</div>

{/block}