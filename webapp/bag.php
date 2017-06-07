<?php
session_start();
if (!isset($_SESSION["id"])) {
	header('Location: login.php');
}
include('part/language.php');
include('const/param.php');
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
            header('Location: bag.php');
		    }
		});
	}
  function updateToBasket(p1, qte) {
		$.ajax({
		    url: 'callapi.php?function=updateToBasket&id={id_product}&qte={qte}'.replace("{id_product}", p1).replace("{qte}", qte),
		    dataType: "json",
		    complete: function (response) {
          //TODO: update PRIX + PRIX TOTAL + PANIER SIZE
		        var obj = JSON.parse(response.responseText);
						document.getElementById("item_count_bag").innerText =  obj.count;
		    }
		});
	}

	</script>
</head>
<body>
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 50px;">
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th></th>
							<th>Nom</th>
							<th>Quantité</th>
							<th>Prix de base</th>
							<th>Prix final</th>
							<th>Réduction</th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/bag";
						$toshow = "<tr><td>{img}</td><td><a href='page.html?product={id_product}'>{name}</a></td><td>{qte}</td><td>{prix_base}</td><td>{prix_final}</td><td>{reduction}</td></tr>";
						$btn = '<input id="addIt" type="button" value="remove" onclick="removeToBasket({id_product});" />';
						$articles = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}"),
										array($_SESSION["id"], $_SESSION["token"]),
										$service_url)), true);
						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
              //TODO: ca ....
								echo str_replace(
									array("{id_product}",								"{name}", 					"{qte}", 										"{prix_base}" , 							"{prix_final}", 							"{reduction}"),
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
