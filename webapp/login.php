<?php
include("part/language.php");
include("const/param.php");


if (isset($_POST["id"]) && isset($_POST["password"])) {
	header('Location: index.php');   
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
						if(isset($_SESSION['Error'])){
							echo '<div class="alert-danger"><strong>Erreur : </strong>'.$_SESSION['Error'].'</div>';
							unset($_SESSION['Error']);
						}
						?>
						<form accept-charset="UTF-8" role="form" action="index.php" method=post name=form>
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

