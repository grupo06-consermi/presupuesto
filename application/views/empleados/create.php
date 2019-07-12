
<div  style='padding: 30px;'>

<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <h3 class="page-header">Registrar Nuevo Empleado</h3>
    </div>
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <?php if(isset($result)):?>
            <?php echo html_alert('success', 'Se ha guardado correctamente el registro', 'Guardado', 'check'); ?>
        <?php endif; ?>
    </div>
</div>


<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-5">
        <form enctype="multipart/form-data" class="form-horizontal" action="<?=site_url(array('empleado', 'store'))?>" method="post">
                        
            
            
             <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Nombres</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           minlength="3" maxlength="30" pattern="[A-Za]{7,20}" title="Solo letras"
                           style="text-transform: uppercase;"
                     name="emp_nombre">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Apellido Paterno</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           minlength="3" maxlength="50" pattern="[A-Za]{7,20}" title="Solo letras"
                           style="text-transform: uppercase;"
                     name="emp_ape_pat">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Apellido Materno</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           minlength="3" maxlength="50" pattern="[A-Za]{7,20}" title="Solo letras"
                           style="text-transform: uppercase;"
                     name="emp_ape_mat">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Direccion</span>
                    <input letters="true" required="required" class="form-control" type="text"
                    minlength="7" maxlength="20" pattern="[A-Za-z0-9]{7,20}" title="Solo letras y Numeros"
                     style="text-transform: uppercase;"
                     name="emp_direccion">
                </div>
            </div>

            <div class="col-xs-12">
            
                <div class="form-group input-group">
                    <span class="input-group-addon">Telefono</span>
                    <input letters="true" required="required" class="form-control" type="number"
                    minlength="9" maxlength="9" pattern="[0-9]"
                     name="emp_telefono"
                     >
                     
                </div>
                
            </div>

            

            <div class="col-xs-12 col-md-3">
                <div class="form-group input-group">
                    <div class="input-group-addon">Fecha de Inicio de Trabajo</div>
                    <input required="required" name="emp_fecha_inicio_trabajo" type="date"

                    min="2019-06-26" max="2020-06-26"

                    class="form-control" autocomplete="off">
                    
                </div>
	        </div>



            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Sexo</span>
                    <select class="form-control" name="emp_sexo">
                        <option value="1">Masculino</option>
                        <option value="0">Femenino</option>
                    </select>
                </div>
            </div>


            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Tipo de Documento</span>
                    <select required="required" name="tdoc_cod" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php foreach($tdocumentos as $tdocumento): ?>
                        <option value="<?=$tdocumento->tdoc_cod?>"><?=$tdocumento->tdoc_nombre?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Numero de Documento</span>
                    <input letters="true" required="required" class="form-control" type="number"
                    minlength="8" maxlength="11" pattern="[0-9]"
                     name="emp_numero_doc">
                </div>
            </div>
    
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Correo</span>
                    <input letters="true" required="required" class="form-control" type="emailaddress"
                     name="emp_correo">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group">
                    <button class="btn btn-success" type="submit">
                        <i class="fa fa-fw fa-save"></i> Guardar
                    </button>
                    <a href='<?php echo site_url('empleado') ?>' class='btn btn-danger id='btnCancelar'>Cancelar</a>
                </div>
            </div>
            
        </form>
    </div>

    

</div>