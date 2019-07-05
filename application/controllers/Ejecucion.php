<?php

    class Ejecucion extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
        }

        public function index() {
            $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q');
            $this->load->model('ejecucion_model');
            $rows = $this->ejecucion_model->fetch_all_state($buscar);
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('ejecuciones/index', compact('rows'));
        }

        public function create() {
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('almacenes/create');

        }

        public function edit($id) {
            $this->load->model('almacen_model');
            $almacen = $this->almacen_model->getId($id);
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('almacenes/edit', compact('almacen'));

        }

        public function update($id) {
            $this->load->model('almacen_model');
            $result = $this->almacen_model->update($id);
            if ($result) {
                $result = array('title' => 'Actualizado', 'message' => 'Se ha actualizado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido Actualizar el registro.', 'type' => 'error');
            }
            $rows = $this->almacen_model->fetch_all_state();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('almacenes/index', compact('rows', 'result'));

        }

        public function store() {
            $this->load->model('almacen_model');
            $result = $this->almacen_model->insert();
            if ($result) {
                $result = array('title' => 'Guardado', 'message' => 'Se ha guardao correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido guardar el registro.', 'type' => 'error');
            }
            $rows = $this->almacen_model->fetch_all_state();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('almacenes/index', compact('rows', 'result'));

        }

        public function destroy($id) {
            $this->load->model('almacen_model');
            $result = $this->almacen_model->destroy($id);
            if ($result) {
                $result = array('title' => 'Eliminado', 'message' => 'Se ha eliminado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido eliminar el registro.', 'type' => 'error');
            }
            $rows = $this->almacen_model->fetch_all_state();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('almacenes/index', compact('rows', 'result'));

        }

    }