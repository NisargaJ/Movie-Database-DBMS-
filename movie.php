<?php
// Start the session
session_start();
include('config.php');

if (isset($_GET['id'])) {
  $id = $_GET['id'];
  $query = mysqli_query($connection, "SELECT * FROM MOVIE WHERE ID=$id");

                  $row = mysqli_fetch_assoc($query);
                  $name = $row["NAME"];
                  $rating = $row["RATING"];
                  $year = $row["RELEASE"];
                  $language = $row["LANGUAGE"];
                  $director = $row["DIRECTOR"];
                  $location = $row["LOCATION"];
                  $runtime = $row["RUNTIME"];
                  $mpaa = $row["MPAA_RATING"] - 1;
                  $budget = $row["BUDGET"];
                  $mpaa_list = ["G", "PG", "PG-13", "R", "NC-17"];
} else {
  header("location: movies.php");
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Google+Sans:400,400i,500,500i,700,700i|Google+Sans+Display:400,400i,500,500i,700,700i&amp;subset=all" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style media="screen">
      html,
      body {
        background-image: url('9.png');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
        }
      body {
        height: 100%;
      }

      body {
        padding: 100px;
        font-family: Product Sans;
        color: #f2f2f2;
        font-size: 2em;
      }

      a {
        text-decoration: none;
        color: inherit;
      }

      .details {
        margin: auto;
        padding-bottom: 50px;
      }

 	fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating {
  border: none;
  float: left;
}

.rating > input { display: none; }
.rating > label:before {
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before {
  content: "\f089";
  position: absolute;
}

.rating > label {
  color: #ddd;
 float: right;
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  }
    </style>
    <title><?php echo $name; ?></title>
  </head>

  <body oncontextmenu="return false;" ondragstart="return false;" ondrop="return false;" class="mdc-typography">
    <link rel="stylesheet" href="bundle.css">
    <div class="details">
      <h1 class="mdc-typography mdc-typography--headline1 headline"><?php echo "$name ($year)"; ?></h1>

<fieldset class="rating">
    <input type="radio" onclick="update_rating(this)" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Good - 3.5 stars"></label>
    <input type="radio" id="star3" onclick="update_rating(this)" name="rating" value="3" /><label class = "full" for="star3" title="Good - 3 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Really Bad - 1.5 stars"></label>
    <input type="radio" onclick="update_rating(this)" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Unbearable - 1 star"></label>
    <input type="radio" onclick="update_rating(this)" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="Unbearable - 0.5 stars"></label>
</fieldset><br><br>


	<script type="text/javascript">
		function update_rating(ele){
			document.cookie="rated="+ele.value;

			/*var stars=document.getElementsByTagName("input");
			for(star in stars)
			{
				star.removeEventListener("onclick",update_rating)
			}*/
	}
	</script>
      <h2 class="mdc-typography mdc-typography--headline2 headline"><?php echo $rating; ?><i class="material-icons">star_rate</i></h2>
      <h3 class="mdc-typography mdc-typography--headline3 headline"><?php echo "$mpaa_list[$mpaa] · $language"; ?></h3>
      <br><br>
      <?php echo "Directed by: ".$director; ?><br>
      <?php echo "Filmed in: ". $location; ?><br><br>
      <?php echo"Runtime: ".$runtime; ?> minutes<br>
      <?php echo"Budget: ".$budget; ?> million<br>

      <br><br>

      <h2 class="mdc-typography mdc-typography--headline2 headline">Cast</h2>
      <ul class="mdc-list">
      <?php
          $query = mysqli_query($connection, "SELECT * FROM ACTED_IN WHERE MOVIE_ID=$id");

              while ($row = mysqli_fetch_assoc($query)) {
                $celebID = $row["CELEB_ID"];
                $role = $row["ROLE"];
                $celeb_name = mysqli_fetch_assoc(mysqli_query($connection, "SELECT NAME FROM CELEBRITY WHERE ID=$celebID"))["NAME"];

                  echo "<h2><li class='mdc-list-item' onclick='location.href=\"celeb.php?id=$celebID\";'><span class='mdc-list-item__text'>$celeb_name · $role</span></li></h2>";
              }
        ?>
      </ul>
      <br><br>

      <h2 class="mdc-typography mdc-typography--headline2 headline">Showtimes</h2>
      <ul class="mdc-list">
      <?php
          $query = mysqli_query($connection, "SELECT * FROM `SHOW` WHERE MOVIE_ID=$id");

              while ($row = mysqli_fetch_assoc($query)) {
                $showID = $row["ID"];
                $screenID = $row["SCREEN_ID"];
                $res1 = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM SCREEN WHERE ID=$screenID"));
                $screenName = $res1["NAME"];
                $screenLoc = $res1["LOCATION"];

                  echo "<li><h2>$screenName - $screenLoc</h2><ul class='mdc-list'>";
                  $query1 = mysqli_query($connection, "SELECT DATE_FORMAT(`TIME`, '%a, %b %d - %l:%i %p') AS F_TIME FROM SHOWTIME WHERE SHOW_ID=$showID");

              while ($row1 = mysqli_fetch_assoc($query1)) {
                $showTime = $row1["F_TIME"];
                echo "<li>$showTime</li>";
              }
                  echo "</ul></li>";
              }



        ?>
      </ul>

      <br><br>

      <button class="mdc-button mdc-button--outlined" onclick="location.href='movies.php';">
        <span class="mdc-button__label">Back</span>
      </button>
    </div>
    <script src="bundle.js"></script>
  </body>
  <script type="text/javascript">
    window.onload = function() {
      document.body.className = "mdc-typography"
    }
  </script>
</html>
