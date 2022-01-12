<!DOCTYPE html>
<html>
<link href="form.css" rel="stylesheet" type="text/css">
<head>
                <title>Update Database</title>
</head>
<body>
                <h1 align="center">Enter Celebrity Details</h1>
<form style="text-align: center;" method="POST" action="movie_input.php">
                <br><input class="in" type="text" name="name" placeholder=" Celebrity Name" required><br>
                <br><label style="font-size: 20px;" >Gender : 
                                <select style="padding: 10px; width: 80px; border-radius: 5px;" name="gender">
                                                <option>M</option>
                                                <option>F</option>
                                </select>
                </label><br>
                <br><input class="in" type="textarea" name="job_titles" placeholder="Job titles" rows="3" cols="50"required><br>
                <br><input class="in" type="textarea" name="bio" placeholder="Bio" rows="10" col="50"><br>
                <br><input class="in" type="text" name="birth_loc" placeholder="Country" required><br>
                <br><input class="but" type="submit" name="submit" value="submit"><br>
</form>
</body>
</html>
<?php
                if($_POST)
    {
    $servername="localhost";
    $username="RAVI";
    $password="ravi@10";
    $dbname="movie";
    $conn=mysqli_connect($servername,$username,$password,$dbname);
    if(mysql_num_rows((my_sqli_query($conn,"SELECT * FROM MOVIE WHERE NAME=\$POST[\"name\"];"))) == 0)
    {
    $result = mysql_query($conn,"SELECT * FROM CELEBRITY;");
    $num_rows = mysql_num_rows($result)+1;
    $sql="INSERT INTO MOVIE VALUES(\$num_rows,\$POST[\"name\"],\$POST[\"gender\"],\$POST[\"job_titles\"],\$POST[\"bio\"],\$POST[\"birth_loc\"]);";
                mysql_query($conn,$sql);

                }
}
?>
