<?php

    /**
     * @property  RolModel RolModel
     * @property  EmpleadoModel EmpleadoModel
     * @property  UsuarioModel UsuarioModel
     */
    class usuario extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->model('UsuarioModel');
            $this->load->model('RolModel');
            $this->load->model('EmpleadoModel');
            $this->load->view('index/header');
            $this->load->view('index/menu');
        }

        public function Registrar($usu_cod = 0) {
            $rol_list = $this->RolModel->listar();
            $emp_list = $this->EmpleadoModel->listarCbo();

            if ($usu_cod == 0) {
                if ($this->input->post('btnRegistrar')) {

                    $this->UsuarioModel->usu_cod       = 0;
                    $this->UsuarioModel->usu_nombre    = $this->input->post('txtRolNombre');
                    $this->UsuarioModel->emp_codigo    = $this->input->post('txtUsuEmpCodigo');
                    $this->UsuarioModel->usu_nombre    = $this->input->post('txtUsuNombre');
                    $this->UsuarioModel->usu_clave     = $this->input->post('txtUsuClave');
                    $this->UsuarioModel->rol_cod       = $this->input->post('txtUsuRolCod');
                    $this->UsuarioModel->usu_situacion = 1;

                    if ($this->UsuarioModel->insertar()) {
                        $this->load->view('usuario/registrar', ['rpta' => 'registro correcto', 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                    } else {
                        $this->load->view('usuario/registrar', ['rpta' => 'error al registrar', 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                    }
                } else {
                    $this->load->view('usuario/registrar', ['rol_list' => $rol_list, 'emp_list' => $emp_list]);
                }
            } else {
                if ($this->input->post('btnRegistrar')) {

                    $this->UsuarioModel->usu_cod = $this->input->post('txtUsuUsuarioCod');;
                    $this->UsuarioModel->usu_nombre    = $this->input->post('txtRolNombre');
                    $this->UsuarioModel->emp_codigo    = $this->input->post('txtUsuEmpCodigo');
                    $this->UsuarioModel->usu_nombre    = $this->input->post('txtUsuNombre');
                    $this->UsuarioModel->rol_cod       = $this->input->post('txtUsuRolCod');
                    $this->UsuarioModel->usu_situacion = 1;

                    if ($this->UsuarioModel->update()) {
                        $this->load->view('usuario/registrar', ['rpta' => 'actualizacion correcta', 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                    } else {
                        $this->load->view('usuario/registrar', ['rpta' => 'error al actualizar', 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                    }
                } else {
                    $usu_row = $this->UsuarioModel->getByID($usu_cod);
                    $this->load->view('usuario/registrar', ['usu_row' => $usu_row[0], 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                }
            }
        }

        public function Listar() {
            $data['usu_list'] = $this->UsuarioModel->listar();
            $this->load->view('usuario/listar', $data);
        }

        public function Borrar($rol_cod) {
            $this->UsuarioModel->borrar($rol_cod);
            $data['usu_list'] = $this->UsuarioModel->listar();
            $this->load->view('usuario/listar', $data);
        }

        public function Activar($rol_cod) {
            $this->UsuarioModel->activar($rol_cod);
            $data['usu_list'] = $this->UsuarioModel->listar();
            $this->load->view('usuario/listar', $data);
        }

        public function resetpsw($usu_cod) {
            $rol_list = $this->RolModel->listar();
            $emp_list = $this->EmpleadoModel->listarCbo();

            $usu_clave = $this->input->post('txtUsuClave');

            if ($this->input->post('btnRegistrar')) {

                $usu_row = $this->UsuarioModel->getByID($usu_cod);
                if ($this->UsuarioModel->resetpsw($usu_cod, $usu_clave)) {
                    $this->load->view('usuario/resetpsw', ['rpta' => 'actualizacion correcta', 'usu_row' => $usu_row[0], 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                } else {
                    $this->load->view('usuario/resetpsw', ['rpta' => 'error al actualizar', 'usu_row' => $usu_row[0], 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
                }
            } else {
                $usu_row = $this->UsuarioModel->getByID($usu_cod);
                $this->load->view('usuario/resetpsw', ['usu_row' => $usu_row[0], 'rol_list' => $rol_list, 'emp_list' => $emp_list]);
            }
        }

        public function cerrarSesion() {
            unset ($_SESSION['auth.usu_cod']);
            unset ($_SESSION['auth.emp_cod']);
            unset ($_SESSION['auth.rol_id']);
            unset ($_SESSION['auth.rol_nombre']);
            unset ($_SESSION['auth.emp_nombre']);
            unset ($_SESSION['auth.emp_ape_pat']);
            unset ($_SESSION['auth.emp_ape_mat']);
            unset ($_SESSION['auth.usu_ultimo_acceso']);
            redirect('inicio/login');
        }
    }