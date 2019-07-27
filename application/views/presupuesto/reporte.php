<section style="padding: 0;">
<div class="callout callout-info">
    <h2>Presupuestos</h2>
</div>
<div class="row">
<div class="col-xs-12">
	<?php if ($this->session->flashdata('correcto')): ?>
        <div class="alert alert-success alert-dismissible fade in" role="alert">
            <strong>Correcto : </strong>&nbsp;<?php echo $this->session->flashdata('correcto'); ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
	<?php endif ?>
	
	<?php if ($this->session->flashdata('error')): ?>
        <div class="alert alert-danger alert-dismissible fade in" role="alert">
            <strong>Error : </strong>&nbsp;<?php echo $this->session->flashdata('error'); ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
	<?php endif ?>
</div>
<div class="col-xs-12">
<div class="table-responsive">
<table class="table table-striped table-borbered table-hover" style='font-size: 10pt;'>
<thead>
<tr>
    <th rowspan='2'>Nº</th>
    <th rowspan='2'>F. Emisión</th>
    <th rowspan='2'>F. Recepción</th>
    <th rowspan='2'>Empresa</th>
    <th rowspan='2'>E/P</th>
    <th rowspan='2'>Detalle</th>
    <th rowspan='2'>Monto Sin IGV S/</th>
    <th rowspan='2'>Estado</th>
    <th rowspan='2'>Encargado</th>
    <th rowspan='2'>Lugar Trabajo</th>
    <th colspan='2'>Orden compra</th>
    <th colspan='4'>Acta conformidad</th>
</tr>
<tr>
    <!-- compras -->
    <th>NºOrden</th>
    <th>Fecha O/C</th>
    <!-- conformidad -->
    <th>Inicio</th>
    <th>Fin</th>
    <th>VºBº</th>
    <th>NºActa</th>
</tr>
</thead>
<tbody>
<?php /** @var object[] $records */ ?>
<?php if (count($records) == 0) { ?>
    <tr>
        <td colspan="7">No se han encontrado resultados</td>
    </tr>
<?php } else { ?>
	<?php foreach ($records as $row) { ?>
        <tr>
            <td><?= $row->pres_numero ?></td>
            <td><?= formatDate($row->pres_fecha_emision) ?></td>
            <td><?= formatDate($row->pres_fecha_recepcion) ?></td>
            <td><?= $row->cli_razon_social ?></td>
            <td><?= "" ?></td>
            <td><?= $row->pres_descripcion ?></td>
            <td><?= $row->pres_costo_total ?></td>
            <td><?= getEstados()[$row->pres_estado] ?></td>
            <td><?= $row->pres_encargado ?></td>
            <td><?= $row->pres_lugar_trabajo ?></td>
            <td><?= '' ?></td>
            <td><?= '' ?></td>
            <td><?= formatDate($row->conf_fecha_inicio) ?></td>
            <td><?= formatDate($row->conf_fecha_fin) ?></td>
            <td><?= $row->conf_estado == 1 ? 'OK' : ''; ?></td>
            <td><?= $row->conf_act_conformidad ?></td>
        </tr>
	<?php }
} ?>
</tbody>
</table>
</div>
</div>
</div>
</section>
<script>
    $(document).ready(function () {
        $('.table').DataTable({
            language: {
                url: '//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json'
            },
            dom     : 'Bfrtip',
            buttons : [
                'excel', 'pdf', 'print'
            ]
        });
    });
</script>