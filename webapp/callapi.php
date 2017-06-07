<?php

session_start();
if (isset($_GET["function"]) && isset($_GET["id"])) {
  switch ($_GET["function"]) {
    case 'addToBasket':
      AddToBasket($_GET["id"]);
      break;

    default:
      # code...
      break;
  }
}


function AddToBasket($id) {
  $postdata = http_build_query(
      array(
          'id' => $id
      )
  );

  $opts = array('http' =>
      array(
          'method'  => 'POST',
          'header'  => 'Content-type: application/x-www-form-urlencoded',
          'content' => $postdata
      )
  );

  $context  = stream_context_create($opts);
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/add/";
  $result = file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context);
  print_r($result);
}


?>
