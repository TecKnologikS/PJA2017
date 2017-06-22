<?php

session_start();
if (!isset($_SESSION["id"])) {
	header('Location: login.php');
}
include('part/language.php');
include('const/param.php');


function Message($message) {
	InformationMessage("info_message", $message, 5000);
}

function Error($message) {
	InformationMessage("alert_message", $message, 3000);
}

function Succed($message) {
	InformationMessage("succed_message", $message, 3000);
}

function InformationMessage($type, $message, $duration) {
	echo '<div id="information_message" class="'.$type.'"><i style="vertical-align:middle; margin-right: 20px;" class="material-icons">warning</i> '.$message.'<a onclick="document.getElementById(\'information_message\').remove();">X<a></div>
				<script>
				setTimeout(function() {
				    document.getElementById("information_message").remove();
				}, '.$duration.');
				</script>';
}

function POST_REQ($url, $body, $param, $value) {
	REQ($url, $body, $param, $value, "POST");
}

function DELETE_REQ($url, $body, $param, $value) {
	REQ($url, $body, $param, $value, "DELETE");
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
  print_r(
		file_get_contents(
			str_replace(
	      $param,
	      $value,
	      $url),
    	false,
    	$context));
}

function GET_REQ($url, $param, $value) {
	print_r(
		file_get_contents(
		  str_replace(
		    $param,
		    $value,
		    $url)));
}


?>
