
<!-- DataTables CSS -->
<style>
.grise {
  background-color:#EEEEEE;
}
.color2 {
  background-color:#F5F5F5;
}
.color {

}
</style>
<link rel="stylesheet" type="text/css" href="part/style.css">
	<div class="container-fluid" style="margin-top: 70px;">
    <table class="devis" style="margin: 20px auto 20px auto; width:625px">
      <thead>
        <tr><th colspan="4"><h3 style="text-align:center; font-weight:bold;">Information client</h3></th></tr>
      </thead>
      <tbody>
        <tr><td class="grise">Crée le :</td><td><?= $devis["Date_Creation"] ?></td><td class="grise">Expire le :</td><td><?= $devis["Date_Validity"] ?></td></tr>
        <tr><td class="grise">Société :</td><td><?= $devis["Societe"] ?></td><td class="grise">Siret :</td><td><?= $devis["Siret"] ?></td></tr>
        <tr><td class="grise">Téléphone :</td><td><?= $devis["Tel"] ?></td><td class="grise">Fax :</td><td><?= $devis["Fax"] ?></td></tr>
        <tr><td class="grise">Courriel :</td><td colspan="3" style="text-align: left;"><?= $devis["Email"] ?></td></tr>
        <tr><td class="grise">Adresse :</td><td colspan="3" style="text-align: left;"><?= $devis["Adresse"] ?></td></tr>
        <tr><td class="grise">Code Postal :</td><td><?= $devis["CP"] ?></td><td class="grise">Ville :</td><td><?= $devis["Ville"] ?></td></tr>
        <tr><td class="grise">Nom :</td><td><?= $devis["Nom"] ?></td><td class="grise">Prénom :</td><td><?= $devis["Prenom"] ?></td></tr>
        <tr><td class="grise">Représentant :</td><td  colspan="3"><b><?= $devis["DisplayName"] ?></b></td></tr>
      </tbody>
    </table>

    <br />


    <br />
    <table class="devis" style="margin: 20px auto 20px auto; width:625px; border: 2px solid #EEEEEE;">
      <thead>
        <tr><th colspan="6"><h3 style="text-align:center; font-weight:bold;">Contenu</h3></th></tr>
        <tr><th>Libellé</th><th>Prix Unitaire</th><th>Quantité</th><th>Prix</th><th>Réduction</th><th>Prix final</th></tr>
      </thead>
      <tbody>
        <?php
        $ligne = '<tr>'
                    .'<td> {libelle}</td>'
                    .'<td>{unit}</td>'
                    .'<td>{qte}</td>'
                    .'<td>{prix}</td>'
                    .'<td>{reduct}</td>'
                    .'<td>{final}</td>'
                  .'</tr>';

        for($i = 0; $i < count($articles); $i++) {
          echo str_replace(
              array("{color}",  "{libelle}", 					"{unit}", 					"{qte}", 					"{prix}", 					"{reduct}", 					"{final}"),
              array($color,     $articles[$i]["name"], $articles[$i]["prix"], $articles[$i]["Qte"], $articles[$i]["Prix"], $articles[$i]["Reduction"], $articles[$i]["Prix_final"]),
              $ligne);
      	}
        ?>
      </tbody>
    </table>
    <br />
    <br />
    <br />
    <table class="addition" style="margin: 20px auto 20px auto; width:300px; border: 2px solid #EEEEEE;">
      <thead>
        <tr><th colspan="2"><h3 style="text-align:center; font-weight:bold;">Récapitulatif</h3></th></tr>
      </thead>
      <tbody>
        <?php
          if (count($promo) > 0) {
              echo '<tr><td colspan="2" style="text-align:center;"  class="grise">Promotions</td></tr>';
              for($i = 0; $i < count($promo); $i++) {
                echo '<tr> <td class="grise">'.$promo[$i]["Code"].'</td><td>'.$promo[$i]["Nom"].'</td> </tr>';
              }
          }
        ?>
        <tr>
          <td colspan="2"  class="grise" style="text-align:center; border-bottom: 2px solid #E0E0E0; border-top: 2px solid #E0E0E0;">Addition</td>
        </tr>
        <tr>
          <td class="grise">Prix :</td>
          <td><?= $devis["Prix"] ?> €</td>
        </tr>
        <tr>
          <td class="grise">Réduction :</td>
          <td><?= $devis["Reduction"] ?> €</td>
        </tr>
        <tr>
          <td class="grise">Prix à payer :</td>
          <td style="font-size:1.5em;"><b><?= $devis["Prix_final"] ?> €</b></td>
        </tr>
      </tbody>
    </table>
	</div>
