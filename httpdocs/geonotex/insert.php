<?php
$con = mysql_connect("localhost", "k35270_1", "portoriko");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("k35270_1", $con);
$mysqldate = date( 'Y-m-d H:i:s');

$sql="INSERT INTO notes(note_id, user_name, date, text, longitude, lat) 
    VALUES (NULL, '$_POST[username]', '$mysqldate','$_POST[note]','$_POST[longclicked]','$_POST[latclicked]')";
if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }
//echo "1 note added!!";
header("Location: http://pafi.kodingen.com/geonotex/");

mysql_close($con)
?>