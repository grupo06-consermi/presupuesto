<?php

class Proveedor extends CI_Controller {

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('proveedor_model');
        $rows = $this->proveedor_model->fetch_all($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('proveedores/index', compact('rows'));
    }

    public function create() {
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('proveedores/create');

    }

    public function edit($id) {
        $this->load->model('proveedor_model');
        $proveedor = $this->proveedor_model->getId($id);
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('proveedores/edit', compact('proveedor'));
    }
    

    public function update($id) {
        $this->load->model('proveedor_model');
        $result = $this->proveedor_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->proveedor_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('proveedores/index', compact('rows', 'result'));
        
    }

    public function store() {
        $this->load->model('proveedor_model');
        $result = $this->proveedor_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->proveedor_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('proveedores/index', compact('rows','result'));
        
    }

    public function destroy($id) {
        $this->load->model('proveedor_model');
        $result = $this->proveedor_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->proveedor_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('proveedores/index', compact('rows', 'result'));
        
    }

}