<section style="padding: 1.5em;">
    <div class="callout callout-info">
        <h2>Presupuestos</h2>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <a href="<?= site_url(['presupuesto', 'create']) ?>" class="btn btn-success" style="margin-bottom:1.3em;">
                <i class="fa fa-plus"></i>
                <span>Agregar</span>
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
                            <th>Cliente</th>
                            <th>F. Emisión</th>
                            <th>F. Recepción</th>
                            <th>Forma Pago</th>
                            <th>Lugar Trabajo</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if(count($records) == 0) : ?>
                        <tr>
                            <td colspan="7">No se han encontrado resultados</td>
                        </tr>
                        <?php 
                            else: 
                                foreach($records as $row):
                        ?>
                            <tr>
                                <td><?=$row->cli_razon_social?></td>
                                <td><?=$row->pres_fecha_emision?></td>
                                <td><?=$row->pres_fecha_recepcion?></td>
                                <td><?=$row->pres_forma_pago?></td>
                                <td><?=$row->pres_lugar_trabajo?></td>
                                <td><?=$row->pres_estado?></td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <a title="Visualizar" href="<?= site_url(array('presupuesto','show', $row->pres_cod)) ?>" class="btn btn-default btn-sm"><i class="fa fa-eye"></i></a>
                                        <a title="Editar" href="<?= site_url(array('presupuesto','edit', $row->pres_cod)) ?>" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                        <a title="Eliminar" href="<?= site_url(array('presupuesto','destroy', $row->pres_cod)) ?>" class="btn btn-danger btn-sm"><i class="fa fa-remove"></i></a>
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