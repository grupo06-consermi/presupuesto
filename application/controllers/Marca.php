<?php

class Marca extends CI_Controller {

    public function __construct() {
        parent::__construct();
        verificarLogin();
    }

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('Marca_model');
        $rows = $this->Marca_model->fetch_all($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('Marcas/index', compact('rows'));
    }

    public function create() {
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('Marcas/create');

    }

    public function edit($id) {
        $this->load->model('marca_model');
        $marca = $this->marca_model->getId($id);
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('marcas/edit', compact('marca'));
    }
    

    public function update($id) {
        $this->load->model('marca_model');
        $result = $this->marca_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->marca_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('marcas/index', compact('rows', 'result'));
        
    }

    public function store() {
        $this->load->model('marca_model');
        $result = $this->marca_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->marca_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('marcas/index', compact('rows','result'));
        
    }

    public function destroy($id) {
        $this->load->model('marca_model');
        $result = $this->marca_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->marca_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('marcas/index', compact('rows', 'result'));
        
    }

}