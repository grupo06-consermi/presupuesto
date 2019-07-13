<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <h3 class="page-header">Editando Producto N°<?= /** @var object $producto */
                $producto->prod_cod ?></h3>
    </div>
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <?php if (isset($result)): ?>
            <?php echo html_alert('success', 'Se ha guardao correctamente el registro', 'Guardado', 'check'); ?>
        <?php endif; ?>
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <form enctype="multipart/form-data" class="form-horizontal"
              action="<?= site_url(array('producto', 'update', $producto->prod_cod)) ?>" method="post">

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Categoría</span>
                    <select name="cat_codigo" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php /** @var object $categorias */
                            foreach ($categorias as $category): ?>
                            <option <?= $category->cat_cod == $producto->cat_cod ? "selected" : "" ?>
                                    value="<?= $category->cat_cod ?>"><?= $category->cat_nombre ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Nombre</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           name="prod_descripcion" value="<?= $producto->prod_nombre_comercial ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Proveedor</span>
                    <select name="prov_cod" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php /** @var object $proveedor_list */
                            foreach ($proveedor_list as $prov): ?>
                                <option value="<?= $prov->prov_cod ?>" <?= $prov->prov_cod == $producto->prov_cod ? "selected" : "" ?> >
                                    <?= $prov->prov_razon_social ?></option>
                            <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Marca</span>
                    <select name="mar_codigo" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php foreach ($marcas as $marca): ?>
                            <option <?= $marca->mar_codigo == $producto->mar_codigo ? "selected" : "" ?>
                                    value="<?= $marca->mar_codigo ?>"><?= $marca->mar_nombre ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Unidad</span>
                    <select required="required" name="uni_codigo" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php /** @var object $unidades */
                            foreach ($unidades as $unidad): ?>
                                <option <?= $unidad->uni_codigo == $producto->uni_codigo ? "selected" : "" ?>
                                        value="<?= $unidad->uni_codigo ?>"><?= $unidad->uni_descripcion ?></option>
                            <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Stock</span>
                    <input required="required" class="form-control" type="number"
                           min="1" pattern="^[0-9]+"
                           name="prod_stock"
                           value="<?= $producto->prod_stock ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Stock minimo:</span>
                    <input required="required" class="form-control" type="number"
                           min="1" pattern="^[0-9]+"
                           name="prod_stock_min"
                           value="<?= $producto->prod_stock_min ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Precio Venta</span>
                    <input required="required" class="form-control" type="number"
                           min="1" pattern="^[0-9]+" step="0.01"
                           name="prod_precio_venta"
                           value="<?= $producto->prod_precio_venta ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Precio Compra</span>
                    <input required="required" class="form-control" type="number"
                           min="1" pattern="^[0-9]+" step="0.01"
                           name="prod_precio_compra"
                           value="<?= $producto->prod_precio_compra ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Almacen</span>
                    <select required="required" name="alm_codigo" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php /** @var object $almacenes */
                            foreach ($almacenes as $almacen): ?>
                                <option <?= $almacen->alm_codigo == $producto->alm_codigo ? "selected" : "" ?>
                                        value="<?= $almacen->alm_codigo ?>"><?= $almacen->alm_nombre ?></option>
                            <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <button class="btn btn-success" type="submit">
                        <i class="fa fa-fw fa-save"></i> Guardar
                    </button>
                    <a href='<?php echo site_url('producto') ?>' class='btn btn-danger' id=' btnCancelar'>Cancelar</a>
                </div>
            </div>
        </form>
    </div>
</div>
