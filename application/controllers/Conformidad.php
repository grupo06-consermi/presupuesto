<?php

    /**
     * @property  conformidad_model conformidad_model
     * @property  presupuesto_model presupuesto_model
     */
    class Conformidad extends CI_Controller
    {

        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->view('index/header');
            $this->load->view('index/menu');

            $this->load->model('conformidad_model');
            $this->load->model('presupuesto_model');
        }

        public function index() {
            $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q');
            $rows   = $this->conformidad_model->fetch_all_state($buscar);
            $this->load->view('conformidades/index', compact('rows'));
        }

        public function create() {
            $presupuestos = $this->presupuesto_model->listar();
            $this->load->view('conformidades/create', compact('presupuestos'));
        }

        public function createOn($pres_id) {
            $pres_row = $this->presupuesto_model->getByID($pres_id);
            $this->load->view('conformidades/create', compact('presupuestos'));
        }

        public function edit($id) {
            $conformidad  = $this->conformidad_model->getId($id);
            $presupuestos = $this->presupuesto_model->listar();
            $this->load->view('conformidades/edit', compact('conformidad', 'presupuestos'));
        }

        public function update($id) {
            $result = $this->conformidad_model->update($id);
            if ($result) {
                $result = array('title' => 'Actualizado', 'message' => 'Se ha actualizado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido Actualizar el registro.', 'type' => 'error');
            }
            $rows = $this->conformidad_model->fetch_all_state();
            $this->load->view('conformidades/index', compact('rows', 'result'));
        }

        public function store() {
            $result = $this->conformidad_model->insert();
            if ($result) {
                $result = array('title' => 'Guardado', 'message' => 'Se ha guardao correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido guardar el registro.', 'type' => 'error');
            }
            $rows = $this->conformidad_model->fetch_all_state();
            $this->load->view('conformidades/index', compact('rows', 'result'));

        }

        public function destroy($id) {
            $result = $this->conformidad_model->destroy($id);
            if ($result) {
                $result = array('title' => 'Eliminado', 'message' => 'Se ha eliminado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido eliminar el registro.', 'type' => 'error');
            }
            $rows = $this->conformidad_model->fetch_all_state();
            $this->load->view('conformidades/index', compact('rows', 'result'));

        }

    }