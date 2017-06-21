<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.php" style="font-family: 'Roboto', sans-serif;"><?php echo NOM;  ?></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
				<li><form accept-charset="UTF-8" role="form" action="index.php" method=post name=form>
							<fieldset><input class="form-control recherche" placeholder="Rechercher un produit" name="search" type="text" value="<?php if(isset($_POST['search'])) {echo $_POST['search'];}?>"></fieldset>
					</form></li>
          <?php
            if ($_SESSION["really"] == true) {
              echo '<li><a href="./admin_user.php"><button class="btn btn-info">'.S_USER.'</button></a></li>';
              echo '<li><a href="./admin_promo.php"><button class="btn btn-info">'.S_PROMO.'</button></a></li>';
            }
          ?>
          <li><a href="./bag.php"><button class="btn btn-warning"><?php echo S_PANIER; ?> (<span id="item_count_bag">0</span>)</button></a></li>
          <li><a href="./listdevis.php"><button class="btn btn-success"><?php echo S_DEVIS; ?> (<span id="item_count_devis">0</span>)</button></a></li>
          <li><a href="./logout.php"><button type="submit" name="logOut" class="btn btn-danger"><?php echo S_LOGOUT; ?></button></a></li>
            </div>
        </div>
    </div>
</div>
