<?php
require_once("part/basicFunctionLoad.php");
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
	<script>

	function addToBasket(p1) {
		//TODO: call api / receive nb articles into basket / change basket number
		$.ajax({
		    url: 'callapi.php?function=addToBasket&id={id_product}'.replace("{id_product}", p1),
		    dataType: "json",
		    complete: function (response) {
		        var obj = JSON.parse(response.responseText);
						document.getElementById("item_count_bag").innerText =  obj.count;
		    }
		});
	}

	</script>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 50px;">
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th>Image</th>
							<th>Nom</th>
							<th>Description</th>
							<th>Commande</th>
							<th>Prix</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/products";
						$toshow = "<tr><td>{img}</td><td><a href='page.html?product={id_product}'>{name}</a></td><td>{descr}</td><td>{commande}</td><td>{prix}</td><td>{btn}</td></tr>";
						$btn = '<input id="addIt" type="button" value="addIt" onclick="addToBasket({id_product});" />';
						$articles = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}"),
										array($_SESSION["id"], $_SESSION["token"]),
										$service_url)), true);
						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
								echo str_replace(
									array("{id_product}",								"{name}", 					"{descr}", 										"{prix}" , 							"{btn}"),
									array($articles[$i]["id"], $articles[$i]["name"], $articles[$i]["smallDesc"], $articles[$i]["prix"], str_replace("{id_product}", $articles[$i]["id"], $btn)),
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
