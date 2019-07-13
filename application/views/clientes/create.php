<div style='padding: 30px;'>

    <div class="row">
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <h3 class="page-header">Registrar Nuevo Cliente</h3>
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
                  action="<?= site_url(array('cliente', 'store')) ?>" method="post">
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Razon Social</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               name="cli_razon_social">
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">R.U.C</span>
                        <input letters="true" required="required" class="form-control" type="number"
                               min="7" max="11" pattern="[z0-9]{7,9}"
                               name="cli_ruc">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Direccion</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               name="cli_direccion">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Telefono</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               name="cli_telefono">
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">E-Mail</span>
                        <input letters="true" required="required" class="form-control" type="text"
                               name="cli_email">
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="form-group">
                        <button class="btn btn-success" type="submit">
                            <i class="fa fa-fw fa-save"></i> Guardar
                        </button>
                        <a href='<?php echo site_url('cliente') ?>' class='btn btn-danger id=' btnCancelar'>Cancelar</a>
                    </div>
                </div>

            </form>
        </div>


    </div>