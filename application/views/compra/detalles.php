<?php /** @var object $comp_list */ ?>
<section style="padding: 1.5em;">
    <div class="callout callout-info">
        <h2>Detalles de compra <?php echo $comp_id; ?></h2>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-borbered table-hover">
                    <thead>
                    <tr>
                        <th>Cód</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        if (count($compdet_list) == 0) : ?>
                            <tr>
                                <td colspan="7">No se han encontrado resultados</td>
                            </tr>
                        <?php else: foreach ($compdet_list as $row): ?>
                            <tr>
                                <td><?= $row->prod_cod ?></td>
                                <td><?= $row->prod_nombre_comercial ?></td>
                                <td><?= $row->cdet_cantidad ?></td>
                                <td><?= $row->cdet_total ?></td>
                                <td><?= $row->cdet_importe ?></td>
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