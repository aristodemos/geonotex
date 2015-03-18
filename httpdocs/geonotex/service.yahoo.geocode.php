<?php 

// Get input parameter 
$sqlo = (isset($_GET['qlo']) ? $_GET['qlo'] : ''); 
$sqla = (isset($_GET['qla']) ? $_GET['qla'] : ''); 
$smsg = (isset($_GET['msg']) ? $_GET['msg'] : ''); 
$susr = (isset($_GET['usr']) ? $_GET['usr'] : ''); 
$radius = (isset($_GET['r']) ? $_GET['r'] : ''); 

//echo $sqla;
//echo $smsg; 
//echo $sqlo; 
//echo $susr; 

    //connect and select database
    mysql_connect("localhost", "k35270_1", "portoriko");
    mysql_select_db("k35270_1");

$mysqldate = date( 'Y-m-d H:i:s');
 
if ($smsg != NULL) {
	$sql2 = "INSERT INTO `notes`(`note_id`, `user_name`, `date`,`text`,`longitude`, `lat`) VALUES (NULL, \"$susr\", \"$mysqldate\",\"$smsg\",$sqlo,$sqla)";
	$test = mysql_query($sql2) or trigger_error(mysql_error().$sql2);
	}
		//$result = mysql_query("SELECT user_name FROM lastupdate WHERE user_name='$susr'");
	
		//if(!mysql_num_rows($result)){
		//	$sql4 = "INSERT INTO `lastupdate`(`user_name`,`date`,`lon`, `lat`) VALUES (\"$susr\", \"2011-12-01 10:00:21\",$sqlo,$sqla)";
		//	$test = mysql_query($sql4) or trigger_error(mysql_error().$sql4);
		//}

$lat_parameter = $sqla;
$lon_parameter = $sqlo;
	
$result = mysql_query("SELECT note_id, user_name, date, text, lat, longitude, ACOS(SIN( PI()* $lat_parameter /180 )*SIN( PI()*lat/180 ))+(COS(PI()* $lat_parameter /180)*COS( PI()*lat/180) *COS(PI()*longitude/180-PI()*$lon_parameter /180))* 3963.191 AS distance
FROM notes
WHERE 1 = 1

AND 3963.191 * ACOS( (SIN(PI()* $lat_parameter /180)*SIN(PI() * lat/180)) + (COS(PI()*$lat_parameter/180)*cos(PI()*lat/180)*COS(PI()*longitude/180-PI()*$lon_parameter /180))) <=$radius
ORDER BY 3963.191 * ACOS( (SIN(PI()* $lat_parameter /180)*SIN(PI() * lat/180)) + (COS(PI()*$lat_parameter/180)*cos(PI()*lat/180)*COS(PI()*longitude/180-PI()*$lon_parameter /180)))
DESC LIMIT 10");

if (mysql_num_rows($result)){
$xml_output = "<?xml version=\"1.0\"?>\n"; 
$xml_output .= "<allNotes>\n"; 

for($x = 0 ; $x < mysql_num_rows($result) ; $x++){ 
    $row = mysql_fetch_assoc($result); 
    $xml_output .= "\t<Note>\n"; 
        // Escaping illegal characters 
        $row['text'] = str_replace("&", "&", $row['text']); 
        $row['text'] = str_replace("<", "<", $row['text']); 
        $row['text'] = str_replace(">", "&gt;", $row['text']); 
        $row['text'] = str_replace("\"", "&quot;", $row['text']);
    $xml_output .= "\t\t<noteid>" . $row['note_id'] . "</noteid>\n"; 		
    $xml_output .= "\t\t<text>" . $row['text'] . "</text>\n"; 
	$xml_output .= "\t\t<UserName>" . $row['user_name'] . "</UserName>\n";
	$xml_output .= "\t\t<DateCreated>" . $row['date'] . "</DateCreated>\n";
	$xml_output .= "\t\t<Longitude>" . $row['longitude'] . "</Longitude>\n";
	$xml_output .= "\t\t<Latitude>" . $row['lat'] . "</Latitude>\n";
	$xml_output .= "\t\t<Distance>" . $row['distance'] . "</Distance>\n";
    $xml_output .= "\t</Note>\n"; 
	} 
$xml_output .= "</allNotes>"; 
echo $xml_output;

		mysql_free_result($result);
		
}
$resultt = mysql_query("SELECT user_name FROM lastupdate WHERE user_name='$susr'");
	//$row = mysql_fetch_assoc($result);
		if(mysql_num_rows($resultt)){
			$sql1 = "UPDATE lastupdate SET date = '$mysqldate', lat='$sqla', lon='$sqlo' WHERE user_name = \"$susr\" ";
			$test = mysql_query($sql1) or trigger_error(mysql_error().$sql1);
		}
		else {
			$sql4 = "INSERT INTO `lastupdate`(`user_name`,`date`,`lon`, `lat`) VALUES (\"$susr\", \"$mysqldate\",$sqlo,$sqla)";
			$test = mysql_query($sql4) or trigger_error(mysql_error().$sql4);
		}
mysql_free_result($resultt);
mysql_close();
?>


