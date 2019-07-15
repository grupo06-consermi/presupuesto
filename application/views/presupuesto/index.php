<section style="padding: 0em;">
    <div class="callout callout-info">
        <h2>Presupuestos</h2>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <a href="<?= site_url(['presupuesto', 'create']) ?>" class="btn btn-success" style="margin-bottom:1.3em;">
                <i class="fa fa-plus"></i>
                <span>Crear presupuesto</span>
            </a>
        </div>
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
                <table class="table table-striped table-borbered table-hover">
                    <thead>
                    <tr>
                        <th>Cód</th>
                        <th>Cliente</th>
                        <th>F. Emisión</th>
                        <th>F. Recepción</th>
                        <th>Forma Pago</th>
                        <th>Lugar Trabajo</th>
                        <th>Estado</th>
                        <th>Presupuesto</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php /** @var object $records */
                        if (count($records) == 0) : ?>
                            <tr>
                                <td colspan="7">No se han encontrado resultados</td>
                            </tr>
                        <?php
                        else:
                            foreach ($records as $row):
                                ?>
                                <tr>
                                    <td><?= $row->pres_cod ?></td>
                                    <td><?= $row->cli_razon_social ?></td>
                                    <td><?= $row->pres_fecha_emision ?></td>
                                    <td><?= $row->pres_fecha_recepcion ?></td>
                                    <td><?= getFormaPago()[$row->pres_forma_pago] ?></td>
                                    <td><?= $row->pres_lugar_trabajo ?></td>
                                    <td><?= getSituacionPresupuesto()[$row->pres_situacion] ?></td>
                                    <td>
                                        <?php if ($row->pres_situacion == PRES_NUEVO) { ?>
                                            <a title="Aceptar"
                                               href="<?= site_url(array('presupuesto', 'set_acepted', $row->pres_cod)) ?>"
                                               class="btn btn-default btn-sm"><i class="fa fa-check"></i> Aceptar</a>
                                        <?php } elseif ($row->pres_situacion == PRES_ACEPTADO) { ?>
                                            <a title="Ejecutar"
                                               href="<?= site_url(array('ejecucion', 'createOn', $row->pres_cod, 'presupuesto')) ?>"
                                               class="btn btn-default btn-sm"><i class="fa fa-play"></i> Ejecutar</a>
                                        <?php } elseif ($row->pres_situacion == PRES_EN_EJECUCION) { ?>
                                            <a title="Ejecutar"
                                               href="<?= site_url(array('conformidad', 'createOn', $row->pres_cod, 'presupuesto')) ?>"
                                               class="btn btn-default btn-sm"><i class="fa fa-sticky-note"></i>
                                                Conformidad</a>
                                        <?php } ?>
                                        <?php if ($row->pres_situacion == PRES_NUEVO) { ?>
                                            <a title="Rechazar"
                                               href="<?= site_url(array('presupuesto', 'set_rechazado', $row->pres_cod)) ?>"
                                               class="btn btn-default btn-sm"><i class="fa fa-close"></i> Rechazar</a>
                                        <?php } ?>
                                    </td>
                                    <td>
                                        <div class="btn-group btn-group-sm">
                                            <?php if ($row->pres_situacion >= PRES_ACEPTADO) { ?>
                                                <a title="Ver"
                                                   href="<?= site_url(array('presupuesto', 'show', $row->pres_cod)) ?>"
                                                   class="btn btn-warning btn-sm"><i class="fa fa-eye"></i></a>
                                            <?php } ?>
                                            <?php if ($row->pres_situacion == PRES_NUEVO || $row->pres_situacion == PRES_ENVIADO || $row->pres_situacion == PRES_ACEPTADO) { ?>
                                                <a title="Editar"
                                                   href="<?= site_url(array('presupuesto', 'edit', $row->pres_cod)) ?>"
                                                   class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                            <?php } ?>
                                            <?php if ($row->pres_situacion == PRES_NUEVO || $row->pres_situacion == PRES_ENVIADO || $row->pres_situacion == PRES_ANULADO) { ?>
                                                <a title="Eliminar"
                                                   href="<?= site_url(array('presupuesto', 'borrar', $row->pres_cod)) ?>"
                                                   class="btn btn-danger btn-sm"><i class="fa fa-remove"></i></a>
                                            <?php } ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            endforeach;
                        endif;
                    ?>
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