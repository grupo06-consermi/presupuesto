<?php
    /** @var object $pres */

    tcpdf();
    $pdf = new TCPDF('P', PDF_UNIT, 'A4', true, 'UTF-8', false);

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
    //editado
    //$pdf->SetMargins(2, 2, 2);

    // set margins
    $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);

    // set default header data
    $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));
    $pdf->setFooterData(array(0,64,0), array(0,64,128));

    //editado
    //$pdf->SetAutoPageBreak(false);
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
     // set auto page breaks
    $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

    $pdf->AddPage();

    $pdf->setFontStretching(92);
    $pdf->setFontSpacing(0.01);

    // Variables de configuracion de pagina:
    $ARIAL      = 'Helvetica';
    $LEFT       = 'L';
    $RIGHT      = 'R';
    $CENTER     = 'C';
    $lineHeight = 5.2;

    $pdf->SetCreator(PDF_CREATOR);

    $pdf->SetAuthor('Nicola Asuni');

    $pdf->SetTitle("Presupuesto CSM-$pres->pres_cod");

    $pdf->SetFont('times', 'BI', 20);


    $pdf->Cell(105, 5, "Fecha:$pres->pres_fecha_emision", 0, false, $RIGHT);

    $pdf->Cell(15, 0, "Presupuesto Nº: $pres->pres_cod", 0, false, $LEFT);


    $pdf->Output(APPPATH."documentos/presupuesto_$pres->pres_cod.pdf", 'FI');


