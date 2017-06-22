<?php
require_once("part/basicFunctionLoad.php");

if (isset($_GET["function"])) {
  switch ($_GET["function"]) {
    case 'addToBasket':
      if (isset($_GET["id"])) {
        if (isset($_GET["nb"])) {
          AddToBasketNb($_GET["id"], $_GET["nb"]);
        } else {
          AddToBasket($_GET["id"]);
        }
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
    case 'removeCode':
      if (isset($_GET["id"])) {
        removeCode($_GET["id"]);
      }
      break;
    case 'removeDevis':
      if (isset($_GET["id"])) {
        removeDevis($_GET["id"]);
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
  AddToBasketNb($id, 1);
}

function AddToBasketNb($id, $nb) {
  print_r(
    POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/add/",
      array('id' => $id, 'nb' => $nb ),
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function removeToBasket($id) {
  print_r(
    POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/remove/",
      array( 'id' => $id ),
      array("{id}",         "{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function updateMDP($id, $mdp) {
  print_r(
    POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/users/update/mdp",
      array( 'id' => $id, 'mdp' => $mdp ),
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function updateSTATUT($id, $statut) {
  print_r(
    POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/users/update/statut",
      array( 'id' => $id, 'statut' => $statut ),
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function removeUser($id) {
  print_r(
    DELETE_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/users/delete/",
      array( 'id' => $id ),
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}
function removeCode($id) {
  print_r(
    DELETE_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/delete/",
      array( 'id' => $id ),
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function removeDevis($id) {
  print_r(
    DELETE_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/devis/delete/",
      array( 'id' => $id ),
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function getBasketAndDevis() {
  print_r(
    GET_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/count_bag_and_devis/",
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

function updateToBasket($id, $qte) {
  print_r(
    POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/update/",
      array( 'id' => $id, 'qte' => $qte ),
      array("{id}", 				"{token}"),
      array($_SESSION["id"], $_SESSION["token"])));
}

?>
