<?php

    /**
     * @property  presupuesto_model $presupuesto_model
     * @property  ejecucion_model $ejecucion_model
     * @property  almacen_model $almacen_model
     */
    class Ejecucion extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->model('ejecucion_model');
            $this->load->model('presupuesto_model');
        }

        public function index() {
            $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q');
            $rows   = $this->ejecucion_model->fetch_all_state($buscar);
            $this->load->view('ejecuciones/index', compact('rows'));
        }

        public function create() {
            $presupuestos = $this->presupuesto_model->listar();
            $this->load->view('ejecuciones/create', compact('presupuestos'));
        }

        public function createOn($pres_id, $page) {
            $pres_row = $this->presupuesto_model->getByID($pres_id);
            $this->load->view('ejecuciones/create', compact('pres_id', 'page', 'pres_row'));
        }

        public function edit($id) {
            $ejecucion    = $this->ejecucion_model->getId($id);
            $presupuestos = $this->presupuesto_model->listar();
            $this->load->view('ejecuciones/edit', compact('ejecucion', 'presupuestos'));

        }

        public function update($id) {
            $result = $this->ejecucion_model->update($id);
            if ($result) {
                $result = array('title' => 'Actualizado', 'message' => 'Se ha actualizado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido Actualizar el registro.', 'type' => 'error');
            }
            $rows = $this->ejecucion_model->fetch_all_state();
            $this->load->view('ejecuciones/index', compact('rows', 'result'));
        }

        public function store() {
            $result = $this->ejecucion_model->insert();
            if ($result) {
                $result = array('title' => 'Guardado', 'message' => 'Se ha guardado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido guardar el registro.', 'type' => 'error');
            }
            $rows = $this->ejecucion_model->fetch_all_state();
            $this->load->view('ejecuciones/index', compact('rows', 'result'));

        }

        public function destroy($id) {
            $result = $this->ejecucion_model->destroy($id);
            if ($result) {
                $result = array('title' => 'Eliminado', 'message' => 'Se ha eliminado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido eliminar el registro.', 'type' => 'error');
            }
            $rows = $this->almacen_model->fetch_all_state();
            $this->load->view('ejecuciones/index', compact('rows', 'result'));

        }

    }