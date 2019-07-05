<?php

    class Rol extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->model('RolModel');
            $this->load->view('index/header');
            $this->load->view('index/menu');


        }

        public function Registrar($rol_cod) {
            if ($rol_cod == 0) {
                if ($this->input->post('btnRegistrar')) {
                    $this->RolModel->rol_cod    = 0;
                    $this->RolModel->rol_nombre = $this->input->post('txtRolNombre');
                    if ($this->RolModel->insertar()) {
                        $this->load->view('rol/registrar', ['rpta' => 'registro correcto']);
                    } else {
                        $this->load->view('rol/registrar', ['rpta' => 'error al registrar']);
                    }
                } else {
                    $this->load->view('rol/registrar');
                }
            } else {
                if ($this->input->post('btnRegistrar')) {
                    $this->RolModel->rol_cod = $this->input->post('txtRolCod');;
                    $this->RolModel->rol_nombre = $this->input->post('txtRolNombre');
                    if ($this->RolModel->update()) {
                        $this->load->view('rol/registrar', ['rpta' => 'actualizacion correcta']);
                    } else {
                        $this->load->view('rol/registrar', ['rpta' => 'error al actualizar']);
                    }
                } else {
                    $rol_row = $this->RolModel->getByID($rol_cod);
                    $this->load->view('rol/registrar', ['rol_row' => $rol_row[0]]);
                }
            }
        }

        public function Listar() {
            $data['rol_list'] = $this->RolModel->listar();
            $this->load->view('rol/listar', $data);
        }

        public function Borrar($rol_cod) {
            $this->RolModel->borrar($rol_cod);
            $data['rol_list'] = $this->RolModel->listar();
            $this->load->view('rol/listar', $data);
        }

    }