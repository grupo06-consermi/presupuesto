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
                <div class="card card-signin my-3">
                    <div class="card-body">
                        <form name='frmlogin' action='<?php echo site_url('inicio/resetearContrasena') ?>' method='post' accept-charset="utf-8">
                            <div class='loginform'>
                                <div>
                                    <div class='txt_center'>
                                        <h3>Recuperar mi contraseña</h3>
                                    </div>
                                    <div style='margin: auto;'>
                                        <table style='margin: auto; width: 100%'>
                                            <tr>
                                                <td><label for='txtUsuNombre'>Usuario:</label></td>
                                                <td><input type='text' name='txtUsuNombre' id='txtUsuNombre'
                                                           maxlength='20' class='form-control' placeholder='Ingrese nombre de usuario'
                                                           value=''/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><label for='txtEmpCorreo'>Correo:</label></td>
                                                <td><input type='text' id='txtEmpCorreo' name='txtEmpCorreo'
                                                           maxlength='50' class='form-control'
                                                           placeholder='Ingrese correo electrónico'/></td>
                                            </tr>
                                            <tr>
                                                <td colspan='2' class='txt_right'>
                                                    <label id='lblMensaje'></label>
                                                </td>
                                            </tr>
                                        </table>
                                        <div style='text-align: center;'>
                                            <input type="submit" class="btn btn-lg btn-primary btn-block text-uppercase" value='Enviar contraseña'>
                                            <label><?php echo isset($rpta) ? $rpta : '';  ?></label>
                                            <div style='text-align: center; padding-top: 20px;'>
                                                <a id="btnIrAPaginaLogin" href='<?php echo site_url('inicio/login') ?>' class="mylink" >Volver</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>