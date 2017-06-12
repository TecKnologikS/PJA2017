<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.php"><?php echo NOM; ?></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
				<li><form accept-charset="UTF-8" role="form" action="index.php" method=post name=form>
							<fieldset style="padding-top: 15px;"><input class="form-control" placeholder="search" name="search" type="text"></fieldset>
					</form></li>
          <li><a href="./bag.php"><button class="btn btn-warning"><?php echo S_PANIER; ?> (<span id="item_count_bag">0</span>)</button></a></li>
          <li><a href="./devis.php"><button class="btn btn-success"><?php echo S_DEVIS; ?> (<span id="item_count_devis">0</span>)</button></a></li>
          <li><a href="./logout.php"><button type="submit" name="logOut" class="btn btn-danger"><?php echo S_LOGOUT; ?></button></a></li>
            </div>
        </div>
    </div>
</div>
