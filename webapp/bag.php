<?php
require("part/basicFunctionLoad.php");
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
            location.reload();c
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
							<th>Nom</th>
							<th>Quantité</th>
							<th>Prix de base</th>
							<th>Réduction</th>
							<th>Prix final</th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag/";
						$toshow = "<tr><td><a onclick='removeToBasket({id_product})'>Supprimer</a></td><td><a href='page.html?product={id_product}'>{name}</a></td><td><input name='qte' type='number' min=1 value='{qte}'><a  style='margin-left:30px;' onclick='updateToBasket(this, {id_product})'>Modifier</a></td><td>€ {prix_base}</td><td>€ {reduction}</td><td>€ {prix_final}</td></tr>";
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

	</div>
</body>
</html>
