<?php
require("part/basicFunctionLoad.php");
// Include the main TCPDF library (search for installation path).
require_once('lib/tcpdf_include.php');

class MYPDF extends TCPDF {

	//Page header
	public function Header() {
		// Logo
		$image_file ='img/logo.jpg';
		$this->Image($image_file, 5, 5, 15, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// Set font
		$this->SetFont('helvetica', 'B', 30);
		// Title
		$this->Cell(0, 15, 'Devis n°'.$_GET["id"], 0, false, 'C', 0, '', 0);
		//$this->Cell(0, 15, 'Devis n°'.$_GET["id"], 0, false, 'C', 0, '', 0, false, 'M', 'M');
	}

	// Page footer
	public function Footer() {
		// Position at 15 mm from bottom
		$this->SetY(-15);
		// Set font
		$this->SetFont('helvetica', 'I', 8);
		// Page number
		$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
	}
}

  $ID_USER = $_SESSION["id"];
  $ID_DEVIS = $_GET["id"];
  $TOKEN = $_SESSION["token"];

$service_url = "http://commercial.tecknologiks.com/index.php/{id}/{token}/devis/".$ID_DEVIS."/";
$bag = json_decode(file_get_contents(
      str_replace(
        array("{id}", 					"{token}"),
        array($ID_USER, $TOKEN),
        $service_url)), true);

$devis = $bag["devis"];
$articles = $bag["articles"];
$promo = $bag["promo"];

// create new PDF document
//$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Robin PAUQUET & Pierre MEHU');
$pdf->SetTitle('Devis n°'.$ID_DEVIS);
$pdf->SetSubject('Pour la société '.$devis["Societe"]);
$pdf->SetKeywords('Devis, PDF, export');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 006', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);


// ---------------------------------------------------------

// set font
$pdf->SetFont('dejavusans', '', 10);

// add a page
$pdf->AddPage();



include("part/devis_export.php");
// create some HTML content
$html = ob_get_clean();

// output the HTML content
$pdf->writeHTML($html, true, false, true, false, '');


$pdf->Output('devis_'.$_GET["id"].'.pdf', 'I');

 ?>
