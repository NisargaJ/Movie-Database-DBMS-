<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
    <meta charset="utf-8">
    <title>USER</title>
    <link href="https://fonts.googleapis.com/css?family=Google+Sans:400,400i,500,500i,700,700i|Google+Sans+Display:400,400i,500,500i,700,700i&amp;subset=all" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style media="screen">
      html,
      body {
        background-image: url('8.png');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
        }
      h1 {
        color: #ffbf80;
      }
      body {
        height: 100%;
      }

      body {
        display: flex;
        text-align: center;
      }

      .main {
        margin: auto;
      }


      .mdc-button {
        margin: 0px 50px 0px 50px;
      }
    </style>
  </head>

  <body class="mdc-typography">
    <div class="main">
      <link rel="stylesheet" href="bundle.css"><br><br><br><br><br><br><br><br><br><br><br><br>
      <h1 class="mdc-typography mdc-typography--headline2 headline">USER</h1>
      <button class="mdc-button mdc-button--outlined" onclick="location.href='register.php';">
        <span class="mdc-button__label">Register</span>
      </button>
      OR
      <button class="mdc-button mdc-button--outlined" onclick="location.href='login.php';">
        <span class="mdc-button__label">Login</span>
      </button><br>
    </div>
    <script src="bundle.js"></script>
  </body>

</html>
