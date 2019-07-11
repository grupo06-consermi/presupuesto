<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <h3 class="page-header">Editar cliente N°<?= /** @var object $cliente */
                $cliente->cli_codigo ?></h3>
    </div>
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <?php if(isset($result)):?>
            <?php echo html_alert('success', 'Se ha guardao correctamente el registro', 'Guardado', 'check'); ?>
        <?php endif; ?>
    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <form enctype="multipart/form-data" class="form-horizontal" action="<?=site_url(array('cliente', 'update', $cliente->cli_codigo))?>" method="post">
             
            
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Razon Social</span>
                    <input letters="true" required="required" class="form-control" type="text" 
                     name="cli_razon_social" value="<?=$cliente->cli_razon_social?>">
                </div>
            </div>
            
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Ruc</span>
                    <input letters="true" required="required" class="form-control" type="text" 
                     name="cli_ruc" value="<?=$cliente->cli_ruc?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Direccion</span>
                    <input letters="true" required="required" class="form-control" type="text" 
                     name="cli_direccion" value="<?=$cliente->cli_direccion?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Telefono</span>
                    <input letters="true" required="required" class="form-control" type="text" 
                     name="cli_telefono" value="<?=$cliente->cli_telefono?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Correo Electronico</span>
                    <input letters="true" required="required" class="form-control" type="text" 
                     name="cli_email" value="<?=$cliente->cli_email?>">
                </div>
            </div>
            

            <div class="col-xs-12">
                <div class="form-group">
                    <button class="btn btn-success" type="submit">
                        <i class="fa fa-fw fa-save"></i> Guardar
                    </button>
                    
                    <a href='<?php echo site_url('cliente') ?>' class='btn btn-danger' id='btnCancelar'>Cancelar
                    <i class="fa fa-mail-reply"></i>
                </a>
                </div>
            </div>
            
        </form>
    </div>
</div>
