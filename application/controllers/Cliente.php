<?php

class Cliente extends CI_Controller {

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('cliente_model');
        $rows = $this->cliente_model->fetch_all($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('clientes/index', compact('rows'));
    }

    public function create() {
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('clientes/create');

    }
    public function store() {
        $this->load->model('cliente_model');
        $result = $this->cliente_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->cliente_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('clientes/index', compact('rows','result'));
        
    }


    public function edit($id) {
        $this->load->model('cliente_model');
        $cliente = $this->cliente_model->getId($id);
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('clientes/edit', compact('cliente'));
    }
    

    public function update($id) {
        $this->load->model('cliente_model');
        $result = $this->cliente_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->cliente_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('clientes/index', compact('rows', 'result'));
        
    }

    

    public function destroy($id) {
        $this->load->model('cliente_model');
        $result = $this->cliente_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->cliente_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('clientes/index', compact('rows', 'result'));
        
    }

}