<?php
require("part/basicFunctionLoad.php");

if (!isset($_GET["id"]))
  header('Location: index.php');

$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/devis/".$_GET["id"]."/";
$bag = json_decode(file_get_contents(
      str_replace(
        array("{id}", 					"{token}"),
        array($_SESSION["id"], $_SESSION["token"]),
        $service_url)), true);

$devis = $bag["devis"];
$articles = $bag["articles"];
$promo = $bag["promo"];

?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 70px;">
    <table class="addition" style="margin: 20px auto 20px auto; width:1000px">
      <thead>
        <tr><td colspan="4"><h3 style="text-align:center; font-weight:bold;">Information client</h3></td></tr>
      </thead>
      <tbody>
        <tr><td>Crée le :</td><td><?= $devis["Date_Creation"] ?></td><td>Expire le :</td><td><?= $devis["Date_Validity"] ?></td></tr>
        <tr><td>Société :</td><td><?= $devis["Societe"] ?></td><td>Siret :</td><td><?= $devis["Siret"] ?></td></tr>
        <tr><td>Téléphone :</td><td><?= $devis["Tel"] ?></td><td>Fax :</td><td><?= $devis["Fax"] ?></td></tr>
        <tr><td>Courriel :</td><td colspan="3"><?= $devis["Email"] ?></td></tr>
        <tr><td>Adresse :</td><td colspan="3"><?= $devis["Adresse"] ?></td></tr>
        <tr><td>Code Postal :</td><td><?= $devis["CP"] ?></td><td>Ville :</td><td><?= $devis["Ville"] ?></td></tr>
        <tr><td>Nom :</td><td><?= $devis["Nom"] ?></td><td>Prénom :</td><td><?= $devis["Prenom"] ?></td></tr>
        <tr><td colspan="4"><input type="submit" value="Se rendre chez le client" class="btn btn-info" style="font-size: 1.5em; width:100%; height: 50px"></td></tr>
      </tbody>
    </table>

    <table class="devis" style="margin: 20px auto 20px auto; width:1000px">
      <thead>
        <tr><th colspan="6"><h3 style="text-align:center; font-weight:bold;">Contenu</h3></th></tr>
        <tr><th>Libellé</th><th>Prix Unitaire</th><th>Quantité</th><th>Prix</th><th>Réduction</th><th>Prix final</th></tr>
      </thead>
      <tbody>
        <?php
        $ligne = "<tr>"
                    ."<td>{libelle}</td>"
                    ."<td>{unit}</td>"
                    ."<td>{qte}</td>"
                    ."<td>{prix}</td>"
                    ."<td>{reduct}</td>"
                    ."<td>{final}</td>"
                  ."</tr>";

        for($i = 0; $i < count($articles); $i++) {
          echo str_replace(
              array("{libelle}", 					"{unit}", 					"{qte}", 					"{prix}", 					"{reduct}", 					"{final}"),
              array($articles[$i]["name"], $articles[$i]["prix"], $articles[$i]["Qte"], $articles[$i]["Prix"], $articles[$i]["Reduction"], $articles[$i]["Prix_final"]),
              $ligne);
      	}
        ?>
      </tbody>
    </table>
    <table class="addition" style="margin: 20px auto 20px auto; width:500px">
      <thead>
        <tr><th colspan="6"><h3 style="text-align:center; font-weight:bold;">Récapitulatif</h3></th></tr>
      </thead>
      <tbody>
        <?php
          if (count($promo) > 0) {
              echo '<tr><td colspan="2" style="text-align:center;">Promotions</td></tr>';
              for($i = 0; $i < count($promo); $i++) {
                echo '<tr> <td>'.$promo[$i]["Code"].'</td><td>'.$promo[$i]["Nom"].'</td> </tr>';
              }
          }
        ?>
        <tr>
          <td colspan="2" style="text-align:center; border-bottom: 2px solid #E0E0E0; border-top: 2px solid #E0E0E0;">Addition</td>
        </tr>
        <tr>
          <td>Prix :</td>
          <td><?= $devis["Prix"] ?> €</td>
        </tr>
        <tr>
          <td>Réduction :</td>
          <td><?= $devis["Reduction"] ?> €</td>
        </tr>
        <tr>
          <td>Prix à payer :</td>
          <td style="font-size:1.5em;"><b><?= $devis["Prix_final"] ?> €</b></td>
        </tr>
      </tbody>
    </table>
	</div>
</body>
</html>
