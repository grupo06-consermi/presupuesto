<?php
    /** @var object $pres */

    tcpdf();
    $pdf = new TCPDF('P', PDF_UNIT, 'A6', true, 'UTF-8', false);
    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
    $pdf->SetMargins(2, 2, 2);
    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);
    $pdf->SetAutoPageBreak(false);
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
    $pdf->AddPage();

    $pdf->setFontStretching(92);
    $pdf->setFontSpacing(0.01);

    // Variables de configuracion de pagina:
    $ARIAL      = 'Helvetica';
    $LEFT       = 'L';
    $RIGHT      = 'R';
    $CENTER     = 'C';
    $lineHeight = 5.2;

    $pdf->Cell(15, 0, "Fecha:", 0, false, $LEFT);
    $pdf->Cell(15, 0, "Presupuesto Nº: $pres->pres_cod", 0, false, $LEFT);

    $pdf->Output("comprobante1.pdf", 'I');
