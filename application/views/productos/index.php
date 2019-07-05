
<div class="container">
    <div class="callout callout-info">
        <h2>Lista de Productos</h2>
    </div>
            <div class="row">
            <div class="col-sm-3">
                <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Almacen</h3>
                    <p class="card-text">Agrear/Editar/Eliminar</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Categorias</h3>
                    <p class="card-text">Agrear/Editar/Eliminar</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Marcas</h3>
                    <p class="card-text">Agrear/Editar/Eliminar</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Unidad de Medidas </h3>
                    <p class="card-text">Agregar/Editar/Eliminar</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
                </div>
            </div>
           
            </div>

    <div class="card" style="margin-bottom: 1.3em; margin-top: 1.0em; >        

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
            <a class="btn btn-success" href="<?= site_url(['producto', 'create']) ?>" style="margin-bottom: 1.3em; margin-top: 1.0em;  ">
                <i class="fa fa-fw fa-plus"></i> Agregar
            </a>
        </div>

        <div class="col-xs-12">
            <table  class="table table-striped table-bordered">
                <thead>
                    <!--<th>Código</th>-->
                    <th>Nombre Comercial</th>
                    <th>Precio Compra</th>   
                    <th>Precio Venta</th> 
                    <th>Cantidad</th> 
                     
                    <th>Categoria</th>
                    <th>Unidad de Medida</th>
                    <th>Almacen</th>
                    <th>Acciones</th>
                </thead>
                <tbody>
                    <?php foreach($rows as $row): ?>
                        <tr>
                            <td><?=$row->prod_nombre_comercial?></td>
                            <td><?=$row->prod_precio_compra?></td>
                            <td><?=$row->prod_precio_venta?></td>
                            <td><?=$row->prod_cant?></td>
                            <td><?=$row->cat_nombre?></td>
                            <td><?=$row->uni_descripcion?></td>
                            <td><?=$row->alm_nombre?></td>
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a title="Editar" class="btn btn-primary" href="<?= site_url('producto/edit/'.$row->prod_cod) ?>">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a title="Eliminar" class="btn btn-danger" href="<?= site_url('producto/destroy/'.$row->prod_cod) ?>"">
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


<script>
$(document).ready(function() {
    $('.table').DataTable({
        language: {
            url: '//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json'
        },
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
    });
});
</script>