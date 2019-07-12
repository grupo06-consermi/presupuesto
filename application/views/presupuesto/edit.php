<script src="<?= base_url(); ?>assets/js/utils.js"></script>
<?php
    /** @var object $prod_list */
    /** @var object $pres_row */
    /** @var object $clientes */
?>
<script>
    var prod_list = [];
    var x         = 0;
    <?php foreach ($prod_list as $item) { ?>
    prod_list[x++] = {
        index   : x,
        codigo  : toInteger('<?php echo $item->prod_cod; ?>'),
        nombre  : '<?php echo $item->prod_nombre_comercial; ?>',
        precio  : toFloat('<?php echo $item->dpre_precio; ?>'),
        cantidad: toFloat('<?php echo $item->dpre_cantidad; ?>'),
        total   : toFloat('<?php echo $item->dpre_cantidad * $item->dpre_precio; ?>')
    };
    <?php } ?>
</script>
<?php /** @var object $empl_list */ ?>
<script>
    var empl_list = [];
    var x         = 0;
    <?php foreach ($empl_list as $item) { ?>
    empl_list[x++] = {
        index     : x,
        emp_codigo: toInteger('<?php echo $item->emp_codigo; ?>'),
        emp_nombre: '<?php echo $item->emp_nombre; ?>',
        pago_dia  : toFloat('<?php echo $item->aemp_pago_dia; ?>'),
        tiempo    : toFloat('<?php echo $item->aemp_cantidad_dias; ?>'),
        importe   : toFloat('<?php echo $item->aemp_total; ?>')
    };
    <?php } ?>
</script>
<section style="padding: 1.5em">
    <div class="callout callout-info">
        <h2>Editar Presupuesto</h2>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">Editar presupuesto</h4>
        </div>
        <div class="panel-body">
            <form id="frm-presupuesto">
                <div class='row'>
                    <div class="col-xs-12 col-lg-4">
                        <div class="form-group">
                            <input type='hidden' id='pres_cod' value='<?= $pres_row->pres_cod; ?>'>
                            <label for="cbo_clientes" class="control-label">Cliente</label>
                            <select required="required" name="cbo_clientes" id="cbo_clientes" class="form-control">
                                <?php foreach ($clientes as $cli) { ?>
                                    <option value='<?= $cli->cli_codigo ?>'
                                        <?php echo $pres_row->cli_codigo == $cli->cli_codigo ? 'selected' : ''; ?>
                                    ><?= $cli->cli_razon_social ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-4">
                        <div class="form-group">
                            <label for="forma_pago" class="control-label">Forma de pago</label>
                            <select required="required" name="forma_pago" id="forma_pago" class="form-control">
                                <option value="<?= PAGO_CONTADO ?>" <?php echo $pres_row->pres_forma_pago == PAGO_CONTADO ? 'selected' : ''; ?>>
                                    Contado
                                </option>
                                <option value="<?= PAGO_CUOTAS ?>" <?php echo $pres_row->pres_forma_pago == PAGO_CUOTAS ? 'selected' : ''; ?> >
                                    Cuotas
                                </option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-8">
                        <div class="form-group">
                            <label for="lugar_trabajo" class="control-label">Lugar Trabajo</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <input name="lugar_trabajo" id="lugar_trabajo" type="text"
                                       value='<?php echo $pres_row->pres_lugar_trabajo; ?>'
                                       class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div hidden class="col-xs-12 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label for="fecha_emision" class="control-label">Fecha Emisión</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input required id="fecha_emision" name="fecha_emision" type="date"
                                       value='<?php echo $pres_row->pres_fecha_emision; ?>'
                                       class="form-control">
                            </div>
                        </div>
                    </div>
                    <div hidden class="col-xs-12 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label for="fecha_recepcion" class="control-label">Fecha Recepción</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input required id="fecha_recepcion" name="fecha_recepcion" type="date"
                                       value='<?php echo $pres_row->pres_fecha_recepcion; ?>'
                                       class="form-control">
                            </div>
                        </div>
                    </div>
                    <div hidden class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label for="estado" class="control-label">Estado</label>
                            <select required="required" name="estado" id="estado" class="form-control">
                                <option value="1" <?php echo $pres_row->pres_forma_pago == '1' ? 'selected' : ''; ?>>
                                    Enviado
                                </option>
                                <option value="2" <?php echo $pres_row->pres_forma_pago == '2' ? 'selected' : ''; ?>>
                                    Aceptado
                                </option>
                                <option value="3" <?php echo $pres_row->pres_forma_pago == '3' ? 'selected' : ''; ?>>Por
                                    cancelar
                                </option>
                                <option value="4" <?php echo $pres_row->pres_forma_pago == '4' ? 'selected' : ''; ?>>
                                    Cancelado
                                </option>
                                <option value="5" <?php echo $pres_row->pres_forma_pago == '5' ? 'selected' : ''; ?>>
                                    Anulado
                                </option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="btn-group" style="margin-bottom: 1.3em;">
                            <div>
                                <span class='font-weight-bold'>Productos</span>
                            </div>
                            <button onclick="Presupuesto.reset_producto()" type="button" data-target="#modal_productos"
                                    data-toggle="modal" class="btn btn-success">
                                <i class="fa fa-plus"></i>
                                <span>Agregar producto</span>
                            </button>
                        </div>
                        <div class="table-responsive">
                            <table id="tbl_productos" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td>Producto</td>
                                    <td>Precio</td>
                                    <td>Cantidad</td>
                                    <td>Importe</td>
                                    <td>Acciones</td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $i = 0; ?>
                                <?php foreach ($prod_list as $item) { ?>
                                    <tr data-index='<?= $i++ ?>'>
                                        <td><?php echo $item->prod_nombre_comercial; ?></td>
                                        <td><?php echo $item->dpre_precio; ?></td>
                                        <td><?php echo $item->dpre_cantidad; ?></td>
                                        <td><?php echo nformat($item->dpre_precio * $item->dpre_cantidad, 2); ?></td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-primary"
                                                    onclick="Presupuesto.edit_producto('<?= $i ?>')"><i
                                                        class="fa fa-edit "></i></button>
                                            <button type="button" class="btn btn-sm btn-danger"
                                                    onclick="Presupuesto.remove_producto('<?= $i ?>')"><i
                                                        class="fa fa-close"></i></button>
                                        <td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="btn-group" style="margin-bottom: 1.3em;">
                            <div>
                                <span class='font-weight-bold'>Mano de obra</span>
                            </div>
                            <button type="button" data-target="#modal_empleados"
                                    data-toggle="modal" class="btn btn-success">
                                <i class="fa fa-plus"></i>
                                <span>Agregar empleado</span>
                            </button>
                        </div>
                        <div class="table-responsive">
                            <table id="tbl_empleados" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td>Empleado</td>
                                    <td>Pago día</td>
                                    <td>Tiempo</td>
                                    <td>Unidad</td>
                                    <td>Importe</td>
                                    <td>Acciones</td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $i = 0; ?>
                                <?php foreach ($empl_list as $item) { ?>
                                    <tr data-index='<?= $i++ ?>'>
                                        <td><?php echo $item->emp_nombre; ?></td>
                                        <td><?php echo $item->aemp_pago_dia; ?></td>
                                        <td><?php echo $item->aemp_cantidad_dias; ?></td>
                                        <td>días</td>
                                        <td><?php echo $item->aemp_total; ?></td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-primary"
                                                    onclick="Presupuesto.edit_empleado('<?= $i ?>')"><i
                                                        class="fa fa-edit"></i></button>
                                            <button type="button" class="btn btn-sm btn-danger"
                                                    onclick="Presupuesto.remove_empleado('<?= $i ?>')"><i
                                                        class="fa fa-edit"></i></button>
                                        <td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label for="costo_mano_obra" class="control-label">Precio mano obra</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-money"></i>
                                </div>
                                <input readonly required='required' name="costo_mano_obra" id="costo_mano_obra"
                                       value='<?php echo $pres_row->pres_costo_mano_obra; ?>'
                                       type="text" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label for="costo_materiales" class="control-label">Costo Materiales</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-money"></i>
                                </div>
                                <input readonly="readonly" name="costo_materiales" id="costo_materiales" type="text"
                                       value='<?php echo $pres_row->pres_costo_materiales; ?>'
                                       class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label for="costo_total" class="control-label">Costo Total</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-money"></i>
                                </div>
                                <input disabled name="costo_total" id="costo_total" type="text"
                                       value='<?php echo $pres_row->pres_costo_total; ?>'
                                       style='font-weight: bold' class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="encargado" class="control-label">Encargado</label>
                            <input name="encargado" id="encargado" type="text"
                                   value='<?php echo $pres_row->pres_encargado; ?>'
                                   class="form-control">
                        </div>
                    </div>
                </div>
                <hr>

            </form>
        </div>
        <div class="panel-footer">
            <button data-callback="Presupuesto.save_presupuesto('<?= site_url('presupuesto/guardar'); ?>')"
                    data-target="#frm-presupuesto" role="submit" class="btn btn-primary pull-right">
                <i class="fa fa-save"></i>
                <span>Guardar</span>
            </button>
            <a href="<?= site_url('presupuesto') ?>" class="btn btn-default">
                <i class="fa fa-arrow-left"></i>
                <span>Atrás</span>
            </a>
        </div>
    </div>
</section>

<!-- productos ------------------------------------------------------------------------------ -->
<div id="modal_productos" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close">&times;</button>
                <h4 class="modal-title">Producto</h4>
            </div>
            <div class="modal-body">
                <form id="frm-modal" action="">
                    <input type="hidden" id="action" name="action" value="new">
                    <input type="hidden" id="id_detalle" name="id_detalle" value="0">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label for="cod_prod" class="control-label">Producto</label>
                                <select data-attr="price" data-target="#precio" required="required" name="cod_prod"
                                        id="cod_prod" class="form-control">
                                    <option value="0">-- SELECCIONE --</option>
                                    <?php /** @var object $products */
                                        foreach ($products as $row): ?>
                                            <option price="<?= $row->prod_precio_venta ?>"
                                                    value="<?= $row->prod_cod ?>"><?= $row->prod_nombre_comercial ?></option>
                                        <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="precio" class="control-label">Precio</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <input id="precio" name="precio" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="cantidad" class="control-label">Cantidad</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-sort-numeric-asc"></i></div>
                                    <input required="required" min="1" id="cantidad" name="cantidad" type="number"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default">Cancelar</button>
                <button data-target="#frm-modal" role="submit" data-callback="Presupuesto.add_producto()"
                        class="btn btn-primary"><i class="fa fa-check"></i><span>Aceptar</span></button>
            </div>
        </div>
    </div>
</div>

<!-- empleados -------------------------------------------------- -->
<div id="modal_empleados" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close">&times;</button>
                <h4 class="modal-title">Empleados</h4>
            </div>
            <div class="modal-body">
                <form id="frm-modal" action="">
                    <input type="hidden" id="action" name="action" value="new">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label for="emp_cod" class="control-label">Empleado</label>
                                <select required="required" name="emp_codigo" id="emp_codigo" class="form-control">
                                    <option value="0">-- SELECCIONE --</option>
                                    <?php /** @var object $empleados */
                                        foreach ($empleados as $row): ?>
                                            <option value="<?= $row->emp_codigo ?>"><?= "$row->emp_nombre $row->emp_ape_pat $row->emp_ape_mat" ?></option>
                                        <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="aemp_pago_dia" class="control-label">Pago día</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <input id="aemp_pago_dia" name="aemp_pago_dia" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="cantidad" class="control-label">Tiempo:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-sort-numeric-asc"></i></div>
                                    <input required="required" min="0" id="aemp_cantidad_dias" name="aemp_cantidad_dias"
                                           type="number" class="form-control">
                                    <span> días</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default">Cancelar</button>
                <button class="btn btn-primary" data-callback="Presupuesto.add_empleado()" data-target="#frm-modal"
                        role="submit"><i class="fa fa-check"></i><span>Aceptar</span></button>
            </div>
        </div>
    </div>
</div>
<script src="<?= base_url(); ?>assets/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<?= base_url(); ?>assets/plugins/jquery-validation/additional-methods.min.js"></script>
<script src="<?= base_url(); ?>assets/plugins/jquery-validation/localization/messages_es_PE.min.js"></script>
<script src="<?= base_url(); ?>assets/js/presupuesto.js"></script>
<script>
    $(document).ready(function () {
        Presupuesto.init();
        Presupuesto.loadProductos(prod_list);

        $('#costo_mano_obra').change(function (e) {
            Presupuesto.calcularTotal();
        });
    });
</script>