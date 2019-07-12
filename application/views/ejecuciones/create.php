<?php
    /** @var object $presupuestos */
    $pres_id = IssetOr($pres_id, 0);
    $page    = IssetOr($page, 'ejecucion');
?>
<div style='padding: 30px;'>

    <div class="row">
        <div class="col-xs-12 col-md-offset-0 col-md-12">
            <h3 class="page-header">Registrar Orden de Ejecucion</h3>
        </div>
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <?php if (isset($result)): ?>
                <?php echo html_alert('success', 'Se ha guardado correctamente el registro', 'Guardado', 'check'); ?>
            <?php endif; ?>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-offset-0 col-md-12">
            <form enctype="multipart/form-data" class="form-horizontal"
                  action="<?= site_url(array('ejecucion', 'store')) ?>" method="post">
                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Presupuesto Nº</span>
                        <input <?= $pres_id > 0 ? 'disabled' : ''; ?>
                                letters="true" required="required" class="form-control" type="text"
                                value='<?= PadZero($pres_id, 3) ?>'>
                    </div>
                </div>
                <div hidden class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Presupuesto cod</span>
                        <input letters="true" required class="form-control" type="text"
                               value='<?= $pres_id ?>' name="pres_cod">
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Cliente</span>
                        <input disabled letters="true" required="required" class="form-control" type="text"
                               value='<?= /** @var object $pres_row */
                                   $pres_row->cli_razon_social; ?>'>
                    </div>
                </div>

                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon"># Orden</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               name="ord_num_orden">
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Fecha</span>
                        <input letters="true" class="form-control" type="date"
                               name="ord_fecha">
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon"># O.D.M</span>
                        <input letters="true" required="required" class="form-control" type="number"
                               name="ord_odm">
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Emisor</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               name="ord_emisor">
                    </div>
                </div>
                <div class="col-xs-6">
                    <div hidden class="form-group input-group">
                        <span class="input-group-addon">Estado</span>
                        <select class="form-control" name="ord_estado">
                            <option value="1" selected>Activo</option>
                            <option value="0">Inactivo</option>
                        </select>
                    </div>
                </div>
                <?php if (isset($presdet_list)) { ?>
                    <div class="col-sm-12">
                        <table class='table'>
                            <thead>
                            <tr>
                                <th>Cód</th>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Stock</th>
                                <th>Pedir</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($presdet_list as $presdet) { ?>
                                <tr>
                                    <td><?= $presdet->prod_cod; ?></td>
                                    <td><?= $presdet->prod_nombre_comercial; ?></td>
                                    <td style='text-align: right;'><?= $presdet->dpre_precio; ?></td>
                                    <td style='text-align: right;'><?= $presdet->dpre_cantidad; ?></td>
                                    <td style='text-align: right;'><?= $presdet->prod_stock; ?></td>
                                    <td style='text-align: right;'><?= ($presdet->dpre_cantidad > $presdet->prod_stock) ? ($presdet->dpre_cantidad - $presdet->prod_stock) : 0; ?></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-xs-12" style='margin-bottom: 15px;'>
                        Estos productos se utilizarán para realizar esta orden de ejecucion.
                    </div>
                <?php } ?>
                <div class="col-xs-12">
                    <div class="form-group">
                        <button class="btn btn-success" type="submit">
                            <i class="fa fa-fw fa-save"></i> Guardar
                        </button>
                        <a href='<?php echo site_url($page) ?>' class='btn btn-danger' id='btnCancelar'>Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>