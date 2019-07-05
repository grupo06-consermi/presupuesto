<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    /**
     * @property  UsuarioModel UsuarioModel
     */
    class Inicio extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            $this->load->view('index/header');
            $this->load->helper('url');
            $this->load->library('email');
            $this->load->model('UsuarioModel');
        }

        public function login() {
            $this->load->view('inicio/login');
        }

        public function autenticar() {

            $usu_nombre     = $this->input->post('txtUsuNombre');
            $usu_contrasena = $this->input->post('txtUsuContrasena');

            $row = $this->UsuarioModel->login($usu_nombre, $usu_contrasena);

            if ($row) {
                $row = $row[0];
                if ($row['usu_estado'] == 1) {
                    
                    $_SESSION['auth.usu_cod']           = $row['usu_cod'];
                    $_SESSION['auth.emp_cod']           = $row['emp_codigo'];
                    $_SESSION['auth.rol_id']            = $row['rol_cod'];
                    $_SESSION['auth.rol_nombre']        = $row['rol_nombre'];
                    $_SESSION['auth.emp_nombre']        = $row['emp_nombre'];
                    $_SESSION['auth.emp_ape_pat']       = $row['emp_ape_pat'];
                    $_SESSION['auth.emp_ape_mat']       = $row['emp_ape_mat'];
                    $_SESSION['auth.usu_ultimo_acceso'] = $row['usu_ultimo_acceso'];

                    $this->load->view('index/menu');
                    $this->load->view('index/bienvenido');

                } else {
                    $this->load->view('inicio/login', ['rpta' => 'Cuenta de usuario deshabilitada']);
                }
            } else {
                $this->load->view('inicio/login', ['rpta' => 'Usuario no válido']);
            }
        }

        public function recuperarContrasena() {
            $this->load->view('inicio/recuperarContrasena');
        }

        public function resetearContrasena() {
            $usu_nombre = $this->input->post('txtUsuNombre');
            $emp_correo = $this->input->post('txtEmpCorreo');

            $row = $this->UsuarioModel->getByNombre($usu_nombre);

            if ($row) {
                $usu_row = $row[0];
                if ($emp_correo == $usu_row['emp_correo']) {
                    $this->enviarMensajeResetearContrasena($usu_row['usu_cod'], $usu_row['emp_correo']);
                } else {
                    $this->load->view('inicio/recuperarContrasena', ['rpta' => "Correo no corresponde al usuario"]);
                }
            } else {
                $this->load->view('inicio/recuperarContrasena', ['rpta' => "Usuario no existe"]);
            }
        }

        function enviarMensajeResetearContrasena($usu_cod, $emp_correo) {
            $nueva_contrasena = $this->generarContrasenaAleatoria();

            if ($this->UsuarioModel->resetearContrasena($usu_cod, $nueva_contrasena)) {
                $titulo    = 'Restablecer contraseña';
                $contenido = "<h2 style='color: #985430;'>Restablecer contraseña</h2>
                         <p>Su nueva contraseña es: <b>$nueva_contrasena</b></p>";
                $this->SendEmail($emp_correo, $titulo, $contenido);
            }
        }

        function generarContrasenaAleatoria() {

            $new_password = '';
            for ($i = 0; $i < 4; $i++) {
                $char1        = chr(rand(65, 90));
                $char2        = chr(rand(97, 122));
                $digit        = rand(0, 9);
                $new_password .= $char1.$char2.$digit;
            }
            return $new_password;
        }

        function SendEmail($email, $titulo, $contenido) {
            date_default_timezone_set('Etc/UTC');

            $this->load->library('phpmailer_lib');
            $mail = $this->phpmailer_lib->load();
            $mail->isSMTP();
            $mail->CharSet = 'UTF-8';

            $mail->Debugoutput = 'html';
            $mail->Host        = 'smtp.live.com';
            $mail->Port        = 587;
            $mail->SMTPSecure  = 'tls';
            $mail->SMTPAuth    = true;

            $mail->Username = "sys_alquiler@outlook.com";
            $mail->Password = "sistemas2019";
            $mail->setFrom($mail->Username);
            $mail->addReplyTo($mail->Username);
            $mail->addAddress($email);

            $mail->Subject = $titulo;
            $mail->msgHTML($contenido);

            if (!$mail->send()) {
                echo "Mailer error: ".$mail->ErrorInfo;
            } else {
                echo "Mensaje enviado";
            }
        }

        
    }
