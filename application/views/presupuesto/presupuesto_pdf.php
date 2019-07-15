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
    $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));

    //editado
    //$pdf->SetAutoPageBreak(false);
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
    // set auto page breaks
    $pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);

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

    $pdf->SetTitle("Presupuesto CSM-{$pres->pres_cod}");

    $pdf->SetFont($ARIAL, 'B', 10);
    $pdf->Cell(15, 5, "Presupuesto Nº: $pres->pres_cod", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, '', 10);
    $pdf->Cell(15, 5, "Fecha", 0, false, $LEFT);
    $pdf->Cell(15, 5, ": $pres->pres_fecha_emision", 0, true, $LEFT);
    $pdf->Cell(15, 5, "Cliente", 0, false, $LEFT);
    $pdf->Cell(15, 5, ": $pres->cli_razon_social", 0, true, $LEFT);
    $pdf->Cell(15, 5, "Lugar", 0, false, $LEFT);
    $pdf->Cell(15, 5, ": $pres->pres_lugar_trabajo", 0, true, $LEFT);

    $pdf->Cell(15, 5, "", 0, true, $LEFT);
    $pdf->SetFont($ARIAL, 'B', 10);
    $pdf->Cell(15, 5, "Descripción:", 0, true, $LEFT);
    $pdf->SetFont($ARIAL, '', 10);
    $pdf->Cell(50, 5, "$pres->pres_descripcion", 0, true, $LEFT);

    $pdf->Cell(15, 5, "", 0, true, $LEFT);
    $pdf->SetFont($ARIAL, 'B', 10);
    $pdf->Cell(15, 5, "Montos:", 0, true, $LEFT);
    $pdf->SetFont($ARIAL, '', 10);
    $pdf->Cell(40, 5, "Costo de mano de obra", 0, false, $LEFT);
    $pdf->Cell(30, 5, ": $pres->pres_costo_mano_obra", 0, true, $LEFT);
    $pdf->Cell(40, 5, "Costo de materiales", 0, false, $LEFT);
    $pdf->Cell(30, 5, ": $pres->pres_costo_materiales", 0, true, $LEFT);
    $pdf->Cell(40, 5, "Costo total", 0, false, $LEFT);
    $pdf->Cell(30, 5, ": $pres->pres_costo_total", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, '', 8.5);
    $pdf->Cell(15, 5, "", 0, true, $LEFT);
    $pdf->Cell(35, 0, "¡Gracias por su preferencia!", 0, false, $CENTER);

    $pdf->Output(APPPATH."documentos/presupuesto_$pres->pres_cod.pdf", 'FI');
