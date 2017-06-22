<?php

include_once("part/basicFunctionLoad.php");
include("part/language.php");
include("const/param.php");


if (isset($_POST["id"]) && isset($_POST["password"])) {
	$login = fromJSON(
							GET_REQ(
								"http://commercial.tecknologiks.com/index.php/login?login={login}&mdp={mdp}",
								array("{login}", 		"{mdp}"),
								array($_POST["id"], $_POST["password"])));

	if (count($login) > 0) {
		$_SESSION['id'] = $login['ID'];
		$_SESSION['pseudo'] = $login['login'];
		$_SESSION['token'] = $login['token'];
		$_SESSION['really'] = $login['really'];
		header('Location: index.php');
	} else {
		Error(S_BAD_CONNECTION);
	}
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
	<?php include('part/header.php'); ?>
</head>
<body>
	<div class="container">
		<div class="row vertical-offset-100">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title" style="text-align:center; font-size:2em;font-family: 'Roboto', sans-serif;"><?php echo NOM ?></h2>
					</div>
					<div align="center" class="panel-body">
						<img src="https://robin.pauquet.net/logo_tks_light.png" WIDTH=170 HEIGHT=170 ><br><br>
						<?php
						if(isset($error)){
							echo '<div class="alert-danger"><strong>Erreur : </strong>'.$error.'</div>';
						}
						?>
						<form accept-charset="UTF-8" role="form" action="login.php" method=post name=form>
							<fieldset>
								<div class="form-group">
									<input class="form-control login_pass" placeholder="<?php echo S_LOGIN; ?>" name="id" type="text" pattern=".{1,}" required >
								</div>
								<div class="form-group">
									<input class="form-control login_pass" placeholder="<?php echo S_MDP; ?>" name="password" type="password" pattern=".{1,}" required >
								</div>
								<input style="height:50px;" class="btn btn-lg btn-success btn-block" type="submit" value="Se Connecter">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
