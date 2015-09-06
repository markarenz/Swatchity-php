<?php
$db_host="esquelle.ridiculopathy.dreamhosters.com";
$db_user="swatchity_mysql";
$db_password="oSbNu7f29bN_d6cyski";
$db_selected_db="swatchity_mysql";

// v4 uses mysqli in procedural mode
$db=mysqli_connect($db_host, $db_user, $db_password, $db_selected_db);
if(mysqli_connect_errno() ){
    die('Unable to connect to database [' . mysqli_connect_error() . ']');
}
$db_password="";


?>