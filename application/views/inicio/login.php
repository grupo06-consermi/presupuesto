<style>
    .card-signin {
        border        : 0;
        border-radius : 1rem;
        box-shadow    : 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
    }
    .card-signin .card-title {
        margin-bottom : 2rem;
        font-weight   : 300;
        font-size     : 1.5rem;
    }
    .card-signin .card-body {
        padding : 2rem;
    }
    .form-signin {
        width : 100%;
    }
    .form-signin .btn {
        font-size      : 80%;
        border-radius  : 5rem;
        letter-spacing : .1rem;
        font-weight    : bold;
        padding        : 1rem;
        transition     : all 0.2s;
    }
</style>
<body class="hold-transition login-page">
<div class="login-box">
<div class="bg-gradient-light " style='height: 100%;'>
    <div class='container'>
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5">
                <div class='centered' style='margin-top: 20px;'>
                    <h3 style='text-align: center'>Sistema gestión de presupuestos</h3>
                </div>
                <div class="card card-signin my-3">
                    <div class="card-body">
                        <h5 class="card-title text-center">Iniciar sesión</h5>
                        <form class="form-signin" action='<?php echo site_url('inicio/autenticar') ?>' method='post'>
                            <div class="form-label-group">
                                <input type="text" id="txtUsuNombre"  name="txtUsuNombre" class="form-control" placeholder="usuario"
                                       required autofocus>
                                <label for="inputEmail">Usuario</label>
                            </div>
                            <div class="form-label-group">
                                <input type="password" id="txtUsuContrasena" name="txtUsuContrasena" class="form-control" placeholder="contraseña"
                                       required>
                                <label for="inputPassword">Contraseña</label>
                            </div>
                            <input type="submit" class="btn btn-lg btn-primary btn-block text-uppercase" value='Iniciar sesión'>
                            <label><?php echo isset($rpta) ? $rpta : '';  ?></label>
                        </form>
                        <div style='text-align: center; padding-top: 20px;'>
                            <a href="<?php echo site_url('inicio/recuperarContrasena') ?>">Olvide mi contraseña</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>