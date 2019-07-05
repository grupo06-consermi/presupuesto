<?php

class Conformidad extends CI_Controller {

    public function __construct() {
        parent::__construct();
        verificarLogin();
    }

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('conformidad_model');
        $rows = $this->conformidad_model->fetch_all_state($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('conformidades/index', compact('rows'));
    }

    public function create() {
        $this->load->model('presupuesto_model');
        $presupuestos = $this->presupuesto_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('conformidades/create', compact('presupuestos'));

    }

    public function edit($id) {
        $this->load->model('conformidad_model');
        $this->load->model('presupuesto_model');
        $conformidad = $this->conformidad_model->getId($id);
        $presupuestos = $this->presupuesto_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('conformidades/edit', compact('conformidad','presupuestos'));
    }
    

    public function update($id) {
        $this->load->model('conformidad_model');
        $result = $this->conformidad_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->conformidad_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('conformidades/index', compact('rows', 'result'));
        
    }

    public function store() {
        $this->load->model('conformidad_model');
        $result = $this->conformidad_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->conformidad_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('conformidades/index', compact('rows','result'));
        
    }

    public function destroy($id) {
        $this->load->model('conformidad_model');
        $result = $this->conformidad_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->conformidad_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('conformidades/index', compact('rows', 'result'));
        
    }

}