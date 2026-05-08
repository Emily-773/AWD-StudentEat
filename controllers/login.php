<?php

session_start();

$message = "";

// Database connection
$host = "185.114.98.6";
$db   = "studenteat";
$user = "Emily-96";
$pass = "Emily";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// =========================
// REGISTER
// =========================
if (isset($_POST['register'])) {

    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $confirm = $_POST['password_confirm'] ?? '';

    if (empty($email)) {
        $message = "Email not set.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = "Email is not valid.";
    } elseif (empty($password)) {
        $message = "Password not set.";
    } elseif (empty($confirm)) {
        $message = "Confirm password not set.";
    } elseif ($password !== $confirm) {
        $message = "Password and confirm password must match.";
    } elseif (strlen($password) < 8) {
        $message = "Password must be at least 8 characters in length.";
    } else {

        $hash = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO users (user_email, user_pass) VALUES (?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $email, $hash);

        if ($stmt->execute()) {
            $message = "Your account has been created. Please now login.";

            // Send welcome email using SendGrid after successful registration
            $emailSender = new \SendGrid\Mail\Mail();

            $emailSender->setFrom("YOUR_VERIFIED_EMAIL@uos.ac.uk", "StudentEat");
            $emailSender->setSubject("Welcome to StudentEat!");
            $emailSender->addTo($email, "StudentEat User");

            $emailSender->addContent(
                "text/html",
                "<h1>Welcome to StudentEat!</h1>
                 <p>Your account has been created successfully.</p>
                 <p>You can now log in and start using the website.</p>"
            );

            $sendgrid = new \SendGrid("YOUR_SENDGRID_API_KEY_HERE");

            try {
                $response = $sendgrid->send($emailSender);
            } catch (Exception $e) {
                error_log("SendGrid email error: " . $e->getMessage());
            }

        } else {
            $message = "An error occurred, please try again later.";
        }

        $stmt->close();
    }
}

// =========================
// LOGIN
// =========================
if (isset($_POST['login'])) {

    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if (empty($email) || empty($password)) {
        $message = "Please enter your email and password.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = "Email is not valid.";
    } elseif (strlen($password) < 8) {
        $message = "Password must be at least 8 characters in length.";
    } else {

        $sql = "SELECT * FROM users WHERE user_email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();

        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $userData = $result->fetch_assoc();

            if (password_verify($password, $userData['user_pass'])) {

                $_SESSION['is_loggedin'] = true;
                $_SESSION['user_data'] = $userData;
                $_SESSION['user_email'] = $userData['user_email'];

                header("Location: index.php");
                exit();

            } else {
                $message = "Incorrect Email/Password.";
            }

        } else {
            $message = "Incorrect Email/Password.";
        }

        $stmt->close();
    }
}

// Pass message to Smarty
$Smarty->assign('message', $message);

$conn->close();