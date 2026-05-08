<?php

class User {

    protected $Conn;

    public function __construct($Conn) {
        $this->Conn = $Conn;
    }

    // Create new user
    public function createUser($user_data) {

        $sec_password = password_hash(
            $user_data['password'],
            PASSWORD_DEFAULT
        );

        $query = "INSERT INTO users (
                    user_email,
                    user_pass
                  )
                  VALUES (
                    :user_email,
                    :user_pass
                  )";

        $stmt = $this->Conn->prepare($query);

        return $stmt->execute([
            'user_email' => $user_data['email'],
            'user_pass' => $sec_password
        ]);
    }

    // Get single user
    public function getUser($user_id) {

        $query = "SELECT *
                  FROM users
                  WHERE user_id = :user_id";

        $stmt = $this->Conn->prepare($query);

        $stmt->execute([
            ':user_id' => $user_id
        ]);

        return $stmt->fetch();
    }

    // Change user password
    public function changeUserPassword(
        $current_pass,
        $new_pass
    ) {

        if (
            !password_verify(
                $current_pass,
                $_SESSION['user_data']['user_pass']
            )
        ) {
            return false;
        }

        $new_sec_pass = password_hash(
            $new_pass,
            PASSWORD_DEFAULT
        );

        $query = "UPDATE users
                  SET user_pass = :user_pass
                  WHERE user_id = :user_id";

        $stmt = $this->Conn->prepare($query);

        $stmt->execute([
            'user_pass' => $new_sec_pass,
            'user_id' => $_SESSION['user_data']['user_id']
        ]);

        return true;
    }
}