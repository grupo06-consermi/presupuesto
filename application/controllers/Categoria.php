<?php

class Categoria extends CI_Controller {

    public function __construct() {
        parent::__construct();
        verificarLogin();
    }

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('categoria_model');
        $rows = $this->categoria_model->fetch_all_state($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('categorias/index', compact('rows'));
    }

    public function create() {
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('categorias/create');

    }

    public function edit($id) {
        $this->load->model('categoria_model');
        $categoria = $this->categoria_model->getId($id);
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('categorias/edit', compact('categoria'));
    }
    

    public function update($id) {
        $this->load->model('categoria_model');
        $result = $this->categoria_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->categoria_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('categorias/index', compact('rows', 'result'));
        
    }

    public function store() {
        $this->load->model('categoria_model');
        $result = $this->categoria_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->categoria_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('categorias/index', compact('rows','result'));
        
    }

    public function destroy($id) {
        $this->load->model('categoria_model');
        $result = $this->categoria_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->categoria_model->fetch_all_state();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('categorias/index', compact('rows', 'result'));
        
    }

}