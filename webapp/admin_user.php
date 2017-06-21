<?php
require("part/basicFunctionLoad.php");

if (!isset($_GET["id"]) && $_SESSION["really"] != true)
  header('Location: index.php');

if (isset($_POST["login"]) && isset($_POST["password"])) {
  $admin = isset($_POST["admin"]) ? $_POST["admin"] : 0;
  Error("message");
}


$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/users/";
$users = json_decode(file_get_contents(
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
    function updateMdp(id) {
      var txt;
      var mdp = prompt("Entrez un nouveau mot de passe", "");
      if (mdp == null || mdp == "") {

      } else {
        $.ajax({
            url: 'callapi.php?function=updateMDP&id={id_user}&mdp={mdp}'.replace("{id_user}", id).replace("{mdp}", mdp),
            dataType: "json",
            complete: function (response) {
                location.reload();
            }
        });
      }
    }

    function updateStatut(id, value) {
      $.ajax({
          url: 'callapi.php?function=updateSTATUT&id={id_user}&statut={value}'.replace("{id_user}", id).replace("{value}", value),
          dataType: "json",
          complete: function (response) {
              location.reload();
          }
      });
    }
  </script>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 70px;">

    <form action="/admin_user.php" method="post" >
			<table class="devis" style="margin: 0 auto 0 auto; ">
        <thead>
          <tr><th colspan="3"><h4>S_NEWUSER</h4></th></tr>
          <tr>
            <th>S_LOGIN</th>
            <th>S_MDP</th>
            <th>S_ADMINUSER</th>
          </tr>
        </thead>
				<tbody>
          <tr>
            <td><input type="text" name="login" /></td>
            <td><input type="text" name="password" /></td>
            <td>
              <label class="switch">
                <input type="checkbox" name="admin" value="1">
                <div class="slider round"></div>
              </label>
            </td>
          </tr>
					<tr><td class="gris" colspan="3"><input type="submit" value="Ajouter" class="btn btn-info" style="font-size: 1.0em; width:100%;"></td></tr>
				</tbody>
			</table>
		</form>
    <br />
    <br />
    <table class="devis" style="margin: 0 auto 0 auto; ">
      <thead>
        <tr><th colspan="4"><h4>S_LISTUSER</h4></th></tr>
        <tr>
          <th>S_LOGIN</th>
          <th>S_MDP</th>
          <th>S_ADMINUSER</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
          <?php
          $ligne = '<tr>
                      <td>{login}</td>
                      <td><input id="addIt" type="button" class="btn btn-danger" value="Modifier" onclick="updateMdp({id});" /></td>
                      <td>
                        <label class="switch">
                          <input type="checkbox" name="admin" {admin} onChange="updateStatut({id}, {value});">
                          <div class="slider round"></div>
                        </label>
                      </td>
                      <td></td>
                    </tr>';
                    if (count($users) > 0) {
                      for($i = 0; $i < count($users); $i++) {
                        $checked = '';
                        $toclick = '1';
                        if ($users[$i]["Admin"] == 1){
                          $checked = 'checked';
                          $toclick = '0';
                        }
                        echo str_replace(
                          array("{id}",								"{login}", 					"{password}", 			"{admin}", "{value}" ),
                          array($users[$i]["ID"], $users[$i]["Login"], $users[$i]["Password"], $checked, $toclick),
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
