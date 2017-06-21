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
	<div class="container-fluid" style="margin-top: 70px;">
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th></th>
							<th>S_PRODUCTNAME</th>
							<th>S_QUANTITE</th>
							<th>S_BASEPRICE</th>
							<th>S_REDUCTION</th>
							<th>S_FINALPRICE</th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/";
						$toshow = "<tr><td><a onclick='removeToBasket({id_product})'>Supprimer</a></td><td><a href='page.html?product={id_product}'>{name}</a></td><td><input name='qte' type='number' min=1 value='{qte}'><a  style='margin-left:30px;' onclick='updateToBasket(this, {id_product})'><i class='material-icons'>cached</i></a></td><td>€ {prix_base}</td><td>€ {reduction}</td><td>€ {prix_final}</td></tr>";
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
					<tr><td colspan="2"><h4>S_CODEMORE</h4></td></tr>
					<tr><td>S_CODE</td><td><input type="text" name="codepromo" /></td></tr>
					<tr><td colspan="2"><input type="submit" value="Ajouter" class="btn btn-info" style="font-size: 1.0em; width:100%;"></td></tr>
					<tr><td colspan="2"><span class="error_message"><?php if(isset($error_promo)) { echo $error_promo; } ?></span></td></tr>
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
				<tr> <td colspan="2" style="text-align:center;border-bottom: 2px solid #E0E0E0;border-top: 2px solid #E0E0E0;">Addition</td></tr>
				<tr> <td class>S_TOTALPRICE</td><td><?php echo  $bag["prix_total"]; ?> €</td> </tr>
				<tr> <td>S_REDUCTION</td><td><?php echo  "(".round((($bag['reduction_total']/$bag['prix_total'])*100), 2)." %) ".$bag["reduction_total"]; ?> €</td> </tr>
				<tr> <td>S_FINALPRICE</td><td><?php echo  $bag["prix_final"]; ?> €</td> </tr>
			</tbody>

			<tfoot>
				<tr>
					<td style="border: none" colspan="2"><a style="margin: 20px; margin-left: auto;" href="./validate.php"><button class="btn btn-success" style="font-size: 1.5em; width:100%;"><?php echo S_VALIDER; ?></button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
