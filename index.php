<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
    <meta charset="utf-8">
    <title>MOVIE DATABASE</title>
    <link href="https://fonts.googleapis.com/css?family=Google+Sans:400,400i,500,500i,700,700i|Google+Sans+Display:400,400i,500,500i,700,700i&amp;subset=all" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style media="screen">
      html,
      body {
        background-image: url('2.png');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
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

      h1 {
        color: #ffbf80;
      }

      .mdc-button {
        margin: 0px 50px 0px 50px;
      }
    </style>
  </head>

  <body class="mdc-typography">
    <div class="main">
      <link rel="stylesheet" href="bundle.css">
      <h1 class="mdc-typography mdc-typography--headline1 headline">Welcome to Movie Database!</h1>
      <button class="mdc-button mdc-button--outlined" onclick="location.href='movies.php';">
        <span class="mdc-button__label">MOVIES</span>
      </button>
      <button class="mdc-button mdc-button--outlined" onclick="location.href='admin.php';">
        <span class="mdc-button__label">ADMIN</span>
      </button>
      <button class="mdc-button mdc-button--outlined" onclick="location.href='user.php';">
        <span class="mdc-button__label">USER</span>
      </button>
    </div>
    <script src="bundle.js"></script>
  </body>

</html>
