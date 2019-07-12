<div class="container">

    <nav class="navbar navbar-expand-lg  navbar-inverse ">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Presupuestos</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mantenimiento
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?= site_url(array('producto')) ?>">Productos</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?= site_url(array('cliente')) ?>">Clientes</a></li>
                            <li><a href="<?= site_url(array('empleado')) ?>">Empleados</a></li>
                            <li><a href="<?= site_url(array('proveedor')) ?>">Proveedores</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?= site_url(array('tdocumento')) ?>">Tipo de Documento</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Movimientos
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?= site_url(array('presupuesto')) ?>">Presupuestos</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?= site_url(array('ejecucion')) ?>">Orden de Ejecucion</a></li>
                            <li><a href="<?= site_url(array('conformidad')) ?>">Orden de Conformidad</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?= site_url(array('compra', 'listar')) ?>">Compras</a></li>

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">Reportes <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Presupuestos</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Seguridad
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo site_url('usuario/listar') ?>">Usuarios</a></li>
                            <li><a href="<?php echo site_url('rol/listar') ?>">Roles</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left">
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<?= site_url("Usuario/cerrarSesion") ?>">Desconectar</a></li>
                </ul>
            </div>
        </div>
    </nav>

