
<div  style='padding: 1.5em;'>
    <div class="callout callout-info">
        <h2>Lista de Marcas</h2>
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
            <a class="btn btn-success" href="<?= site_url(['marca', 'create']) ?>" style="margin-bottom: 1.3em;">
                <i class="fa fa-fw fa-plus"></i> Agregar
            </a>
            <a href='<?php echo site_url('producto') ?>' style="margin-bottom: 1.3em;" class='btn btn-danger' id='btnCancelar'>Regresar
                <i class="fa fa-mail-reply"></i>
            </a>
        </div>

        <div class="col-xs-12">
            <table  class="table table-striped table-bordered">
                <thead>
                    <!--<th>Código</th>-->
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </thead>
                <tbody>
                    <?php foreach($rows as $row): ?>
                        <tr>
                            <td><?=$row->mar_nombre?></td>                            
                            <td> <?=$row->mar_estado == '1' ? '<i class="fa fa-fw fa-check"></i>' : 
                            '<i class="fa fa-fw fa-remove"></i>'?></td>
                            
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a title="Editar" class="btn btn-primary" href="<?= site_url('marca/edit/'.$row->mar_codigo) ?>">
                                        <i class="fa fa-fw fa-pencil"></i>
                                    </a>
                                    <a title="Eliminar" class="btn btn-danger" href="<?= site_url('marca/destroy/'.$row->mar_codigo) ?>">
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


