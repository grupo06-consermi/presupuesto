<div class="panel panel-default col-xs-12 col-md-offset-2 col-md-6">
    <div class="panel-heading-info">
        <h3 class="page-header">Editando  Proveedor N°<?= $proveedor->prov_cod ?></h3>
    </div>
    
    <div class="panel-body">
        <div class="col-12">
            <form enctype="multipart/form-data" class="form-horizontal" action="<?=site_url(array('proveedor', 'update', $proveedor->prov_cod))?>" method="post">                    
                            <div class="col-xs-12">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">Nombre</span>
                                    <input letters="true" required="required" class="form-control" type="text"
                                    name="prov_razon_social" value="<?=$proveedor->prov_razon_social?>">
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">Ruc</span>
                                    <input letters="true" required="required" class="form-control" type="number"
                                    name="prov_ruc" value="<?=$proveedor->prov_ruc?>">
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">direccion</span>
                                    <input letters="true" required="required" class="form-control" type="text"
                                    name="prov_direccion" value="<?=$proveedor->prov_direccion?>">
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">Telefono</span>
                                    <input letters="true" required="required" class="form-control" type="text"
                                    name="prov_telefono" value="<?=$proveedor->prov_telefono?>">
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">Correo</span>
                                    <input letters="true" required="required" class="form-control" type="text"
                                    name="prov_email" value="<?=$proveedor->prov_email?>">
                                </div>
                            </div>
                            

                    
                    <div class="col-xs-12">
                        <div class="form-group">
                            <button class="btn btn-success" type="submit">
                                <i class="fa fa-fw fa-save"></i> Guardar
                            </button>
                            
                            <a href='<?php echo site_url('proveedor') ?>' class='btn btn-danger' id='btnCancelar'>Cancelar
                            <i class="fa fa-mail-reply"></i>
                            </a>
                        </div>
                    </div>
                    
            </form>
        </div>

</div>
</div>
