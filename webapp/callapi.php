<?php

session_start();
if (isset($_GET["function"])) {
  switch ($_GET["function"]) {
    case 'addToBasket':
    if (isset($_GET["id"])) {
      AddToBasket($_GET["id"]);
    }
      break;
      case 'removeToBasket':
      if (isset($_GET["id"])) {
        removeToBasket($_GET["id"]);
      }
        break;
      case 'getBasketAndDevis':
        getBasketAndDevis();
        break;
        case 'updateToBasket':
        if (isset($_GET["id"]) && isset($_GET["qte"])) {
          updateToBasket($_GET["id"], $_GET["qte"]);
        }
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

function removeToBasket($id) {
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
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/remove/";
  $result = file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context);
  print_r($result);
}

function getBasketAndDevis() {
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/count_bag_and_devis/";

    $result  = file_get_contents(
        str_replace(
          array("{id}", 					"{token}"),
          array($_SESSION["id"], $_SESSION["token"]),
          $service_url));

  print_r($result);
}

function updateToBasket($id, $qte) {
  $postdata = http_build_query(
      array(
          'id' => $id,
          'qte' => $qte
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
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/update/";
  $result = file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context);
  print_r($result);
}

?>
