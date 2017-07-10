<?php
require("part/basicFunctionLoad.php");

if (isset($_GET["delete"]))
  if ($_GET["delete"] == "true")
      Succed(S_DELETED_USER);

if (isset($_GET["statut"]))
  if ($_GET["statut"] == "true")
      Succed(S_CHANGED_STATUT);

if (isset($_POST["login"]) && isset($_POST["password"])) {
  $admin = isset($_POST["admin"]) ? $_POST["admin"] : 0;
  $result = fromJSON(
              POST_REQ("http://commercial.tecknologiks.com/index.php/{id}/{token}/users/insert/",
                array(  'Login' => $_POST["login"],
                        'Password' => $_POST["password"],
                        'Admin' => $admin ),
                array("{id}", 					"{token}"),
                array($_SESSION["id"], $_SESSION["token"])));

    if ($result["created"]){
      Succed($_POST["code"]." ".S_CREATED_USER);
    } else {
      Error($_POST["code"]." ".S_ERROR_CREATED_USER);
    }
}

$users = fromJSON(
            GET_REQ(
              "http://commercial.tecknologiks.com/index.php/{id}/{token}/users/",
              array("{id}", 					"{token}"),
              array($_SESSION["id"], $_SESSION["token"])));



?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
</head>
<body onload="getBasketAndDevis();">
	<?php include("part/navdatas.php"); ?>
	<div class="container-fluid" style="margin-top: 70px;">

    <form action="/admin_user.php" method="post" >
			<table class="devis" style="margin: 0 auto 0 auto; ">
        <thead>
          <tr><th colspan="3"><h4><?= S_NEWUSER ?></h4></th></tr>
          <tr>
            <th><?= S_LOGIN ?></th>
            <th><?= S_MDP ?></th>
            <th><?= S_ADMINUSER ?></th>
          </tr>
        </thead>
				<tbody>
          <tr>
            <td><input type="text" name="login" placeholder="login" pattern=".{1,}" required /></td>
            <td><input type="text" name="password" placeholder="mot de passe" pattern=".{1,}" required /></td>
            <td>
              <label class="switch">
                <input type="checkbox" name="admin" value="1">
                <div class="slider round"></div>
              </label>
            </td>
          </tr>
					<tr><td class="gris" colspan="3" style="padding:0;"><input type="submit" value="Ajouter" class="btn btn-info" style="font-size: 1.5em; width:100%; height:50px;"></td></tr>
				</tbody>
			</table>
		</form>
    <br />
    <br />
    <table class="devis" style="margin: 0 auto 0 auto; ">
      <thead>
        <tr><th colspan="4"><h4><?= S_LISTUSER ?></h4></th></tr>
        <tr>
          <th><?= S_LOGIN ?></th>
          <th><?= S_MDP ?></th>
          <th><?= S_ADMINUSER ?></th>
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
                      <td><a onclick="removeUser({id});"><i class="material-icons" style="vertical-align: bottom; color:#F44336;">delete</i></a></td>
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
