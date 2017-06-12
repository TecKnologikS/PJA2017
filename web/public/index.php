<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';


function CalculateBag($article, $promo) {
	$prix_final = 0; $prix_total = 0; $reduction_total = 0;
	
	for($i = 0; $i < count($article); $i++) {
		$prix_total += $article[$i]["prix"];
		$article[$i]["prix_final"] = $article[$i]["prix"];
		$article[$i]["reduction"] = 0;
	}
	
	for($i = 0; $i < count($promo); $i++) {
		switch($promo[$i]["Type"]) {
			case "1":
			if ($prix_total >= $promo[$i]["Minimum"]) {
				$prix_final = 0; $reduction_total = 0;
				for($j = 0; $j < count($article); $j++) {
					$reduction = (($article[$j]["prix"]*$promo[$i]["Reduction"]) / 100);
		            $article[$j]["prix_final"] = $article[$j]["prix"] - $reduction;
		            $article[$j]["reduction"] = $reduction;
					$prix_final += $article[$j]["prix_final"];
					$reduction_total += $reduction;
	            }
			}
			break;
			default:
			break;
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
	$res = $mysqli->query("SELECT * FROM article WHERE 1=1 ".$args);
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
	$response = $response->withJson($data, 302);
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
	//TODO: a activer
	/*
	$res = $mysqli->query("SELECT COUNT(*) as nb FROM devis_article WHERE ID_User=".$mysqli->real_escape_string($id)." ");
	if ($row = $res->fetch_assoc()){
		$nb_devis = $row['nb'];
	}*/
	$retour = array('count_bag' => $nb_bag, 'count_devis' => $nb_devis);
	$response = $response->withHeader('Content-type', 'text');
	$response = $response->withJson($retour, 302);
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
	$response = $response->withJson($data, 302);
    return $response;
});
$app->post('/{id}/{token}/bag/add/', function ($request, $response, $args) {
	$id = $args['id'];
	$token = $args['token'];
	$parsedBody = $request->getParsedBody();
	
	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$retour = array('item' => $parsedBody["id"],'count' => 0);
	
	$mysqli->query("INSERT INTO panier_article (ID_User,ID_Article,Qte) VALUES (".$id.", ".$parsedBody["id"].", 1) ON DUPLICATE KEY UPDATE Qte=Qte+1;");
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
$app->get('/login', function (Request $request, Response $response) {
	$data = array();
	//$name = $request->getAttribute('name');
	$nom =  $request->getQueryParams()["login"];
	$mdp = $request->getQueryParams()["mdp"];
	//echo  $request->getUri();

	$mysqli = new mysqli("127.0.0.1", "root", "T3cKnolog!kS", "commercial");
	$res = $mysqli->query("SELECT * FROM user WHERE Login='".$mysqli->real_escape_string($nom)."' AND  Password='".$mysqli->real_escape_string($mdp)."'");
	$check_user = mysqli_num_rows($res);
	if($check_user>0){
		//$res->data_seek(0);
		if ($row = $res->fetch_assoc()){
			$token = bin2hex(random_bytes(25));
			$data = array('ID' => $row['ID'],'login' => $row['Login'], 'mdp' => 'ESPECE DE CURIEUX ! :p', 'token' => $token);
			$mysqli->query("UPDATE user SET Token='".$token."' WHERE ID=".$row['ID']." ");
		}
	}
	$response = $response->withHeader('Content-type', 'application/json');
	$response = $response->withJson($data, 302);
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
