<?php

class Producto extends CI_Controller {

    public function __construct() {
        parent::__construct();
        verificarLogin();
    }

    public function index() {
        $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q') ;
        $this->load->model('producto_model');
        $rows = $this->producto_model->fetch_all($buscar);
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('productos/index', compact('rows'));
    }


    public function create() {
        $this->load->model('categoria_model');
        $this->load->model('marca_model');
        $this->load->model('almacen_model');
        $this->load->model('unidadmedida_model');

        $marcas = $this->marca_model->fetch_all_state();
        $categorias = $this->categoria_model->fetch_all_state();        
        $almacenes = $this->almacen_model->fetch_all_state();        
        $unidades = $this->unidadmedida_model->fetch_all_state(); 

        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('productos/create', compact('categorias','marcas', 'almacenes', 'unidades'));
    }

    
    public function edit($id) {
        $this->load->model('producto_model');
        $this->load->model('categoria_model');
        $this->load->model('marca_model');
        $this->load->model('almacen_model');
        $this->load->model('unidadmedida_model');
        $marcas = $this->marca_model->fetch_all_state();
        $producto = $this->producto_model->getId($id);
        $categorias = $this->categoria_model->fetch_all_state();        
        $almacenes = $this->almacen_model->fetch_all_state();        
        $unidades = $this->unidadmedida_model->fetch_all_state();      
        $this->load->view('index/header');
        $this->load->view('index/menu');
        $this->load->view('productos/edit', compact('producto', 'categorias','marcas', 'almacenes', 'unidades'));
    }


    public function update($id) {
        $this->load->helper('url');
        $this->load->model('producto_model');
        $result = $this->producto_model->update($id);
        if($result) {
            $this->session->set_flashdata('correcto', 'Se ha actualizado correctamente el producto');
        } else {
            $this->session->set_flashdata('error', 'Se ha producido un error al intentar actualizar el producto');
        }
        redirect('/producto');
    }

    public function store() {
        $this->load->model('producto_model');
        $result = $this->producto_model->insert();
        if($result) {
            $this->session->set_flashdata('correcto', 'Se ha guardado correctamente el producto');
        } else {
            $this->session->set_flashdata('error', 'Se ha producido un error al intentar guardar el producto');
        }
        redirect('/producto');
    }

    public function destroy($id) {
        $this->load->model('producto_model');
        $result = $this->producto_model->destroy($id);
        if($result) {
            $this->session->set_flashdata('correcto', 'Se ha eliminado correctamente el producto');
        } else {
            $this->session->set_flashdata('error', 'Se ha producido un error al intentar eliminar el producto');
        }
        redirect('/producto');
    }
}