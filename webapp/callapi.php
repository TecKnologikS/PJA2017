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
    case 'updateMDP':
      if (isset($_GET["id"]) && isset($_GET["mdp"])) {
        updateMDP($_GET["id"], $_GET["mdp"]);
      }
      break;
    case 'updateSTATUT':
      if (isset($_GET["id"]) && isset($_GET["statut"])) {
        updateSTATUT($_GET["id"], $_GET["statut"]);
      }
      break;
    case 'removeUser':
      if (isset($_GET["id"])) {
        removeUser($_GET["id"]);
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

function updateMDP($id, $mdp) {
  $postdata = http_build_query(
      array(
          'id' => $id,
          'mdp' => $mdp
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
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/users/update/mdp";
  $result = file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context);
  print_r($result);
}

function updateSTATUT($id, $statut) {
  $postdata = http_build_query(
      array(
          'id' => $id,
          'statut' => $statut
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
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/users/update/statut";
  $result = file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context);
  print_r($result);
}

function removeUser($id) {
  $postdata = http_build_query(
      array(
          'id' => $id
      )
  );

  $opts = array('http' =>
      array(
          'method'  => 'DELETE',
          'header'  => 'Content-type: application/x-www-form-urlencoded',
          'content' => $postdata
      )
  );

  $context  = stream_context_create($opts);
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/users/delete/";
  $result = file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context);
  print_r($result);
}
function removeCode($id) {
  $postdata = http_build_query(
      array(
          'id' => $id
      )
  );

  $opts = array('http' =>
      array(
          'method'  => 'DELETE',
          'header'  => 'Content-type: application/x-www-form-urlencoded',
          'content' => $postdata
      )
  );

  $context  = stream_context_create($opts);
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/delete/";
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
