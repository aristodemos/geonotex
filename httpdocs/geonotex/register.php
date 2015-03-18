<?php

$con = mysql_connect("localhost", "k35270_1", "portoriko");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("k35270_1", $con);

// check if the username is taken
$check = "select user_id from users where user_name = '".$_POST['username']."';"; 
$qry = mysql_query($check) or die ("Could not match data because ".mysql_error());
$num_rows = mysql_num_rows($qry); 
if ($num_rows != 0) { 
echo "Sorry, there the username $username is already taken.
";
echo "Try again";
exit; 
} else {

// insert the data
$insert = mysql_query("insert into users values ('NULL', '".$_POST['username']."', '".$_POST['password']."')")
or die("Could not insert data because ".mysql_error());

// print a success message
echo "Your user account has been created!
"; 
echo "Now you can log in"; 
}


?>
<html><head>
<title>User Registration</title>
</head><body>
<form>
<INPUT TYPE="BUTTON" VALUE="Log iN" ONCLICK="window.location.href='http://pafi.kodingen.com/geonotex/login.html'">
</form>
</body></html>