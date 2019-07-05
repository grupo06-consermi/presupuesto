<?php

    /**
     * @property  actividad_model actividad_model
     */
    class Actividad extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->model('actividad_model');
            $this->load->view('index/header');
            $this->load->view('index/menu');
        }

        public function Listar() {
            $data['rol_list'] = $this->actividad_model->listar();
            $this->load->view('rol/listar', $data);
        }

        public function Borrar($rol_cod) {
            $this->actividad_model->borrar($rol_cod);
            $data['actividad_list'] = $this->actividad_model->listar();
            $this->load->view('actividad/listar', $data);
        }
    }