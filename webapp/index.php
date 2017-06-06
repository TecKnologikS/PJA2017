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
</head>
<body>
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
						$toshow = "<tr><td>{img}</td><td>{name}</td><td>{descr}</td><td>{commande}</td><td>{prix}</td><td>{btn}</td></tr>";
						$articles = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}"),
										array($_SESSION["id"], $_SESSION["token"]),
										$service_url)), true);

						if (count($articles) > 0) {
							for($i = 0; $i < count($articles); $i++) {
								echo str_replace(
									array("{name}", 					"{descr}", 						"{prix}"),
									array($articles[$i]["name"], $articles[$i]["smallDesc"], $articles[$i]["prix"]),
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
