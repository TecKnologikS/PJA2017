<?php

session_start();
if (!isset($_SESSION["id"])) {
	header('Location: login.php');
}
include('part/language.php');
include('const/param.php');

// Accepte les admins, pas les users
function isAdminOrExit() {
	if (!isset($_SESSION["id"]) && $_SESSION["really"] != true)
	  header('Location: index.php');
}

//Types de message
function Message($message) {
	InformationMessage("info_message", $message, 5000);
}

function Error($message) {
	InformationMessage("alert_message", $message, 3000);
}

function Succed($message) {
	InformationMessage("succed_message", $message, 3000);
}

//Les messages appellent cette fonction
//Affiche la barre en bas du site (rouge, verte...) avec le message de succes ou erreur
function InformationMessage($type, $message, $duration) {
	echo '<div id="information_message" class="'.$type.'"><i style="vertical-align:middle; margin-right: 20px;" class="material-icons">warning</i> '.$message.'<a onclick="document.getElementById(\'information_message\').remove();">X<a></div>
				<script>
				setTimeout(function() {
					var element =  document.getElementById("information_message");
					if (typeof(element) != \'undefined\' && element != null)
					{
					  document.getElementById("information_message").remove();
					}
				}, '.$duration.');
				</script>';
}

function POST_REQ($url, $body, $param, $value) {
	return REQ($url, $body, $param, $value, "POST");
}

function DELETE_REQ($url, $body, $param, $value) {
	return REQ($url, $body, $param, $value, "DELETE");
}

function REQ($url, $body, $param, $value, $type) {

	$postdata = http_build_query( $body );

  $opts = array('http' =>
      array(
          'method'  => $type,
          'header'  => 'Content-type: application/x-www-form-urlencoded',
          'content' => $postdata
      )
  );

  $context  = stream_context_create($opts);
  return file_get_contents(
			str_replace(
	      $param,
	      $value,
	      $url),
    	false,
    	$context);
}

function GET_REQ($url, $param, $value) {
		return file_get_contents(
		  str_replace(
		    $param,
		    $value,
		    $url));
}

function fromJSON($var) {
	return json_decode($var, true);
}


?>
