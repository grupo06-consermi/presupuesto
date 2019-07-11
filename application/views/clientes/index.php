<div style='padding: 1.5em;'>
    <div class="callout callout-info">
        <h2>Lista de Clientes</h2>
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
            <a class="btn btn-success" href="<?= site_url(['cliente', 'create']) ?>" style="margin-bottom: 1.3em;">
                <i class="fa fa-fw fa-plus"></i> Agregar
            </a>
        </div>

        <div class="col-xs-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Razon Social</th>
                    <th>R.U.C</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>E-Mail</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <?php /** @var object $rows */
                    foreach ($rows as $row): ?>
                        <tr>
                            <td><?= $row->cli_razon_social ?></td>
                            <td><?= $row->cli_ruc ?></td>
                            <td><?= $row->cli_direccion ?></td>
                            <td><?= $row->cli_telefono ?></td>
                            <td><?= $row->cli_email ?></td>
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a title="Editar" class="btn btn-primary"
                                       href="<?= site_url('cliente/edit/'.$row->cli_codigo) ?>">
                                        <i class="fa fa-fw fa-pencil"></i>
                                    </a>
                                    <a title="Eliminar" class="btn btn-danger"
                                       href="<?= site_url('cliente/destroy/'.$row->cli_codigo) ?>">
                                        <i class="fa fa-fw fa-remove"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>