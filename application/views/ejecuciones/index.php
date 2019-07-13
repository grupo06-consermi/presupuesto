<div style='padding: 1.5em;'>
    <div class="callout callout-info">
        <h2>Lista de Ejecuciones</h2>
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
                <tr>
                    <!--<th>Código</th>-->
                    <th># Ejecucion</th>
                    <th>Fecha de Recepcion</th>
                    <th>O.D.M</th>
                    <th>Emisor</th>
                    <th># Presupuesto</th>
                    <th>Estado</th>
                </tr>
                </thead>
                <tbody>
                <?php /** @var object $rows */
                    foreach ($rows as $row): ?>
                    <tr>
                        <td><?= $row->ord_num_orden ?></td>
                        <td><?= $row->ord_fecha ?></td>
                        <td><?= $row->ord_odm ?></td>
                        <td><?= $row->ord_emisor ?></td>
                        <td><?= $row->pres_cod ?></td>
                        <td> <?= $row->ord_estado == '1' ? '<i class="fa fa-fw fa-check"></i>' :
                                '<i class="fa fa-fw fa-remove"></i>' ?></td>



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

