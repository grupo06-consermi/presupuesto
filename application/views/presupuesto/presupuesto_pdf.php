<?php
    /** @var object $pres */
    /** @var object $detalles */

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
    $pdf->SetCreator(PDF_CREATOR);

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

    $pdf->SetTitle("CSM-{$pres->pres_numero}");
    $pdf->Image('assets/images/logoconsermi.png', 10, 10, 200, 40, 'png');
    $pdf->SetY(60);

    $pdf->SetFont($ARIAL, 'BIU', 12);
    $pdf->Cell(180, 5.5, "Presupuesto Nº: CSM-$pres->pres_numero", 0, true, $CENTER);
    $pdf->Cell(180, 5.5, "", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, 'B', 11);
    $pdf->Cell(15, 5.5, "Señores", 0, false, $LEFT);
    $pdf->SetFont($ARIAL, '', 10);
    $pdf->Cell(15, 5.5, ": $pres->cli_razon_social", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, 'B', 11);
    $pdf->Cell(15, 5.5, "Sistema", 0, false, $LEFT);
    $pdf->SetFont($ARIAL, '', 11);
    $pdf->Cell(15, 5.5, ": $pres->pres_descripcion", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, 'B', 11);
    $pdf->Cell(15, 5.5, "Lugar", 0, false, $LEFT);
    $pdf->SetFont($ARIAL, '', 11);
    $pdf->Cell(15, 5.5, ": $pres->pres_lugar_trabajo", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, 'B', 11);
    $pdf->Cell(15, 5.5, "Fecha", 0, false, $LEFT);
    $pdf->SetFont($ARIAL, '', 10);
    $pdf->Cell(15, 5.5, ": ".formatDateAM($pres->pres_fecha_emision), 0, true, $LEFT);

    $pdf->Line(15, $pdf->GetY() + 2, 195, $pdf->GetY() + 2);
    $pdf->Cell(15, 5.5, "", 0, true, $LEFT);
    $pdf->SetFont($ARIAL, 'B', 11);

    $pdf->SetFont($ARIAL, 'BIU', 11);
    $pdf->Cell(180, 5.5, "Suministro de materiales consumibles:", 0, true, $LEFT);
    $pdf->Cell(180, 5.5, "", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, 'B', 11);
    $pdf->Cell(75, 5.5, "Descripción", 1, false, $CENTER);
    $pdf->Cell(25, 5.5, "Cant.", 1, false, $CENTER);
    $pdf->Cell(25, 5.5, "Unid.", 1, false, $CENTER);
    $pdf->Cell(30, 5.5, "Precio Unit.", 1, false, $CENTER);
    $pdf->Cell(25, 5.5, "Precio Total", 1, true, $CENTER);

    foreach ($detalles as $det) {
        $pdf->Cell(75, 5.5, mb_strcut($det->prod_nombre_comercial, 0, 34), 1, false, $LEFT);
        $pdf->Cell(25, 5.5, "$det->dpre_cantidad", 1, false, $RIGHT);
        $pdf->Cell(25, 5.5, "Unid.", 1, false, $CENTER);
        $pdf->Cell(30, 5.5, "$det->dpre_precio", 1, false, $RIGHT);
        $pdf->Cell(25, 5.5, nformat($det->dpre_precio * $det->dpre_cantidad, 2), 1, true, $RIGHT);
    }

    $pdf->Cell(155, 5.5, "", 0, false, $RIGHT);
    $pdf->Cell(25, 5.5, $pres->pres_costo_materiales, 1, true, $RIGHT);

    $pdf->Cell(180, 5.5, "", 0, true, $LEFT);

    $pdf->Cell(15, 5.5, "Montos:", 0, true, $LEFT);
    $pdf->SetFont($ARIAL, '', 11);
    $pdf->Cell(40, 5.5, "Costo de materiales", 0, false, $LEFT);
    $pdf->Cell(30, 5.5, ": $pres->pres_costo_materiales", 0, true, $LEFT);

    $pdf->Cell(40, 5.5, "Costo de mano de obra", 0, false, $LEFT);
    $pdf->Cell(30, 5.5, ": $pres->pres_costo_mano_obra", 0, true, $LEFT);

    $pdf->Cell(40, 5.5, "Costo total", 0, false, $LEFT);
    $pdf->Cell(30, 5.5, ": $pres->pres_costo_total", 0, true, $LEFT);

    $pdf->SetFont($ARIAL, '', 10);
    $pdf->Cell(15, 5.5, "", 0, true, $LEFT);
    $pdf->Cell(180, 5.5, "¡Gracias por su preferencia!", 0, true, $CENTER);

    $pdf->Output(APPPATH."documentos/presupuesto_$pres->pres_cod.pdf", 'FI');
