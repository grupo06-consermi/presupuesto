<div style='padding: 30px;'>

    <div class="row">
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <h3 class="page-header">Registrar almacen</h3>
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
                  action="<?= site_url(array('almacen', 'store')) ?>" method="post">
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Nombre</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               minlength="7" maxlength="9" pattern="[A-Za-z0-9]{7,9}" title="Solo letras y Numeros"
                               style="text-transform: uppercase;"
                               name="alm_nombre">
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Direccion</span>
                        <input letters="true" required="required" class="form-control" type="text"
                        name="alm_direccion">
                    </div>
                </div>


                <div class="col-xs-12">
                    <div class="form-group">
                        <button class="btn btn-success" type="submit">
                            <i class="fa fa-fw fa-save"></i> Guardar
                        </button>
                        <a href='<?php echo site_url('almacen') ?>' class='btn btn-danger id=' btnCancelar'>Cancelar</a>
                    </div>
                </div>

            </form>
        </div>


    </div>