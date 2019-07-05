<?php

class Tdocumento extends CI_Controller {

    public function __construct() {
        parent::__construct();
        verificarLogin();
    }

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('tdocumento_model');
        $rows = $this->tdocumento_model->fetch_all($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('tdocumentos/index', compact('rows'));
    }

    public function create() {
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('tdocumentos/create');

    }

    public function edit($id) {
        $this->load->model('tdocumento_model');
        $tdocumento = $this->tdocumento_model->getId($id);
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('tdocumentos/edit', compact('tdocumento'));
    }
    

    public function update($id) {
        $this->load->model('tdocumento_model');
        $result = $this->tdocumento_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->tdocumento_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('tdocumentos/index', compact('rows', 'result'));
        
    }

    public function store() {
        $this->load->model('tdocumento_model');
        $result = $this->tdocumento_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->tdocumento_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('tdocumentos/index', compact('rows','result'));
        
    }

    public function destroy($id) {
        $this->load->model('tdocumento_model');
        $result = $this->tdocumento_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->tdocumento_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('tdocumentos/index', compact('rows', 'result'));
        
    }

}