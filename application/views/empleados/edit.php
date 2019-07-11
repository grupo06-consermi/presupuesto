<div class="row">
    <div class="col-xs-12 col-md-offset-2 col-md-6">
        <h3 class="page-header">Editando Empleado N°<?= $empleado->emp_codigo ?></h3>
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
              action="<?= site_url(array('empleado', 'update', $empleado->emp_codigo)) ?>" method="post">


            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Nombres</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           minlength="3" maxlength="20" required pattern="[A-Za-z\s]+"
                           name="emp_nombre" value="<?= $empleado->emp_nombre ?>">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Apellido Paterno</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           name="emp_ape_pat" value="<?= $empleado->emp_ape_pat ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Apellido Materno</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           name="emp_ape_mat" value="<?= $empleado->emp_ape_mat ?>">
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Direccion</span>
                    <input letters="true" required="required" class="form-control" type="text"
                           name="emp_direccion" value="<?= $empleado->emp_direccion ?>">
                </div>
            </div>

            <div class="col-xs-12">

                <div class="form-group input-group">
                    <span class="input-group-addon">Telefono</span>
                    <input letters="true" required="required" class="form-control" type="number"
                           minlength="9" maxlength="9" pattern="[0-9]"
                           name="emp_telefono" value="<?= $empleado->emp_telefono ?>">

                </div>

            </div>

            <div class="col-xs-12 col-md-3">
                <div class="form-group input-group">
                    <div class="input-group-addon">Fecha de Fin de Trabajo</div>
                    <input name="emp_fecha_fin_trabajo" type="date"
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
                    <select name="tdoc_cod" class="form-control">
                        <option>-- SELECCIONE --</option>
                        <?php foreach ($tdocumentos as $tdocumento): ?>
                            <option <?= $tdocumento->tdoc_cod == $empleado->tdoc_cod ?
                                "selected" : "" ?>
                                    value="<?= $tdocumento->tdoc_cod ?>"><?= $tdocumento->tdoc_nombre ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Numero de Documento</span>
                    <input letters="true" required="required" class="form-control" type="number"
                           minlength="8" maxlength="11" pattern="[0-9]"
                           name="emp_numero_doc" value="<?= $empleado->emp_numero_doc ?>">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Correo</span>
                    <input letters="true" required="required" class="form-control" type="emailaddress"
                           name="emp_correo" value="<?= $empleado->emp_correo ?>">
                </div>
            </div>

            <div class="col-xs-12">
                <div class="form-group input-group">
                    <span class="input-group-addon">Estado</span>
                    <select class="form-control" name="emp_estado">
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

                    <a href='<?php echo site_url('empleado') ?>' class='btn btn-danger' id='btnCancelar'>Cancelar
                        <i class="fa fa-mail-reply"></i>
                    </a>
                </div>
            </div>

        </form>
    </div>
</div>
