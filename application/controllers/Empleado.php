<?php

class Empleado extends CI_Controller {

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('empleado_model');
        $rows = $this->empleado_model->fetch_all($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');        
        $this->load->view('empleados/index', compact('rows'));
    }

    public function create() {

        $this->load->model('tdocumento_model');
        $tdocumentos = $this->tdocumento_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu'); 
        $this->load->view('empleados/create', compact('tdocumentos'));

    }
    public function store() {
        $this->load->model('empleado_model');
        $result = $this->empleado_model->insert();
        if($result) {
            $result = array('title' => 'Guardado', 'message'=> 'Se ha guardao correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido guardar el registro.', 'type' => 'error');
        }
        $rows = $this->empleado_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('empleados/index', compact('rows','result'));
        
    }


    public function edit($id) {
        $this->load->model('empleado_model');
        $this->load->model('tdocumento_model');        
        $empleado = $this->empleado_model->getId($id);
        $tdocumentos = $this->tdocumento_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('empleados/edit', compact('empleado','tdocumentos'));
    }
    

    public function update($id) {
        $this->load->model('empleado_model');
        $result = $this->empleado_model->update($id);
        if($result) {
            $result = array('title' => 'Actualizado', 'message'=> 'Se ha actualizado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido Actualizar el registro.', 'type' => 'error');
        }
        $rows = $this->empleado_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('empleados/index', compact('rows', 'result'));
        
    }

    

    public function destroy($id) {
        $this->load->model('empleado_model');
        $result = $this->empleado_model->destroy($id);
        if($result) {
            $result = array('title' => 'Eliminado', 'message'=> 'Se ha eliminado correctamente el registro.');
        } else {
            $result = array('title' => 'Error', 'message'=> 'No se ha podido eliminar el registro.', 'type' => 'error');
        }
        $rows = $this->empleado_model->fetch_all();
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('empleados/index', compact('rows', 'result'));
        
    }

}