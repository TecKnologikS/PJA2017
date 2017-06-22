<?php

class Promo {
  public static function isGoodPromo($code) {
  	$result = fromJSON(
  							POST_REQ(
  								"http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/add/",
  								array( 'code' => $code ),
  								array("{id}", 					"{token}"),
  								array($_SESSION["id"], $_SESSION["token"])));

  	if ($result["insert"] == "OK") {
  		return true;
  	}

  	return false;
  }
}

?>
