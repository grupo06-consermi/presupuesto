
<div  style='padding: 0em;'>
    <div class="callout callout-info">
        <h2>Lista de Empleados</h2>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <?php if ($this->session->flashdata('correcto')): ?>
            <div class="alert alert-success alert-dismissible fade in" role="alert">
                <strong>Correcto : </strong>&nbsp;<?php echo $this->session->flashdata('correcto'); ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <?php endif ?>

            <?php if ($this->session->flashdata('error')): ?>
            <div class="alert alert-danger alert-dismissible fade in" role="alert">
            <strong>Error : </strong>&nbsp;<?php echo $this->session->flashdata('error'); ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <?php endif ?>
        </div>
        
        <div class="col-xs-12">
            <a class="btn btn-success" href="<?= site_url(['empleado', 'create']) ?>" style="margin-bottom: 1.3em;">
                <i class="fa fa-fw fa-plus"></i> Agregar
            </a>
        </div>

        <div class="col-xs-12">
            <table  class="table table-striped table-bordered">
                <thead>
                    <!--<th>Código</th>-->
                    <th>Nombres</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    <th>Telefono</th>                    
                    <th>Fecha Inicio de Trabajo</th>
                    <th>Sexo</th>
                    <th>Estado</th>

                    <th>Acciones</th>
                </thead>
                <tbody>
                    <?php foreach($rows as $row): ?>
                        <tr>
                            <td><?=$row->emp_nombre?></td>
                            <td><?=$row->emp_ape_pat?></td>
                            <td><?=$row->emp_ape_mat?></td>
                            <td><?=$row->emp_telefono?></td>
                            <td><?=$row->emp_fecha_inicio_trabajo?></td>
                            <td> <?=$row->emp_sexo == '1' ? '<i class="fa fa-fw fa-female fa-2x"></i> ' : 
                            '<i class="fa fa-fw fa-male fa-2x"></i>'?></td>

                            <td> <?=$row->emp_estado == '1' ? '<i class="fa fa-fw fa-smile-o fa-2x "></i>' : 
                            '<i class="fa fa-fw fa-frown-o fa-2x"></i>'?></td>
                                                    
                            
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a title="Editar" class="btn btn-primary" href="<?= site_url('empleado/edit/'.$row->emp_codigo) ?>">
                                        <i class="fa fa-fw fa-pencil"></i>
                                    </a>
                                    <a title="Eliminar" class="btn btn-danger" href="<?= site_url('empleado/destroy/'.$row->emp_codigo) ?>">
                                        <i class="fa fa-fw fa-remove"></i>
                                    </a>
                                    
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
         
            </table>
            
        </div>

    </div>
    
</div>


