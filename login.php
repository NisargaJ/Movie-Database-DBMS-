<?php
// Start the session
session_start();
include("config.php");
?>

<!DOCTYPE html>
<html>
<link href="form.css" rel="stylesheet" type="text/css">

<head>
    <title>User Login</title>
    <style>
    body {
      background-image: url('8.png');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: 100% 100%;
      }
    h1 {
      color: #0000ff;
    }
    </style>
</head>

<body class="mdc-typography">
  <div class="main">
    <link rel="stylesheet" href="bundle.css">
    <h1 align="center" class="mdc-typography mdc-typography--headline2 headline">User Login</h1>
    <form style="text-align: center;" method="POST" action="enterAdmin.php">
        <br><input class="in" type="text" name="name" placeholder=" Usernam Name" required><br>
        <br><input class="in" type="text" name="pwd" placeholder="Password" required><br>
    </form>
        <br><center><button class="mdc-button mdc-button--outlined" onclick="location.href='index.php';">
          <span class="mdc-button__label">submit</span>
        </button></center>
</body>

</html>
