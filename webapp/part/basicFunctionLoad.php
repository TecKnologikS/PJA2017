<?php

session_start();
if (!isset($_SESSION["id"])) {
	header('Location: login.php');
}
include('part/language.php');
include('const/param.php');

?>
