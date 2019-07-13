<?php
    /** @var object $cli_list */
    /** @var object $reporte */
?>
    <div class="row">
        <h2>Reporte de situacion de presupuestos</h2>
        <div class="col-xs-12 col-md-offset-2 col-md-8">
            <form enctype="multipart/form-data" class="form-horizontal" method="post">
                <div class="col-xs-4">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Año</span>
                        <label for='cboAnio'></label>
                        <select name='cboAnio' id='cboAnio' class="form-control">
                            <?php for ($i = 2019; $i >= 2015; $i--) { ?>
                                <option value='<?= $i ?>'><?= $i ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Cliente</span>
                        <label for='cboClientes'></label>
                        <select name='cboClientes' id='cboClientes' class="form-control">
                            <option value='0'>(Todos los clientes)</option>
                            <?php foreach ($cli_list as $cli_row) { ?>
                                <option value='<?= $cli_row->cli_codigo ?>'><?= $cli_row->cli_razon_social ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="col-xs-2">
                    <button class="btn btn-primary">
                        <i class="fa fa-check"></i><span>Consultar</span>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Grafico de barras presupuesto -->
    <hr class='separator tmarg10 bmarg5'/>
<?php if ($cli_data) { ?>
    <h4><?= "Reporte para: ".$cli_data->cli_razon_social.' en el año '.$anio; ?></h4>
<?php } else { ?>
    <h4><?= "Reporte para: Todos los clientes en el año ".$anio; ?></h4>
<?php } ?>
    <div style='min-width: 450px; max-width: 1050px; max-height: 300px;' class='centered pad15 rpad25'>
        <canvas id="bar_chart" width='650' height='350'></canvas>
    </div>
    <!-- calculo -->
    <script>
        var chart1_label  = [];
        var chart1_conteo = [];
    </script>
<?php $i = 0; ?>
<?php foreach ($reporte as $item) { ?>
    <script>
        chart1_label[<?php echo $i; ?>]  = '<?php echo $item->sit_nombre; ?>';
        chart1_conteo[<?php echo $i; ?>] = '<?php echo $item->conteo; ?>';
        <?php $i++; ?>
    </script>
<?php } ?>

    <script>
        var chart1_bar = new Chart($("#bar_chart"), {
            type   : 'bar',
            data   : {
                labels  : chart1_label,
                datasets: [
                    {
                        type           : 'bar',
                        label          : 'Montos',
                        data           : chart1_conteo,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                            'rgba(255, 159, 64, 0.5)',
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                            'rgba(255, 159, 64, 0.5)',
                            'rgba(54, 159, 64, 0.5)'
                        ],
                        borderWidth    : 0
                    }
                ]
            },
            options: {
                responsive: true,
                scales    : {yAxes: [{ticks: {beginAtZero: true}}]},
                hover     : {mode: 'label'}
            }
        });
    </script>


<?php
    // print_array($reporte);
?>