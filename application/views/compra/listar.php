<?php /** @var object $comp_list */ ?>
<section style="padding: 0em;">
    <div class="callout callout-info">
        <h2>Compras</h2>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <a href="<?= site_url(['compra', 'create']) ?>" class="btn btn-success" style="margin-bottom:1.3em;">
                <i class="fa fa-plus"></i>
                <span>Agregar nueva compra</span>
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
                        <th>Proveedor</th>
                        <th>Fecha</th>
                        <th>Detalles</th>
                        <th>Total</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        if (count($comp_list) == 0) : ?>
                            <tr>
                                <td colspan="7">No se han encontrado resultados</td>
                            </tr>
                        <?php else: foreach ($comp_list as $row): ?>
                            <tr>
                                <td><?= $row->comp_cod ?></td>
                                <td><?= $row->prov_razon_social ?></td>
                                <td><?= $row->comp_fecha ?></td>
                                <td><a title="Ver detalles"
                                       href="<?= site_url(array('compra', 'detalles', $row->comp_cod)) ?>"
                                       class="btn btn-primary btn-sm"><i class="fa fa-eye"></i>Detalles</a></td>
                                <td><?= $row->comp_costo_total ?></td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <a hidden title="Editar"
                                           href="<?= site_url(array('compra', 'registrar', $row->comp_cod)) ?>"
                                           class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                        <a title="Eliminar"
                                           href="<?= site_url(array('compra', 'borrar', $row->comp_cod)) ?>"
                                           class="btn btn-danger btn-sm"><i class="fa fa-remove"></i></a>
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