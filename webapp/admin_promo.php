<?php
require("part/basicFunctionLoad.php");

if (!isset($_GET["id"]) && $_SESSION["really"] != true)
  header('Location: index.php');

if (isset($_POST["login"]) && isset($_POST["password"])) {
  $admin = isset($_POST["admin"]) ? $_POST["admin"] : 0;

  $postdata = http_build_query(
      array(
          'Login' => $_POST["login"],
          'Password' => $_POST["password"],
          'Admin' => $admin
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
  $service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/users/insert/";
  $result = json_decode(file_get_contents(str_replace(
      array("{id}", 					"{token}"),
      array($_SESSION["id"], $_SESSION["token"]),
      $service_url),
    false,
    $context), true);
    if ($result["created"]){
      Succed($_POST["login"].S_CREATED_USER);
    } else {
      Error(S_ERROR_CREATED_USER);
    }

}


$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/promo/";
$promos = json_decode(file_get_contents(
      str_replace(
        array("{id}", 					"{token}"),
        array($_SESSION["id"], $_SESSION["token"]),
        $service_url)), true);


?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
  <script>
    function removeCode(id) {
      if (confirm('Etes vous sur de vouloir supprimer l utilisateur ?')) {
        $.ajax({
            url: 'callapi.php?function=removeCode&id={id_code}'.replace("{id_code}", id),
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

    <form action="/admin_user.php" method="post" >
			<table class="devis" style="margin: 0 auto 0 auto; ">
        <thead>
          <tr><th colspan="4"><h4>Nouveau code promotionnel</h4></th></tr>
          <tr>
            <th>Libelle</th>
            <th>Code</th>
            <th style="text-align: right;">Reduction (en %)</th>
            <th style="text-align: right;">Minimum d'Achat</th>
          </tr>
        </thead>
				<tbody>
          <tr>
            <td><input type="text" name="libelle" placeholder="Libelle" /></td>
            <td><input type="text" name="code" placeholder="Code" /></td>
            <td><input type="text" name="reduction" placeholder="Reduction en %" /></td>
            <td><input type="text" name="minimum" placeholder="Minimum en €" /></td>
          </tr>
					<tr><td class="gris" colspan="4" style="padding:0;"><input type="submit" value="Ajouter" class="btn btn-info" style="font-size: 1.5em; width:100%; height:50px;"></td></tr>
				</tbody>
			</table>
		</form>
    <br />
    <br />
    <table class="devis" style="margin: 0 auto 0 auto; ">
      <thead>
        <tr><th colspan="5"><h4>Liste codes promotionnels</h4></th></tr>
        <tr>
          <th>Libelle</th>
          <th>Code</th>
          <th style="text-align: right;">Reduction</th>
          <th style="text-align: right;">Minimum d'Achat</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
          <?php
          $ligne = '<tr>
                      <td>{libelle}</td>
                      <td>{code}</td>
                      <td style="text-align: right;">{reduction} %</td>
                      <td style="text-align: right;">{minimum} €</td>
                      <td><a onclick="removeCode({id});"><i class="material-icons" style="vertical-align: bottom; color:#F44336;">delete</i></a></td>
                    </tr>';
                    if (count($promos) > 0) {
                      for($i = 0; $i < count($promos); $i++) {
                        echo str_replace(
                          array("{libelle}",								"{code}", 					"{reduction}", 			"{minimum}", "{id}" ),
                          array($promos[$i]["Nom"], $promos[$i]["Code"], $promos[$i]["Reduction"], $promos[$i]["Minimum"], $promos[$i]["ID"]),
                          $ligne);
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
