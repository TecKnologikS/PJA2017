<?php

session_start();
include("part/language.php");
include("const/param.php");


if (isset($_POST["id"]) && isset($_POST["password"])) {

	$service_url = 'http://commercial.tecknologiks.com/index.php/login?login={login}&mdp={mdp}';

	$login = json_decode(file_get_contents(
				str_replace(
					array("{login}", 		"{mdp}"),
					array($_POST["id"], $_POST["password"]),
					$service_url)), true);

	if (count($login) > 0) {
		$_SESSION['id'] = $login['ID'];
		$_SESSION['pseudo'] = $login['login'];
		$_SESSION['token'] = $login['token'];
		$_SESSION['really'] = $login['really'];
		header('Location: index.php');
	} else {
		$error = "ERREUR";
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
						<h2 class="panel-title"><?php echo NOM ?></h2>
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
									<input class="form-control" placeholder="<?php echo S_LOGIN; ?>" name="id" type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="<?php echo S_MDP; ?>" name="password" type="password">
								</div>
								<input class="btn btn-lg btn-danger btn-block" type="submit" value="Login">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
