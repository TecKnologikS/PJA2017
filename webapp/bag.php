<?php
require("part/basicFunctionLoad.php");
require("function/Promo.php");

if (isset($_POST["codepromo"])) {
	if (Promo::isGoodPromo($_POST["codepromo"])) {
		Succed($_POST["codepromo"]." ".S_CODE_PROMO_ADD);
	} else {
		Error($_POST["codepromo"]." ".S_CODE_PROMO_FALSE);
	}
}

if (isset($_GET["delete"]))
  if ($_GET["delete"] == "true")
      Succed(S_DELETED_BAG);

if (isset($_GET["update"]))
  if ($_GET["update"] == "true")
      Succed(S_UPDATE_BAG);

$bag = fromJSON(
				GET_REQ(
					"http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/",
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
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th style="width: 20px;"></th>
							<th style='text-align:center;'><?= S_PRODUCTNAME ?></th>
							<th style="width: 160px;text-align:center;"><?= S_QUANTITE ?></th>
							<th style='text-align:right;width: 100px;'><?= S_UNITYPRICE ?></th>
							<th style='text-align:right;width: 100px;'><?= S_BASEPRICE ?></th>
							<th style='text-align:right;width: 120px;'><?= S_REDUCTION ?></th>
							<th style='text-align:right;width: 100px;'><?= S_FINALPRICE ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$toshow = "<tr>
												<td><a onclick='removeToBasket({id_product})'><i class='material-icons' style='vertical-align: bottom; color:#F44336;'>delete</i></a></td>
												<td><a href='page.php?id={id_product}'>{name}</a></td>
												<td style='text-align:right;'><input name='qte' type='number' min=1 value='{qte}' style='width:100px;'><a  style='margin-left:10px;' onclick='updateToBasket(this, {id_product})'><i class='material-icons' style='vertical-align: bottom;'>cached</i></a></td>
												<td style='text-align:right;'>€ {prix_unitaire}</td>
												<td style='text-align:right;'>€ {prix_base}</td>
												<td style='text-align:right;'>€ {reduction}</td>
												<td style='text-align:right;'>€ {prix_final}</td>
											</tr>";

						$articles = $bag["articles"];
						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
            		echo str_replace(
									array("{id_product}",			 "{name}", 							"{qte}", 							"{prix_base}" , 						"{prix_final}", 							"{prix_unitaire}", 		 "{reduction}",																																	),
									array($articles[$i]["id"], $articles[$i]["name"], $articles[$i]["Qte"], $articles[$i]["prix_group"], $articles[$i]["prix_final"], $articles[$i]["prix"], $articles[$i]["reduction"]." (".(($articles[$i]['reduction']*100) / $articles[$i]['prix_group'])." %)"),
									$toshow);
							}
						}


						?>

					</tbody>
		</table>
		<br />
		<form action="/bag.php" method="post" style="margin-left: 20px;">
			<table class="addition" style="margin-left: 20px; float: left;">
				<tbody>
					<tr><td colspan="2" style="text-align:center;"><h4><?= S_CODEMORE ?></h4></td></tr>
					<tr><td><?= S_CODE ?></td><td><input type="text" name="codepromo" pattern=".{1,}" required /></td></tr>
					<tr><td colspan="2" style="padding:0;"><input type="submit" value="Ajouter" class="btn btn-info" style="font-size: 1.5em; width:100%; height:50px;"></td></tr>
				</tbody>
			</table>
		</form>
		<table class="addition" style="float: right;">
			<tbody>

				<?php
				$promo = $bag["promo"];
					if (count($promo) > 0) {
							echo '<tr> <td colspan="2" style="text-align:center;"><h4>Code Promo</h4></td></tr>';
							for($i = 0; $i < count($promo); $i++) {
								echo '<tr> <td>'.$promo[$i]["Code"].'</td><td>'.$promo[$i]["Nom"].'</td> </tr>';
							}
					}
				?>
				<tr> <td colspan="2" style="text-align:center;border-bottom: 2px solid #E0E0E0;border-top: 2px solid #E0E0E0;"><h4><?= S_ADDITION ?></h4></td></tr>
				<tr> <td class><?= S_TOTALPRICE ?></td><td><?php echo  $bag["prix_total"]; ?> €</td> </tr>
				<tr> <td><?= S_REDUCTION ?></td><td><?php echo  "(".round((($bag['reduction_total']/$bag['prix_total'])*100), 2)." %) ".$bag["reduction_total"]; ?> €</td> </tr>
				<tr> <td><?= S_FINALPRICE ?></td><td><?php echo  $bag["prix_final"]; ?> €</td> </tr>
			</tbody>

			<tfoot>
				<tr>
					<td style="border: none; padding:0;" colspan="2"><a href="./validate.php"><button class="btn btn-success" style="font-size: 1.5em; width:100%; height:50px;"><?php echo S_VALIDER; ?></button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
