
<div class="container">
    <div class="callout callout-info">
        <h2>Lista de Proveedores</h2>
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
            <a class="btn btn-success" href="<?= site_url(['proveedor', 'create']) ?>" style="margin-bottom: 1.3em;">
                <i class="fa fa-fw fa-plus"></i> Agregar
            </a>
        </div>

        <div class="col-xs-12">
            <table  class="table table-striped table-bordered">
                <thead>
                    <!--<th>Código</th>-->
                    <th>Nombre</th>
                    <th>Ruc</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Acciones</th>
                </thead>
                <tbody>
                    <?php foreach($rows as $row): ?>
                        <tr>
                            <td><?=$row->prov_razon_social?></td>                            
                            <td><?=$row->prov_ruc?></td> 
                            <td><?=$row->prov_direccion?></td> 
                            <td><?=$row->prov_telefono?></td>                            
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a title="Editar" class="btn btn-primary" 
                                    href="<?= site_url('proveedor/edit/'.$row->prov_cod) ?>">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a title="Eliminar" class="btn btn-danger" 
                                    href="<?= site_url('proveedor/destroy/'.$row->prov_cod) ?>">
                                        <i class="fa fa-trash"></i>
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


