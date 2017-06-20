<?php
require_once("part/basicFunctionLoad.php");
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
							<th>Societe</th>
							<th>Contact</th>
							<th>Date</th>
							<th>Prix</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/devis";
						$toshow = "<tr><td>{societe}</td><td>{contact}</td><td>{date}</td><td>{prix}</td><td class='action_btn'>"
                          ."<a href='./devis.php?id={id}'><button type='submit' name='See' class='btn btn-success'>VOIR</button></a>"
                          ."<a href='./export.php?id={id}'><button type='submit' name='PDF' class='btn btn-danger'>PDF</button></a></td></tr>";
						$btn = '<input id="addIt" type="button" value="addIt" onclick="addToBasket({id_product});" />';
						//<a href='./devis.php?id={id}&action=share'><button type='submit' name='Share' class='btn btn-info'>PARTAGER</button></a>
						$devis = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}"),
										array($_SESSION["id"], $_SESSION["token"]),
										$service_url)), true);
						if (count($devis) > 0) {
							for($i = 0; $i < count($devis); $i++) {
								echo str_replace(
									array("{societe}",								"{contact}", 					                 "{date}", 										"{prix}",                 "{id}"),
									array($devis[$i]["Societe"], $devis[$i]["Nom"]." ".$devis[$i]["Prenom"], $devis[$i]["Date_Creation"], $devis[$i]["Prix_final"], $devis[$i]["ID"]),
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
