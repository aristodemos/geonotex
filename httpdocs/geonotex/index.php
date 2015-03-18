<?php
    mysql_connect("localhost", "k35270_1", "portoriko");
	mysql_select_db("k35270_1");
    $myquery = "SELECT * FROM `notes` WHERE 1";
	$testresult = mysql_query($myquery) or trigger_error(mysql_error().$myquery);
	$testrows=mysql_num_rows($testresult);
	$n = array();
	for($i=0;$i<$testrows;$i++) 
	{ 
		$n[$i] = mysql_fetch_row($testresult);	
	}
    if (!isset($_COOKIE['mysite_username'])) echo "you are not logged in";
    else{
	$mysite_username=$HTTP_COOKIE_VARS["mysite_username"];
    echo "you are logged in as $mysite_username" ; }
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>Geonotexs</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=3&amp;sensor=false&amp;key=" type="text/javascript"></script>
    
  
	</head>
   
  <body onunload="GUnload()">
 
    <table border="1">
    <tr>
    <td>
    <div id="map" style="width: 900px; height: 900px"></div> </td>
    <td>
        <form>
      <INPUT TYPE="BUTTON" VALUE="Log IN" ONCLICK="window.location.href='http://pafi.kodingen.com/geonotex/login.html'"> 
    </form>
    <form action="insert.php" method="post">
    <div>Lat on click: 
      <input type="text" id="latclicked" name="latclicked" onkeypress="return event.keyCode!=13"><br></div>
    </div>
     <div>Lng on click: 
      <input type="text" id="longclicked" name="longclicked" onkeypress="return event.keyCode!=13"><br></div>
    </div>
    <div>User Name: 
    <input type="text" id="username" name="username" value=<?php echo $mysite_username?>>
    <br></div>
    </div>
     <div>Type your Note:<br> 
      <input type="text" id="note" name="note" style="width:300px; height:100px; border:1px inset gray;"onkeypress="return event.keyCode!=13"><br></div>
    </div> 
    <input type="submit" value="Submit GeoNote" />
    </form>
    <form action="logout.php" method="get">
      <input type="submit" value="Log oUT">
    </form>
    
    </td>
   
    </tr>
    </table>
    
    

    <noscript><b>JavaScript must be enabled in order for you to use Google Maps.</b> 
      However, it seems JavaScript is either disabled or not supported by your browser. 
      To view Google Maps, enable JavaScript by changing your browser options, and then 
      try again.
    </noscript>
 

    <script type="text/javascript">
    //<![CDATA[
    
    if (GBrowserIsCompatible()) { 

      // A function to create the marker and set up the event window
      // Dont try to unroll this function. It has to be here for the function closure
      // Each instance of the function preserves the contends of a different instance
      // of the "marker" and "html" variables which will be needed later when the event triggers.    
      function createMarker(point,html) {
        var marker = new GMarker(point);
        GEvent.addListener(marker, "click", function() {
          marker.openInfoWindowHtml(html);
        });
        return marker;
      }
    
	 var jsonarray = <?php echo json_encode($n); ?>;
	  
	  // Display the map, with some controls and set the initial location 
	  var map = new GMap2(document.getElementById("map"));
      map.addControl(new GLargeMapControl());
      map.addControl(new GMapTypeControl());
      map.setCenter(new GLatLng(34.9667085,32.829418),8);
          GEvent.addListener(map,'click',function(overlay,point)
          {
          	document.getElementById('latclicked').value = point.lat()
              document.getElementById('longclicked').value = point.lng()
          });
	     
      // Set up three markers with info windows 
     var i=0;
	 for (i=0;i<jsonarray.length;i++)
	 {
      var point = new GLatLng(jsonarray[i][5],jsonarray[i][4]);
	  var marker = createMarker(point, 'UserName:'+jsonarray[i][1]+'<br>'+jsonarray[i][3]+'<br>Date:'+jsonarray[i][2])
	  
      map.addOverlay(marker);
	  
	  }
    }
    
    // display a warning if the browser was not compatible
    else {
      alert("Sorry, the Google Maps API is not compatible with this browser");
    }

    // This Javascript is based on code provided by the
    // Community Church Javascript Team
    // http://www.bisphamchurch.org.uk/   
    // http://econym.org.uk/gmap/

    //]]>
    </script>
			
  </body>

</html>



