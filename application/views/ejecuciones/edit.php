<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <h3 class="page-header">Editando ejecucion N°<?= $ejecucion->ord_cod ?></h3>
    </div>
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <?php if(isset($result)):?>
            <?php echo html_alert('success', 'Se ha guardao correctamente el registro', 'Guardado', 'check'); ?>
        <?php endif; ?>
    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <form enctype="multipart/form-data" class="form-horizontal" action="<?=site_url(array('ejecucion', 'update', $ejecucion->ord_cod))?>" method="post">
             
            
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon"># Orden</span>
                    <input letters="true" required="required" class="form-control" type="text"
                     name="ord_num_orden" value="<?=$ejecucion->ord_num_orden?>">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Fecha</span>
                    <input letters="true" required="required" class="form-control" type="date"
                     name="ord_fecha" value="<?=$ejecucion->ord_fecha?>">
                </div>
            </div>
            
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon"># O.D.M</span>
                    <input letters="true" required="required" class="form-control" type="number"
                     name="ord_odm" value="<?=$ejecucion->ord_odm?>">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Emisor</span>
                    <input letters="true" required="required" class="form-control" type="text"
                     name="ord_emisor" value="<?=$ejecucion->ord_emisor?>">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Presupuesto</span>
                    <select name="pres_cod" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php foreach($presupuestos as $presupuesto): ?>
                        <option value="<?=$presupuesto->pres_cod?>"><?=$presupuesto->pres_cod?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Estado</span>
                    <select class="form-control" name="ord_estado">
                        <option value="1">Activo</option>
                        <option value="0">Inactivo</option>
                    </select>
                </div>
            </div>

            
            <div class="col-xs-12">
                <div class="form-group">
                    <button class="btn btn-success" type="submit">
                        <i class="fa fa-fw fa-save"></i> Guardar
                    </button>
                    
                    <a href='<?php echo site_url('categoria') ?>' class='btn btn-danger' id='btnCancelar'>Cancelar
                    <i class="fa fa-mail-reply"></i>
                </a>
                </div>
            </div>
            
        </form>
    </div>
</div>
