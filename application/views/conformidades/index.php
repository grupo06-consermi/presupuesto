<div style='padding: 1.5em;'>
    <div class="callout callout-info">
        <h2>Lista de Conformidades</h2>
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
            <table class="table table-striped table-bordered">
                <thead>
                <!--<th>Código</th>-->
                <th>Fecha Inicio</th>
                <th>Fecha Fin</th>
                <th>Estado</th>
                <th># Conformidad</th>
                <th># Presupuesto</th>
                <th>Acciones</th>
                </thead>
                <tbody>
                <?php foreach ($rows as $row): ?>
                    <tr>
                        <td><?= $row->conf_fecha_inicio ?></td>
                        <td><?= $row->conf_fecha_fin ?></td>
                        <td> <?= $row->conf_estado == '1' ? '<i class="fa fa-fw fa-check"></i>' :
                                '<i class="fa fa-fw fa-remove"></i>' ?></td>
                        <td><?= $row->conf_act_conformidad ?></td>
                        <td><?= $row->pres_cod ?></td>
                        <td>
                            <div class="btn-group btn-group-sm">
                                <a title="Editar" class="btn btn-primary"
                                   href="<?= site_url('conformidad/edit/'.$row->conf_cod) ?>">
                                    <i class="fa fa-fw fa-pencil"></i>
                                </a>
                                <a title="Eliminar" class="btn btn-danger"
                                   href="<?= site_url('conformidad/destroy/'.$row->conf_cod) ?>">
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