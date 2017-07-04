<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';


function CalculateBag($article, $promo) {
	$prix_final = 0; $prix_total = 0; $reduction_total = 0;

	for($i = 0; $i < count($article); $i++) {
		$prix_total += $article[$i]["prix"]*$article[$i]["Qte"];
		$article[$i]["prix_final"] = $article[$i]["prix"];
		$article[$i]["reduction"] = 0;
	}

	if (count($promo) > 0) {
		for($i = 0; $i < count($promo); $i++) {
			$promo[$i]["total"] = 0;
			$promo_total = 0;
			switch($promo[$i]["Type"]) {
				case "1":
				if ($prix_total >= $promo[$i]["Minimum"]) {
					$prix_final = 0; $reduction_total = 0;
					for($j = 0; $j < count($article); $j++) {
						$prix_group = $article[$j]["prix"]*$article[$j]["Qte"];
						$reduction = (($prix_group*$promo[$i]["Reduction"]) / 100);
						$article[$j]["prix_final"] = $prix_group - $reduction;
						$article[$j]["prix_group"] = $prix_group;
						$article[$j]["reduction"] = $reduction;
						$prix_final += $article[$j]["prix_final"];
						$reduction_total += $reduction;
						$promo_total += $reduction;
								}
				}
				break;
				default:
				break;
			}
			$promo[$i]["total"] = $promo_total;
		}
	} else {
		$prix_final = 0; $reduction_total = 0;
		for($j = 0; $j < count($article); $j++) {
			$prix_group = $article[$j]["prix"]*$article[$j]["Qte"];
			$reduction = (($prix_group*$promo[$i]["Reduction"]) / 100);
			$article[$j]["prix_final"] = $prix_group - $reduction;
			$article[$j]["prix_group"] = $prix_group;
			$article[$j]["reduction"] = $reduction;
			$prix_final += $article[$j]["prix_final"];
			$reduction_total += $reduction;
			$promo_total += $reduction;
		}
	}


	return array("articles" => $article, "promo" => $promo, "prix_total" => $prix_total, "prix_final" => $prix_final, "reduction_total" => $reduction_total);
}

function isTimeStampsOk($id, $timestamps) {
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$res = $mysqli->query("SELECT * FROM user WHERE ID='".$mysqli->real_escape_string($id)."' AND  ti < '".$mysqli->real_escape_string($timestamps)."'");
	$check_user = mysqli_num_rows($res);
	if($check_user>0){
		return true;
	}
	return false;
}

function isCorrectIdentification($id, $token) {
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$res = $mysqli->query("SELECT * FROM user WHERE ID='".$mysqli->real_escape_string($id)."' AND  Token='".$mysqli->real_escape_string($token)."'");
	$check_user = mysqli_num_rows($res);
	if($check_user>0){
		return true;
	}
	return false;
}

function isCorrectIdentificationAdmin($id, $token) {
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$res = $mysqli->query("SELECT * FROM user WHERE ID='".$mysqli->real_escape_string($id)."' AND  Token='".$mysqli->real_escape_string($token)."' AND Admin=1");
	$check_user = mysqli_num_rows($res);
	if($check_user>0){
		return true;
	}
	return false;
}

function article($id, $number) {
	$args = "";
	if ($id != -1) {
		$args .= " AND id=".$id." ";
	}

	if ($number != -1) {
		$args .= " LIMIT ".$number." ";
	}

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$res = $mysqli->query("SELECT * , (SELECT SUM(Qte) FROM `devis_article` WHERE ID_Article = article.id) as nb_commande FROM article WHERE 1=1 ".$args);
	$types = array();

	while(($row =  mysqli_fetch_assoc($res))) {
		$types[] = $row;
	}
	return $types;
}

function search($type, $recherche) {
	$args = "";
	if ($type == 0) {
		//Juste le nom
		$args .= " AND name LIKE '%".$recherche."%' ";
	} else {

	}

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$res = $mysqli->query("SELECT * , (SELECT SUM(Qte) FROM `devis_article` WHERE ID_Article = article.id) as nb_commande FROM article WHERE 1=1 ".$args);
	$types = array();

	while(($row =  mysqli_fetch_assoc($res))) {
		$types[] = $row;
	}
	return $types;
}

function devis($id_user, $id, $number) {
	$args = "";
	if ($id != -1) {
		$args .= " AND ID=".$id." ";
	}
	if ($id_user != -1) {
		$args .= " AND ID_User=".$id_user." ";
	}

	if ($number != -1) {
		$args .= " LIMIT ".$number." ";
	}

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$res = $mysqli->query("SELECT * FROM devis WHERE 1=1 ".$args);
	$types = array();

	while(($row =  mysqli_fetch_assoc($res))) {
		$types[] = $row;
	}
	return $types;
}

function error($message, $code, $response) {
	$response = $response->withHeader('Content-type', 'application/json');
	$response = $response->withJson(array('result' => 'ERROR', 'message' => $message), $code);
	return $response;
}

function verify() {
	if (!isCorrectIdentification($id, $token)) {
		return error("Bad Identification", 0, $response);
	}

	if (!isTimeStampsOk($id, $timestamps)) {
		return error("Too Old Request", 0, $response);
	}
}

$configuration = [
    'settings' => [
        'displayErrorDetails' => true,
    ],
];
$c = new \Slim\Container($configuration);
$app = new \Slim\App($c);


//$app = new \Slim\App;
$app->get('/{id}/{token}/products', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
	$token =  $request->getAttribute('token');
	$limit =  $request->getQueryParams()["limit"];

	$timestamps =  time();
	$data = array();

	if (empty($limit))
		$data = article(-1, -1);
	else
		$data = article(-1, $limit);

	$response = $response->withHeader('Content-type', 'application/json');
	if (count($data) > 0)
		$response = $response->withJson($data, 200);
	else
		$response = $response->withJson($data, 400);
  return $response;
});
$app->get('/{id}/{token}/products/search/{recherche}/', function (Request $request, Response $response) {
  $id = $request->getAttribute('id');
	$token =  $request->getAttribute('token');
	$recherche =  $request->getAttribute('recherche');

	$timestamps =  time();
	$data = array();

	$data = search(0, $recherche);

	$response = $response->withHeader('Content-type', 'application/json');
	if (count($data) > 0)
		$response = $response->withJson($data, 200);
	else
		$response = $response->withJson($data, 400);
	return $response;
});
$app->get('/{id}/{token}/products/{id_p}/', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    $id_p = $request->getAttribute('id_p');
	$token =  $request->getAttribute('token');
	$timestamps =  time();
	$data = array();

	$data = article($id_p, -1);

	$response = $response->withHeader('Content-type', 'application/json');
	if (count($data) > 0)
		$response = $response->withJson($data, 200);
	else
		$response = $response->withJson($data, 400);
	return $response;
});
$app->get('/{id}/{token}/devis', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$limit =  $request->getQueryParams()["limit"];

	$timestamps =  time();
	$data = array();

	if (empty($limit))
		$data = devis($id, -1, -1);
	else
		$data = devis($id, -1, $limit);

	$response = $response->withHeader('Content-type', 'application/json');
	if (count($data) > 0)
		$response = $response->withJson($data, 200);
	else
		$response = $response->withJson($data, 400);

	return $response;
});
$app->get('/{id}/{token}/devis/{id_devis}/', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');
	$token =  $request->getAttribute('token');
	$id_devis =  $request->getAttribute('id_devis');

	$timestamps =  time();
	$articles = array();
	$promos = array();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$mysqli->set_charset("utf8");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}

	$res = $mysqli->query("SELECT * FROM devis WHERE ID=".$mysqli->real_escape_string($id_devis)." ");
	if ($row = $res->fetch_assoc()){
		$devis = $row;
	}
	// SELECT ARTICLE
	$res = $mysqli->query("SELECT * FROM devis_article da INNER JOIN article a ON a.ID = da.ID_Article WHERE da.ID_Devis = ".$mysqli->real_escape_string($id_devis)." ");
	while(($row =  mysqli_fetch_assoc($res))) {
		$articles[] = $row;
	}

	// SELECT PROMO
	$res = $mysqli->query("SELECT * FROM devis_promo dp INNER JOIN promocode pc ON dp.ID_Promo = pc.ID WHERE dp.ID_Devis = ".$mysqli->real_escape_string($id_devis)." ");
	while(($row =  mysqli_fetch_assoc($res))) {
		$promos[] = $row;
	}

	$retour = array("devis" => $devis, "articles" => $articles, "promo" => $promos);

	$response = $response->withHeader('Content-type', 'application/json');
	if (count($devis) > 0)
		$response = $response->withJson($retour, 200);
	else
		$response = $response->withJson($retour, 400);

	return $response;
});
$app->delete('/{id}/{token}/devis/delete/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('delete' => false,'admin' => false);
	$response = $response->withJson($retour, 400);
	if (isCorrectIdentificationAdmin($id, $token)) {
		$mysqli->query("DELETE FROM devis WHERE ID= ".$parsedBody["id"]." ");
		$retour = array('delete' => true,'admin' => true);
		$response = $response->withJson($retour, 200);
	}
	$response = $response->withHeader('Content-type', 'text');
  return $response;
});
$app->post('/{id}/{token}/devis/create/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$data = array();
	$data2 = array();
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$mysqli->set_charset("utf8");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	$retour = array('item' => $parsedBody["id"],'id_devis' => 0, 'created' => false);

	// SELECT ARTICLE
	$res = $mysqli->query("SELECT * FROM article a INNER JOIN panier_article pa ON pa.ID_Article = a.ID WHERE pa.ID_User = ".$mysqli->real_escape_string($id)." ");
	while(($row =  mysqli_fetch_assoc($res))) {
		$data[] = $row;
	}

	// SELECT PROMO
	$res = $mysqli->query("SELECT * FROM promocode a INNER JOIN panier_promo pp ON pp.ID_Promo = a.ID WHERE pp.ID_User = ".$mysqli->real_escape_string($id)." ");
	while(($row =  mysqli_fetch_assoc($res))) {
		$data2[] = $row;
	}

	$panier = CalculateBag($data, $data2);
	/*** Create devis ***/
	$res = $mysqli->query("INSERT INTO devis(ID_User, Societe, Date_Validity, Siret, Tel, Fax, Email, Adresse, CP, Ville, Nom, Prenom, Prix, Reduction, Prix_final) VALUES ("
										." ".$mysqli->real_escape_string($id).", "
										." '".$mysqli->real_escape_string($parsedBody["societe"])."', "
										." DATE_ADD(NOW(), INTERVAL 90 DAY), "
										." '".$mysqli->real_escape_string($parsedBody["siret"])."', "
										." '".$mysqli->real_escape_string($parsedBody["tel"])."', "
										." '".$mysqli->real_escape_string($parsedBody["fax"])."', "
										." '".$mysqli->real_escape_string($parsedBody["email"])."', "
										." '".$mysqli->real_escape_string($parsedBody["adresse"])."', "
										." '".$mysqli->real_escape_string($parsedBody["cp"])."', "
										." '".$mysqli->real_escape_string($parsedBody["ville"])."', "
										." '".$mysqli->real_escape_string($parsedBody["nom"])."', "
										." '".$mysqli->real_escape_string($parsedBody["prenom"])."', "
										." '".$mysqli->real_escape_string($panier["prix_total"])."', "
										." '".$mysqli->real_escape_string($panier["reduction_total"])."', "
										." '".$mysqli->real_escape_string($panier["prix_final"])."' "
										.");");
	$id_devis = $mysqli->insert_id;
	$retour = array('item' => $parsedBody["id"],'id_devis' => $id_devis, 'created' => true);
	$test = "";
	/*** Add Articles ***/
	for($i = 0; $i < count($panier["articles"]); $i++) {
		$mysqli->query("INSERT INTO devis_article (ID_Devis,ID_Article,Qte, Prix, Reduction, Prix_final) VALUES ("
													."".$id_devis.", "
													."".$panier["articles"][$i]["id"].", "
													."'".$panier["articles"][$i]["Qte"]."', "
													."'".$panier["articles"][$i]["prix"]."', "
													."'".$panier["articles"][$i]["reduction"]."', "
													."'".$panier["articles"][$i]["prix_final"]."');");
	}
	$retour = array('id_devis' => $id_devis, 'created' => true);
	/*** Add PromoCode ***/
	for($i = 0; $i < count($panier["promo"]); $i++) {
		$mysqli->query("INSERT INTO devis_promo (ID_Devis,ID_Promo,Reduction) VALUES ("
													."".$id_devis.", "
													."".$panier["promo"][$i]["ID_Promo"].", "
													."'".$panier["promo"][$i]["total"]."');");
	}

	$response = $response->withHeader('Content-type', 'text');
	if ($id_devis > 0)
		$response = $response->withJson($retour, 200);
	else
		$response = $response->withJson($retour, 400);

	return $response;
});
$app->get('/{id}/{token}/promo/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$mysqli->set_charset("utf8");
	$response = $response->withJson($promos, 400);
	$promos = array();
	if (isCorrectIdentificationAdmin($id, $token)) {
		$res = $mysqli->query("SELECT  * FROM promocode");
		while(($row =  mysqli_fetch_assoc($res))) {
			$promos[] = $row;
		}
		$response = $response->withJson($promos, 200);
	}


	$response = $response->withHeader('Content-type', 'text');
  return $response;
});
$app->post('/{id}/{token}/promo/add/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["code"],'insert' => false);
	$res = $mysqli->query("SELECT * FROM `promocode` WHERE code='".$mysqli->real_escape_string($parsedBody["code"])." ' AND Validity > CURRENT_TIMESTAMP");
	$id_promo = 0;
	if ($row = $res->fetch_assoc()){
		$retour = array('item' => $parsedBody["code"],'insert' => true);
		$id_promo = $row['ID'];
	}
	if ($id_promo > 0) {
		$mysqli->query("DELETE FROM `panier_promo` WHERE ID_User = ".$id."");
		$mysqli->query("INSERT INTO panier_promo (ID_User,ID_Promo) VALUES (".$id.", ".$id_promo.") ON DUPLICATE KEY UPDATE ID_Promo=ID_Promo;");
	}

	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->post('/{id}/{token}/promo/insert/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();
	$retour = array('item' => $parsedBody["code"],'insert' => false);

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$mysqli->set_charset("utf8");
	$res = $mysqli->query("SELECT * FROM `promocode` WHERE code='".$mysqli->real_escape_string($parsedBody["code"])."'");
	$check_promo = mysqli_num_rows($res);
	if($check_promo <= 0){
		$mysqli->query("INSERT INTO promocode (Nom, Code, Reduction, Minimum, Type, Catégorie, Validity) VALUES ('".$parsedBody["libelle"]."', '".$parsedBody["code"]."', ".$parsedBody["reduction"].", ".$parsedBody["minimum"]." ,1,0, NOW() + INTERVAL 15 DAY);");
		$retour = array('item' => $parsedBody["code"],'insert' => true);
	}

	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->delete('/{id}/{token}/promo/delete/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);
	if (isCorrectIdentificationAdmin($id, $token)) {
		$mysqli->query("DELETE FROM promocode WHERE ID= ".$parsedBody["id"]." ");
		$retour = array('item' => $parsedBody["id"],'count' => 0);

	}
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->get('/{id}/{token}/count_bag/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$res = $mysqli->query("SELECT COUNT(*) as nb FROM panier_article WHERE ID_User=".$mysqli->real_escape_string($id)." ");
	if ($row = $res->fetch_assoc()){
		$retour = array('count' => $row['nb']);
	}
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->get('/{id}/{token}/count_bag_and_devis/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$nb_bag = "0"; $nb_devis = "0";

	$res = $mysqli->query("SELECT COUNT(*) as nb FROM panier_article WHERE ID_User=".$mysqli->real_escape_string($id)." ");
	if ($row = $res->fetch_assoc()){
		$nb_bag = $row['nb'];
	}

	$res = $mysqli->query("SELECT COUNT(*) as nb FROM devis WHERE ID_User=".$mysqli->real_escape_string($id)." ");
	if ($row = $res->fetch_assoc()){
		$nb_devis = $row['nb'];
	}
	$retour = array('count_bag' => $nb_bag, 'count_devis' => $nb_devis);
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->get('/{id}/{token}/bag/', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');
	$token =  $request->getAttribute('token');

	$timestamps =  time();
	$data = array();
	$data2 = array();
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$mysqli->set_charset("utf8");
	if ($mysqli->connect_errno) {
		echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}

	// SELECT ARTICLE
	$res = $mysqli->query("SELECT * FROM article a INNER JOIN panier_article pa ON pa.ID_Article = a.ID WHERE pa.ID_User = ".$mysqli->real_escape_string($id)." ");
	while(($row =  mysqli_fetch_assoc($res))) {
		$data[] = $row;
	}

	// SELECT PROMO
	$res = $mysqli->query("SELECT * FROM promocode a INNER JOIN panier_promo pp ON pp.ID_Promo = a.ID WHERE pp.ID_User = ".$mysqli->real_escape_string($id)." ");
	while(($row =  mysqli_fetch_assoc($res))) {
		$data2[] = $row;
	}

	$retour = CalculateBag($data, $data2);

	$response = $response->withHeader('Content-type', 'application/json');
	
	$response = $response->withJson($retour, 200);

  return $response;
});
$app->post('/{id}/{token}/bag/add/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);

	$mysqli->query("INSERT INTO panier_article (ID_User,ID_Article,Qte) VALUES (".$id.", ".$parsedBody["id"].", ".$parsedBody["nb"].") ON DUPLICATE KEY UPDATE Qte=Qte+".$parsedBody["nb"].";");
	$res = $mysqli->query("SELECT COUNT(*) as nb FROM panier_article WHERE ID_User=".$mysqli->real_escape_string($id)." ");
	if ($row = $res->fetch_assoc()){
		$retour = array('item' => $parsedBody["id"],'count' => $row['nb']);
	}
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->post('/{id}/{token}/bag/remove/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);

	$mysqli->query("DELETE FROM panier_article WHERE ID_User= ".$id." AND ID_Article = ".$parsedBody["id"]." ");
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->post('/{id}/{token}/bag/update/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);

	$mysqli->query("UPDATE panier_article SET Qte = ".$parsedBody["qte"]." WHERE ID_User= ".$id." AND ID_Article = ".$parsedBody["id"]." ");
	$retour = array('item' => $parsedBody["id"],'count' => 0, 'sql'=>"UPDATE FROM panier_article SET Qte = ".$parsedBody["qte"]." WHERE ID_User= ".$id." AND ID_Article = ".$parsedBody["id"]." ");
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->get('/{id}/{token}/users/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");

	$users = array();

	if (isCorrectIdentificationAdmin($id, $token)) {
		$res = $mysqli->query("SELECT ID, Login, 'DTC je le passe pas' AS Password, Admin FROM user");
		while(($row =  mysqli_fetch_assoc($res))) {
			$users[] = $row;
		}
	}


	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($users, 302);
    return $response;
});
$app->post('/{id}/{token}/users/insert/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$nb_bag = "0"; $nb_devis = "0";

	$users = array();
	$retour = array('item' => $parsedBody, 'created' => false);
	if (isCorrectIdentificationAdmin($id, $token)) {
		$res = $mysqli->query("SELECT * FROM user WHERE Login='".$mysqli->real_escape_string($parsedBody["Login"])."'");
		if ($row = $res->fetch_assoc()){

		} else {
			$res = $mysqli->query("INSERT INTO user (Login, Password, Admin) VALUES ('".$mysqli->real_escape_string($parsedBody["Login"])."','".$mysqli->real_escape_string($parsedBody["Password"])."', ".$mysqli->real_escape_string($parsedBody["Admin"]).");");
			$retour = array('item' => $parsedBody, 'created' => true);
		}
	}


	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->post('/{id}/{token}/users/update/statut', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);
	if (isCorrectIdentificationAdmin($id, $token) && ($parsedBody["id"] != $id)) {
		$mysqli->query("UPDATE user SET Admin = ".$parsedBody["statut"]." WHERE ID= ".$parsedBody["id"]." ");
		$retour = array('item' => $parsedBody["id"],'count' => 0);

	}
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->post('/{id}/{token}/users/update/mdp', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);
	if (isCorrectIdentificationAdmin($id, $token)) {
		$mysqli->query("UPDATE user SET Password = '".$parsedBody["mdp"]."' WHERE ID= ".$parsedBody["id"]." ");
		$retour = array('item' => $parsedBody["id"],'count' => 0);

	}
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});
$app->delete('/{id}/{token}/users/delete/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);
	if (isCorrectIdentificationAdmin($id, $token)) {
		$mysqli->query("DELETE FROM user WHERE ID= ".$parsedBody["id"]." ");
		$retour = array('item' => $parsedBody["id"],'count' => 0);

	}
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
    return $response;
});

$app->get('/login', function (Request $request, Response $response) {
	$data = array();
	//$name = $request->getAttribute('name');
	$nom =  $request->getQueryParams()["login"];
	$mdp = $request->getQueryParams()["mdp"];
	//echo  $request->getUri();
	$response = $response->withHeader('Content-type', 'application/json');

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$res = $mysqli->query("SELECT * FROM user WHERE Login='".$mysqli->real_escape_string($nom)."' AND  Password='".$mysqli->real_escape_string($mdp)."'");
	$check_user = mysqli_num_rows($res);
	if($check_user>0){
		//$res->data_seek(0);
		if ($row = $res->fetch_assoc()){
			$token = bin2hex(random_bytes(25));
			$data = array('ID' => $row['ID'],'login' => $row['Login'], 'really' => $row['Admin'], 'mdp' => 'ESPECE DE CURIEUX ! :p', 'token' => $token);
			$mysqli->query("UPDATE user SET Token='".$token."' WHERE ID=".$row['ID']." ");
			$response = $response->withJson($data, 200);
		}
	} else {
		$response = $response->withJson($data, 400);
	}

    return $response;
});
$app->run();
/*

DATEADD(hh, -2, GETDATE())
*/
/*$res = $mysqli->query("SELECT ID FROM user");

echo "Ordre du jeu de résultats...\n";
$res->data_seek(0);
while ($row = $res->fetch_assoc()) {
    echo " id = " . $row['ID'] . "\n";
}*/
    //$response->getBody()->write("Hello, $name");
	//$response = $response->withStatus(302);

?>
