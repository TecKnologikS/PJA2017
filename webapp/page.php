<?php
require("part/basicFunctionLoad.php");

if (!isset($_GET["id"])) {
	header('Location: index.php');
}

if (isset($_GET["added"]))
  if ($_GET["added"] == "true")
      Succed(S_ADD_TO_BAG);

$bag = fromJSON(
					GET_REQ(
						"http://commercial.tecknologiks.com/index.php/{id}/{token}/products/{id_p}/",
						array("{id}", 					"{token}", 					"{id_p}"),
						array($_SESSION["id"], $_SESSION["token"], $_GET["id"])));
if (count($bag) > 0) {
	$article = $bag[0];
} else {
	header('Location: index.php');
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div style="padding-top: 70px; height:100vh; width:70vw; background-color:white; margin-left: auto; margin-right:auto;">
	<div style="margin: 20px 20px 20px 20px;">
		<h1 style="text-align:center;"><?= $article["name"] ?></h1>
		<p style="text-align:center; font-style: italic;"><?= $article["smallDesc"] ?></p>
		<table  style="margin-left:auto; margin-right:auto;" class="addition" style="margin-left: 0px;">
			<tbody>
				<tr><td colspan="2"><h4 style="text-align:center"><?= S_ADDTOBASKET ?></h4></td></tr>
				<tr><td><?= S_NUMBER ?></td><td><input type='number' min=1 name="nomber" value="1" /></td></tr>
				<tr><td colspan="2" style="padding: 0;"><input value="Ajouter" class="btn btn-success" style="font-size: 1.0em; width:100%; padding: 20px 20px 20px 20px; font-size: 1.5em;" onclick="addToBasketFromPage(<?= $article['id'] ?>);"></td></tr>
			</tbody>
		</table>
		<br />
		<div  style="margin: 20px 0px 10px 0px;">
				<?= $article["about"] ?>
		</div>
	</div>


	</div>
</body>
</html>
