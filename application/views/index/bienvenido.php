
<div class="container">
        <div class="card-group">
            <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="ti-user"></i>
                    </div>

                    <div class="h4 mb-0">
                        <span class="count">
                            
                           <!-- <?php echo $cliente_total->cantidad; ?> -->

                        </span>
                    </div>

                    <small class="text-muted text-uppercase font-weight-bold">Clientes Registrados</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="ti-timer"></i>
                    </div>
                    <div class="h4 mb-0">
                        <span class="count">5</span>
                    </div>
                    <small class="text-muted text-uppercase font-weight-bold">Pedidos en curso</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-cart-plus"></i>
                    </div>
                    <div class="h4 mb-0">
                        <span class="count">3</span>
                    </div>
                    <small class="text-muted text-uppercase font-weight-bold">Ventas realizadas</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-pie-chart"></i>
                    </div>
                    <div class="h4 mb-0">
                        <span class="count">28</span>%
                    </div>
                    <small class="text-muted text-uppercase font-weight-bold">Returning Visitors</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-clock-o"></i>
                    </div>
                    <div class="h4 mb-0">5:34:11</div>
                    <small class="text-muted text-uppercase font-weight-bold">Avg. Time</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            
        </div>
    </div>
<div class="col-md-4">
	<div class="card">
        <div class="card-header">
            <i class="fa fa-user"></i>
            <strong class="card-title pl-2">Bienvenido</strong>
        </div>
        <div class="card-body">
            <form action="#" method="POST">
                <input type="hidden" name="codigo" value=" <?php
                    echo "Bienvenido : ".$_SESSION['auth.emp_nombre'].' '.$_SESSION['auth.emp_ape_pat'].' 
                    '.$_SESSION['auth.emp_ape_mat']; ?>">
                <div class="mx-auto d-block">
                    <img class="rounded-circle mx-auto d-block" 
                     src="<?= base_url()?>template/images/user.png" alt="Card image cap">
                    <h5 class="text-sm-center mt-2 mb-1">
                    <?php
                    echo "Bienvenido : ".$_SESSION['auth.emp_nombre']; ?>
                    </h5>
                    <div class="location text-sm-center">
                        <i class="fa fa-user"></i>
                        <?php
                    echo " ".$_SESSION['auth.emp_ape_pat'].' 
                    '.$_SESSION['auth.emp_ape_mat']; ?>
                    </div>
                </div>
                <hr>
                <div class="card-text text-sm-center">
                    <button class="btn btn-dark" type="submit">
                        Salir&nbsp;
                        <i class="ti-reload"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


     
         

