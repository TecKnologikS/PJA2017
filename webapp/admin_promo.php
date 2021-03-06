<?php
require("part/basicFunctionLoad.php");

isAdminOrExit();

if (isset($_GET["delete"]))
  if ($_GET["delete"] == "true")
      Succed(S_DELETED_PROMO);


if (isset($_POST["libelle"]) && isset($_POST["code"]) && isset($_POST["reduction"]) && isset($_POST["minimum"])) {
  $result = fromJSON(
              POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/insert/",
                array(  'libelle' => $_POST["libelle"],
                        'code' => $_POST["code"],
                        'reduction' => $_POST["reduction"],
                        'minimum' => $_POST["minimum"] ),
                array("{id}", 					"{token}"),
                array($_SESSION["id"], $_SESSION["token"])));
    if ($result["insert"]){
      Succed($_POST["code"]." ".S_CREATED_PROMO);
    } else {
      Error($_POST["code"]." ".S_ERROR_CREATED_PROMO);
    }
}

$promos = fromJSON(
            GET_REQ(
              "http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/",
              array("{id}", 					"{token}"),
              array($_SESSION["id"], $_SESSION["token"])));


?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 70px;">

    <form action="/admin_promo.php" method="post" >
			<table class="devis" style="margin: 0 auto 0 auto; ">
        <thead>
          <tr><th colspan="4"><h4>Nouveau code promotionnel</h4></th></tr>
          <tr>
            <th>Libelle</th>
            <th>Code</th>
            <th style="text-align: right;">Reduction (en %)</th>
            <th style="text-align: right;">Minimum d'Achat</th>
          </tr>
        </thead>
				<tbody>
          <tr>
            <td><input type="text" name="libelle" placeholder="Libelle" pattern=".{1,}" required /></td>
            <td><input type="text" name="code" placeholder="Code" pattern=".{1,}" required /></td>
            <td><input type="number" name="reduction" placeholder="Reduction en %" pattern=".{1,}" required /></td>
            <td><input type="number" name="minimum" placeholder="Minimum en €" pattern=".{1,}" required /></td>
          </tr>
					<tr><td class="gris" colspan="4" style="padding:0;"><input type="submit" value="Ajouter" class="btn btn-info" style="font-size: 1.5em; width:100%; height:50px;"></td></tr>
				</tbody>
			</table>
		</form>
    <br />
    <br />
    <table class="devis" style="margin: 0 auto 0 auto; ">
      <thead>
        <tr><th colspan="5"><h4>Liste codes promotionnels</h4></th></tr>
        <tr>
          <th>Libelle</th>
          <th>Code</th>
          <th style="text-align: right;">Reduction</th>
          <th style="text-align: right;">Minimum d'Achat</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
          <?php
          $ligne = '<tr>
                      <td>{libelle}</td>
                      <td>{code}</td>
                      <td style="text-align: right;">{reduction} %</td>
                      <td style="text-align: right;">{minimum} €</td>
                      <td><a onclick="removeCode({id});"><i class="material-icons" style="vertical-align: bottom; color:#F44336;">delete</i></a></td>
                    </tr>';
                    if (count($promos) > 0) {
                      for($i = 0; $i < count($promos); $i++) {
                        echo str_replace(
                          array("{libelle}",								"{code}", 					"{reduction}", 			"{minimum}", "{id}" ),
                          array($promos[$i]["Nom"], $promos[$i]["Code"], $promos[$i]["Reduction"], $promos[$i]["Minimum"], $promos[$i]["ID"]),
                          $ligne);
                      }
                    } else {
                      $error = "ERREUR";
                    }

          ?>
      </tbody>
    </table>
	</div>
</body>
</html>
