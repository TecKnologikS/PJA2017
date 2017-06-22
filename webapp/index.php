<?php
require_once("part/basicFunctionLoad.php");



$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/products";
if(isset($_POST["search"]))
	if (strlen($_POST["search"]) > 2 )
		$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/products/search/".utf8_encode($_POST["search"])."/";

$articles = fromJSON(
							GET_REQ(
								$service_url,
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
	<div class="container-fluid" style="margin-top: 35px;">
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th><?= S_PRODUCTNAME ?></th>
							<th><?= S_PRODUCTDESCRIPTION ?></th>
							<th style="width:60px; text-align: right;"><?= S_COMMANDE ?></th>
							<th style="width:60px; text-align: right;"><?= S_UNITYPRICE ?></th>
							<th style="width:40px;"></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$toshow = "<tr>
													<td><a href='page.php?id={id_product}'>{name}</a></td>
													<td>{descr}</td>
													<td style='text-align:right;'>{commande}</td>
													<td style='text-align:right;'><i class='material-icons' style='vertical-align:bottom'>euro_symbol</i> {prix}</td>
													<td style='text-align:center;'>{btn}</td>
												</tr>";
						$btn = '<a id="addIt" type="button" class="btn btn-success" value="+" onclick="addToBasket({id_product});"><i class="material-icons">add_shopping_cart</i></a>';

						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
								echo str_replace(
									array("{id_product}",								"{name}", 					"{descr}", 										"{prix}" , 							"{btn}", "{commande}"),
									array($articles[$i]["id"], $articles[$i]["name"], $articles[$i]["smallDesc"], $articles[$i]["prix"], str_replace("{id_product}", $articles[$i]["id"], $btn), $articles[$i]["nb_commande"]),
									$toshow);
							}
						} else {
							Error(S_ERREUR);
						}
						?>
					</tbody>
		</table>

	</div>
</body>
</html>
