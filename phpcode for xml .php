<?php 
header("Content-type: text/xml"); 

$host = "localhost"; 
$user = "root"; 
$pass = ""; 
$database = "test"; 

$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($database, $linkID) or die("Could not find database."); 

$query = "SELECT * FROM blog ORDER BY date DESC"; 
$resultID = mysql_query($query, $linkID) or die("Data not found."); 

$xml_output = "<?xml version=\"1.0\"?>\n"; 
$xml_output .= "<entries>\n"; 

for($x = 0 ; $x < mysql_num_rows($resultID) ; $x++){ 
    $row = mysql_fetch_assoc($resultID); 
    $xml_output .= "\t<entry>\n"; 
    $xml_output .= "\t\t<date>" . $row['date'] . "</date>\n"; 
        // Escaping illegal characters 
        $row['text'] = str_replace("&", "&", $row['text']); 
        $row['text'] = str_replace("<", "<", $row['text']); 
        $row['text'] = str_replace(">", "&gt;", $row['text']); 
        $row['text'] = str_replace("\"", "&quot;", $row['text']); 
    $xml_output .= "\t\t<text>" . $row['text'] . "</text>\n"; 
    $xml_output .= "\t</entry>\n"; 
} 
$xml_output .= "</entries>"; 
echo $xml_output; 

?> 
