<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

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
	
	//TODO: add item to panier 
	$mysqli->query("INSERT INTO panier_article (ID_User,ID_Article,Qte) VALUES (".$id.", ".$parsedBody["id"].", 1) ON DUPLICATE KEY UPDATE Qte=Qte+1;");
	$res = $mysqli->query("SELECT COUNT(*) as nb FROM panier_article WHERE ID_User=".$mysqli->real_escape_string($id)." ");
	if ($row = $res->fetch_assoc()){
		$retour = array('item' => $parsedBody["id"],'count' => $row['nb']);
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
