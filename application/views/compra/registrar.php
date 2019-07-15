<?php /** @var object $prov_list */ ?>
<script src="<?= base_url(); ?>assets/js/utils.js"></script>
<section style="padding: 1.5em">
    <div class="callout callout-info">
        <h2>Nueva compra</h2>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">Información de la compra</h4>
        </div>
        <div class="panel-body">
            <form id="frm-compra">
                <div class='row'>
                    <div class="col-xs-6 col-lg-6">
                        <div class="form-group">
                            <label for="prov_cod" class="control-label">Proveedor</label>
                            <select required="required" name="prov_cod" id="prov_cod" class="form-control">
                                <?php
                                    foreach ($prov_list as $cli) { ?>
                                        <option value='<?= $cli->prov_cod ?>'><?= $cli->prov_razon_social ?></option>
                                    <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-4 col-lg-4">
                        <div class="form-group">
                            <label for="comp_fecha" class="control-label">Fecha</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input required id="comp_fecha" name="comp_fecha" type="date" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="btn-group" style="margin-bottom: 1.3em;">
                            <div>
                                <span class='font-weight-bold'>Productos</span>
                            </div>
                            <button onclick="Compra.reset_producto()" type="button" data-target="#modal_productos"
                                    data-toggle="modal" class="btn btn-success">
                                <i class="fa fa-plus"></i>
                                <span>Agregar producto</span>
                            </button>
                            <button onclick="Compra.load_from_presupuesto('<?= site_url('compra/getProductosFaltantes'); ?>')"
                                    type="button" class="btn btn-warning"><i class="fa fa-plus"></i>
                                <span>Cargar desde presupuestos</span>
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

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label for="comp_costo_total" class="control-label">Monto</label>
                            <div class="input-group align-right">
                                <div class="input-group-addon">
                                    <i class="fa fa-money"></i>
                                </div>
                                <input disabled name="comp_costo_total" id="comp_costo_total" type="text"
                                       style='font-weight: bold' class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
            </form>
        </div>
        <div class="panel-footer">
            <button data-callback="Compra.save_compra('<?= site_url('compra/registrar'); ?>')"
                    data-target="#frm-compra" role="submit" class="btn btn-primary pull-right">
                <i class="fa fa-save"></i>
                <span>Guardar</span>
            </button>
            <a href="<?= site_url('compra/listar') ?>" class="btn btn-default">
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
                                    <?php /** @var object $prod_list */
                                        foreach ($prod_list as $row): ?>
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
                <button data-target="#frm-modal" role="submit" data-callback="Compra.add_producto()"
                        class="btn btn-primary"><i class="fa fa-check"></i><span>Aceptar</span></button>
            </div>
        </div>
    </div>
</div>
<script src="<?= base_url(); ?>assets/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<?= base_url(); ?>assets/plugins/jquery-validation/additional-methods.min.js"></script>
<script src="<?= base_url(); ?>assets/plugins/jquery-validation/localization/messages_es_PE.min.js"></script>
<script src="<?= base_url(); ?>assets/js/compra.js"></script>
<script>
    $(document).ready(function () {
        Compra.init();
    });
</script>
