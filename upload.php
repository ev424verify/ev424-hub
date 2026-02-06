<?php
$PW="ev424upload2026";
if(!isset($_POST["pw"])||$_POST["pw"]!==$PW){exit("AUTH FAIL");}
if(!isset($_FILES["file"])){exit("NO FILE");}
$t=__DIR__."/assets/logo/".basename($_FILES["file"]["name"]);
if(move_uploaded_file($_FILES["file"]["tmp_name"],$t)){echo "UPLOAD OK";}else{echo "FAIL";}
?>
