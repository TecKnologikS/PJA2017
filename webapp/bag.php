<?php
require("part/basicFunctionLoad.php");

function isGoodPromo($code) {
	$postdata = http_build_query(
			array(
					'code' => $code
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
	$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/add/";
	$result = json_decode(file_get_contents(str_replace(
			array("{id}", 					"{token}"),
			array($_SESSION["id"], $_SESSION["token"]),
			$service_url),
		false,
		$context), true);
	if ($result["insert"] == "OK") {
		return true;
	}
	return false;
}

if (isset($_POST["codepromo"])) {
	if (!isGoodPromo($_POST["codepromo"])) {
		$error_promo = $_POST["codepromo"]." est non valide";
	}
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
	<script>
	function removeToBasket(p1) {
		$.ajax({
		    url: 'callapi.php?function=removeToBasket&id={id_product}'.replace("{id_product}", p1),
		    dataType: "json",
		    complete: function (response) {
            location.reload();
		    }
		});
	}
  function updateToBasket(elem, p1) {
		var val = (elem.parentElement).getElementsByTagName("input")[0].value;
		if (val > 0) {
			$.ajax({
			    url: 'callapi.php?function=updateToBasket&id={id_product}&qte={qte}'.replace("{id_product}", p1).replace("{qte}", val),
			    dataType: "json",
			    complete: function (response) {
							location.reload();
			    }
			});
		}
	}



	</script>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 50px;">
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th style="width: 30px;"></th>
							<th>Nom</th>
							<th>Quantité</th>
							<th style="width: 80px;">Prix de base</th>
							<th style="width: 140px;">Réduction</th>
							<th style="width: 80px;">Prix final</th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/";
						$toshow = "<tr><td><a onclick='removeToBasket({id_product})'>Supprimer</a></td><td><a href='page.html?product={id_product}'>{name}</a></td><td><input name='qte' type='number' min=1 value='{qte}'><a  style='margin-left:30px;' onclick='updateToBasket(this, {id_product})'>Modifier</a></td><td style='text-align:right;'>€ {prix_base}</td><td style='text-align:right;'>€ {reduction}</td><td style='text-align:right;'>€ {prix_final}</td></tr>";
						$bag = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}"),
										array($_SESSION["id"], $_SESSION["token"]),
										$service_url)), true);
						$articles = $bag["articles"];
						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
              //TODO: ca ....
								echo str_replace(
									array("{id_product}",								"{name}", 					"{qte}", 										"{prix_base}" , 							"{prix_final}", 							"{reduction}", "{btn}"),
									array($articles[$i]["id"], $articles[$i]["name"], $articles[$i]["Qte"], $articles[$i]["prix"], $articles[$i]["prix_final"], $articles[$i]["reduction"]." (".(($articles[$i]['reduction']*100) / $articles[$i]['prix'])." %)", "supprimer"),
									$toshow);
							}
						} else {
							$error = "ERREUR";
						}


						?>

					</tbody>
		</table>
		<br />
		<form action="/bag.php" method="post" style="margin-left: 20px;">
			<table class="addition" style="margin-left: 20px; float: left;">
				<tbody>
					<tr><td colspan="2" style="font-family: 'Open Sans', sans-serif;"><h4>Ajouter un code promotionnel</h4></td></tr>
					<tr><td>Code :</td><td><input type="text" name="codepromo" /></td></tr>
					<tr><td colspan="2" style="padding: 0;"><input type="submit" value="Ajouter" class="btn btn-info" style=" height: 50px;font-size: 1.5em;"></td></tr>
				</tbody>
			</table>
		</form>


		<table class="addition" style="float: right;">
			<tbody>

				<?php
				$promo = $bag["promo"];
					if (count($promo) > 0) {
							echo '<tr> <td colspan="2" style="text-align:center;">Code Promo</td></tr>';
							for($i = 0; $i < count($promo); $i++) {
								echo '<tr> <td>'.$promo[$i]["Code"].'</td><td>'.$promo[$i]["Nom"].'</td> </tr>';
							}
					}
				?>
				<tr> <td colspan="2" style="text-align:center;border-bottom: 2px solid #E0E0E0;border-top: 2px solid #E0E0E0;font-size: 1.30em;font-family: 'Open Sans', sans-serif;">Addition</td></tr>
				<tr> <td class>Prix total</td><td><?php echo  $bag["prix_total"]; ?> €</td> </tr>
				<tr> <td>Reduction</td><td><?php echo  "(".round((($bag['reduction_total']/$bag['prix_total'])*100), 2)." %) ".$bag["reduction_total"]; ?> €</td> </tr>
				<tr> <td>Prix final</td><td><?php echo  $bag["prix_final"]; ?> €</td> </tr>
			</tbody>

			<tfoot>
				<tr>
					<td style="border: none; padding: 0;" colspan="2"><a style="margin: 20px; margin-left: auto;" href="./validate.php"><button class="btn btn-success" style="font-size: 1.5em; width:100%;"><?php echo S_VALIDER; ?></button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
