<?php
require("part/basicFunctionLoad.php");

if (!isset($_GET["id"])) {
	header('Location: index.php');
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

						<?php

						$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/products/{id_p}/";
						$bag = json_decode(file_get_contents(
									str_replace(
										array("{id}", 					"{token}", 					"{id_p}"),
										array($_SESSION["id"], $_SESSION["token"], $_GET["id"]),
										$service_url)), true);
						if (count($bag) > 0) {
							$articles = $bag[0];

						} else {
							header('Location: index.php');
						}


						?>

	</div>
</body>
</html>
