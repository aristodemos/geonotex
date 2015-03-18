select users.user_name,notes.text, acos(SIN( PI()* $lat_parameter /180 )*SIN( PI()*notes.latitude/180 )
)+(cos(PI()* $lat_parameter /180)*COS( PI()*notes.latitude/180) *COS(PI()*notes.longitude/180-PI()*$lon_parameter /180)
)* 3963.191 AS distance
FROM users, notes, lastupdateusers
WHERE users.user_ID = notes.user_ID
AND $usrid = lastupdateusers.user_ID (+)
AND notes.Date_Created >= lastupdateusers.Date

AND 3963.191 * ACOS( (SIN(PI()* $lat_parameter /180)*SIN(PI() * notes.latitude/180)) +
(COS(PI()* $lat_parameter /180)*cos(PI()*notes.latitude/180)*COS(PI() * notes.longitude/180-PI()*$lon_parameter /180))
) < = 1.5 $radius
ORDER BY 3963.191 * ACOS(
(SIN(PI()* $lat_parameter /180)*SIN(PI()*notes.latitude/180)) +
(COS(PI()* $lat_parameter /180)*cos(PI()*notes.latitude/180)*COS(PI() * notes.longitude/180-PI()*$lon_parameter /180))
)

We assume the following distances in relation to our earth’s radius (R)
6378137 meters, 6378.137 km, 3963.191 miles, 3441.596 nautical miles
We will use these in our computation for distance from point if we want to use miles, kilo’s or meters from our starting point, if you really wanted to get crazy then 6378137 meters = 20925646.3 feet so you could literally search for something within several hundred feet of yourself.

asciiname         : name of geographical point in plain ascii characters, varchar(200)
latitude          : latitude in decimal degrees (wgs84)
longitude         : longitude in decimal degrees (wgs84) coordinates


http://blog.peoplesdns.com/archives/24
http://download.geonames.org/export/dump/readme.txt