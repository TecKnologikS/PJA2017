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
	<?php include("part/navdatas_icon.php"); ?>
	<div class="container-fluid" style="margin-top: 35px;">
		<table id="quezac" class="display responsive nowrap" width="100%">
			<thead>
						<tr>
							<th><?= S_PRODUCTNAME ?></th>
							<th><?= S_PRODUCTDESCRPTION ?></th>
							<th style="width:60px; text-align: right;"><?= S_COMMANDE ?></th>
							<th style="width:60px; text-align: right;"><?= S_UNITYPRICE ?></th>
							<th style="width:40px;"></th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/products";

						if(isset($_POST["search"])) {
							if (strlen($_POST["search"]) > 2 ) {
								$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/products/search/".utf8_encode($_POST["search"])."/";
							}
						}

						$toshow = "<tr>
													<td><a href='page.php?id={id_product}'>{name}</a></td>
													<td>{descr}</td>
													<td style='text-align:right;'>{commande}</td>
													<td style='text-align:right;'><i class='material-icons' style='vertical-align:bottom'>euro_symbol</i> {prix}</td>
													<td style='text-align:center;'>{btn}</td>
												</tr>";
						$btn = '<a id="addIt" type="button" class="btn btn-success" value="+" onclick="addToBasket({id_product});"><i class="material-icons">add_shopping_cart</i></a>';
						$articles = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}"),
										array($_SESSION["id"], $_SESSION["token"]),
										$service_url)), true);
						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
								echo str_replace(
									array("{id_product}",								"{name}", 					"{descr}", 										"{prix}" , 							"{btn}", "{commande}"),
									array($articles[$i]["id"], $articles[$i]["name"], $articles[$i]["smallDesc"], $articles[$i]["prix"], str_replace("{id_product}", $articles[$i]["id"], $btn), $articles[$i]["nb_commande"]),
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
