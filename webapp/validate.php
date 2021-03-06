<?php
require("part/basicFunctionLoad.php");

if (isset($_POST["societe"]) && isset($_POST["email"]) && isset($_POST["nom"]) && isset($_POST["prenom"])) {
  $societe = "";
  $siret = "";
  $tel = "";
  $fax = "";
  $email = "";
  $adresse = "";
  $cp = "";
  $ville = "";
  $nom = "";
  $prenom = "";

  if(isset($_POST["societe"]))
    $societe = $_POST["societe"];
  if(isset($_POST["siret"]))
    $siret = $_POST["siret"];
  if(isset($_POST["tel"]))
    $tel = $_POST["tel"];
  if(isset($_POST["fax"]))
    $fax = $_POST["fax"];
  if(isset($_POST["email"]))
    $email = $_POST["email"];
  if(isset($_POST["adresse"]))
    $adresse = $_POST["adresse"];
  if(isset($_POST["cp"]))
    $cp = $_POST["cp"];
  if(isset($_POST["ville"]))
    $ville = $_POST["ville"];
  if(isset($_POST["nom"]))
    $nom = $_POST["nom"];
  if(isset($_POST["prenom"]))
    $prenom = $_POST["prenom"];

  $result = fromJSON(
              POST_REQ(
                "http://commercial.tecknologiks.com/index.php/{id}/{token}/devis/create/",
                array(
                    'societe' => $societe,
                    'siret' => $siret,
                    'tel' => $tel,
                    'fax' => $fax,
                    'email' => $email,
                    'adresse' => $adresse,
                    'cp' => $cp,
                    'ville' => $ville,
                    'nom' => $nom,
                    'prenom' => $prenom
                ),
                array("{id}", 					"{token}"),
                array($_SESSION["id"], $_SESSION["token"])));
    if ($result["created"]){
      header('Location: devis.php?id='.$result["id_devis"].' ');
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 70px;">
    <form method="post" >
    <table class="addition" style="margin: 20px auto 20px auto; width:800px">
      <tbody>
        <tr><td colspan="2"><h3 style="text-align:center;"><?= S_USERSINFO ?></h3></td></tr>
        <tr><td>*<?= S_SOCIETY ?></td><td><input type="text" name="societe" pattern=".{1,}" required /></td></tr>
        <tr><td><?= S_SIRET ?></td><td><input type="text" name="siret" /></td></tr>
        <tr><td><?= S_TELEPHONE ?></td><td><input type="tel" pattern="^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$" name="tel" /></td></tr>
        <tr><td>*<?= S_EMAIL ?></td><td><input type="email" name="email" pattern=".{1,}" required /></td></tr>
        <tr><td><?= S_FAX ?></td><td><input type="tel" pattern="^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$" name="fax" /></td></tr>
        <tr><td><?= S_ADRESSUSER ?></td><td><input type="text" name="adresse" /></td></tr>
        <tr><td><?= S_POSTALNUM ?></td><td><input type="number" name="cp" pattern=".{1,}" /></td></tr>
        <tr><td><?= S_CITYUSER ?></td><td><input type="text" name="ville" pattern=".{1,}"  /></td></tr>
        <tr><td>*<?= S_USERNAME ?></td><td><input type="text" name="nom" pattern=".{1,}" required /></td></tr>
        <tr><td>*<?= S_USERFIRSTNAME ?></td><td><input type="text" name="prenom" pattern=".{1,}" required /></td></tr>
        <tr><td colspan="2" style="padding:0;"><input type="submit" value="Valider le devis" class="btn btn-info" style="font-size: 1.5em; width:100%; height: 50px"></td></tr>
      </tbody>
    </table>
  </form>
	</div>
</body>
</html>
