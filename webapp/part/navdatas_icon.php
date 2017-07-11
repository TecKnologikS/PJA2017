<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.php" style="font-family: 'Roboto', sans-serif;"><?php echo NOM;  ?></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
				<li><form accept-charset="UTF-8" role="form" action="index.php" method=post name=form>
							<fieldset>
                <input class="form-control recherche" placeholder="Rechercher un produit" name="search" type="text" value="<?php if(isset($_POST['search'])) {echo $_POST['search'];}?>">
              </fieldset>
					</form></li>
          <li><a href="./index.php" title="Liste produits"><button class="btn btn-primary"><i class="material-icons" style="vertical-align: bottom">list</i></button></a></li>
          <?php
            if ($_SESSION["really"] == true) {
              echo '<li><a href="./admin_user.php" title="Utilisateurs (Administration)"><button class="btn btn-info"><i style="vertical-align: bottom" class="material-icons">supervisor_account</i></button></a></li>';
              echo '<li><a href="./admin_promo.php" title="Promotions (Administration)"><button class="btn btn-info"><i style="vertical-align: bottom" class="material-icons">redeem</i></button></a></li>';
            }
          ?>
          <li><a href="./bag.php" title="Panier"><button class="btn btn-warning"><i class="material-icons" style="vertical-align: bottom">shopping_cart</i> (<span id="item_count_bag">0</span>)</button></a></li>
          <li><a href="./listdevis.php" title="Liste des devis"><button class="btn btn-success"><i class="material-icons" style="vertical-align: bottom">insert_drive_file</i> (<span id="item_count_devis">0</span>)</button></a></li>
          <li><a href="./logout.php" title="Se déconnecter" onclick="return confirm('Voulez-vous vraiment vous déconnecter ?')"><button type="submit" name="logOut" class="btn btn-danger"><i class="material-icons" style="vertical-align: bottom">power_settings_new</i></button></a></li>
            </div>
        </div>
    </div>
</div>
