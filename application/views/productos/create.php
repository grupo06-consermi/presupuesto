<div style='padding: 30px;'>
    <div class="row">
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <h3 class="page-header">Registrar Producto</h3>
        </div>
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <?php if (isset($result)): ?>
                <?php echo html_alert('success', 'Se ha guardado correctamente el registro', 'Guardado', 'check'); ?>
            <?php endif; ?>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <form enctype="multipart/form-data" class="form-horizontal"
                  action="<?= site_url(array('producto', 'store')) ?>" method="post">
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Categoría</span>
                        <select name="cat_codigo" class="form-control">
                            <option>-- SELECCIONE --</option>
                            <?php /** @var object $categorias */
                                foreach ($categorias as $category): ?>
                                    <option value="<?= $category->cat_cod ?>"><?= $category->cat_nombre ?></option>
                                <?php endforeach; ?>
                        </select>
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Nombre:</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               minlength="4" maxlength="50" onkeyup="this.value=NumText(this.value)"  title="Solo letras minimo 7 letras"
                               style="text-transform: uppercase;"
                               name="prod_descripcion">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Proveedor</span>
                        <select name="prov_cod" class="form-control">
                            <option>-- SELECCIONE --</option>
                            <?php /** @var object $proveedor_list */
                                foreach ($proveedor_list as $prov): ?>
                                    <option value="<?= $prov->prov_cod ?>"><?= $prov->prov_razon_social ?></option>
                                <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Marca</span>
                        <select name="mar_codigo" class="form-control">
                            <option>-- SELECCIONE --</option>
                            <?php /** @var object $marcas */
                                foreach ($marcas as $marca): ?>
                                    <option value="<?= $marca->mar_codigo ?>"><?= $marca->mar_nombre ?></option>
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
                                    <option value="<?= $unidad->uni_codigo ?>"><?= $unidad->uni_descripcion ?></option>
                                <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Stock:</span>
                        <input required="required" class="form-control" type="number"
                               min="1" pattern="^[0-9]+"
                               name="prod_stock">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Stock minimo:</span>
                        <input required="required" class="form-control" type="number"
                               min="1" pattern="^[0-9]+"
                               name="prod_stock_min">

                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Precio Venta</span>
                        <input required="required" class="form-control" type="number" min="0"
                               step="0.01" name="prod_precio_venta">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Precio Compra</span>
                        <input required="required" class="form-control" type="number" min="0"
                               step="0.01" name="prod_precio_compra">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Almacen</span>
                        <select required="required" name="alm_codigo" class="form-control">
                            <option>-- SELECCIONE --</option>
                            <?php /** @var object $almacenes */
                                foreach ($almacenes as $almacen): ?>
                                    <option value="<?= $almacen->alm_codigo ?>"><?= $almacen->alm_nombre ?></option>
                                <?php endforeach; ?>
                        </select>
                    </div>
                </div>


                <div class="col-xs-12">
                    <div class="form-group">
                        <button class="btn btn-success" type="submit">
                            <i class="fa fa-fw fa-save"></i> Guardar
                        </button>
                        <a href='<?php echo site_url('producto') ?>' class='btn btn-danger'
                           id='btnCancelar'>Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        function NumText(string){//solo letras y numeros
            var out = '';
            //Se añaden las letras validas
            var filtro = 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ';//Caracteres validos

            for (var i=0; i<string.length; i++)
                if (filtro.indexOf(string.charAt(i)) != -1)
                    out += string.charAt(i);
            return out;
        }
    </script>