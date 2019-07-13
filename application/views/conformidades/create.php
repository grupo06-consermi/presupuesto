<?php /** @var object $pres_row */ ?>
<div style='padding: 30px;'>
    <div class="row">
        <div class="col-xs-12 col-md-offset-2 col-md-6">
            <h3 class="page-header">Registrar Conformidad</h3>
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
                  action="<?= site_url(array('conformidad', 'store')) ?>" method="post">
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Presupuesto Nº</span>
                        <input disabled letters="true" required="required" class="form-control" type="text"
                               value='<?= PadZero($pres_row->pres_cod, 3) ?>'>
                    </div>
                </div>
                <div hidden class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Presupuesto cod</span>
                        <input letters="true" required class="form-control" type="text"
                               value='<?= $pres_row->pres_cod ?>' name="pres_cod">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Cliente</span>
                        <input disabled letters="true" required="required" class="form-control" type="text"
                               value='<?= $pres_row->cli_razon_social; ?>'>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Fecha Inicio</span>
                        <input letters="true" required="required" class="form-control" type="date"
                               name="conf_fecha_inicio">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Fecha Fin</span>
                        <input letters="true" required="required" class="form-control" type="date"
                               name="conf_fecha_fin">
                    </div>
                </div>
                <div hidden class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon">Estado</span>
                        <select class="form-control" name="conf_estado">
                            <option value="1">Activo</option>
                            <option value="0">Inactivo</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group input-group">
                        <span class="input-group-addon"># Acta conformidad</span>
                        <input letters="true" required="required" class="form-control" type="number"
                               name="conf_act_conformidad">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <button class="btn btn-success" type="submit">
                            <i class="fa fa-fw fa-save"></i> Guardar
                        </button>
                        <a href='<?php echo site_url('conformidad') ?>' class='btn btn-danger'
                           id='btnCancelar'>Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>