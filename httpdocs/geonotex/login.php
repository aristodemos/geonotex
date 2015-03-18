<?php

// connect to the mysql server
$con = mysql_connect("localhost", "k35270_1", "portoriko");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("k35270_1", $con);

$match = "select user_id from users where user_name = '".$_POST['user_name']."'
and user_pass = '".$_POST['password']."';"; 

$user_name=$_POST['user_name'];

$qry = mysql_query($match)
or die ("Could not match data because ".mysql_error());
$num_rows = mysql_num_rows($qry); 

if ($num_rows <= 0) { 
echo "Sorry, there is no username $user_name with the specified password.
";
echo "Try again";
exit; 
} else {

setcookie("loggedin", "TRUE", time()+(3600 * 24));
setcookie("mysite_username", $user_name);
//echo "You are now logged in!"; 
//echo "Continue to the members section.";

header("Location: http://pafi.kodingen.com/geonotex/");
}
?>