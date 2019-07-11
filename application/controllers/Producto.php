<?php

    /**
     * @property producto_model producto_model
     * @property marca_model marca_model
     * @property categoria_model categoria_model
     * @property unidadmedida_model unidadmedida_model
     * @property almacen_model almacen_model
     * @property proveedor_model proveedor_model
     */
    class Producto extends CI_Controller
    {

        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->model('categoria_model');
            $this->load->model('proveedor_model');
            $this->load->model('marca_model');
            $this->load->model('almacen_model');
            $this->load->model('unidadmedida_model');
            $this->load->model('producto_model');
        }

        public function index() {
            $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q');
            $rows   = $this->producto_model->fetch_all($buscar);
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('productos/index', compact('rows'));
        }

        public function create() {
            $marcas         = $this->marca_model->fetch_all_state();
            $categorias     = $this->categoria_model->fetch_all_state();
            $almacenes      = $this->almacen_model->fetch_all_state();
            $unidades       = $this->unidadmedida_model->fetch_all_state();
            $proveedor_list = $this->proveedor_model->listarCbo();

            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('productos/create', compact('categorias', 'marcas', 'almacenes', 'unidades', 'proveedor_list'));
        }

        public function edit($id) {
            $marcas         = $this->marca_model->fetch_all_state();
            $producto       = $this->producto_model->getId($id);
            $categorias     = $this->categoria_model->fetch_all_state();
            $almacenes      = $this->almacen_model->fetch_all_state();
            $unidades       = $this->unidadmedida_model->fetch_all_state();
            $proveedor_list = $this->proveedor_model->listarCbo();

            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('productos/edit', compact('producto', 'categorias', 'marcas', 'almacenes', 'unidades', 'proveedor_list'));
        }

        public function update($id) {
            $this->load->helper('url');
            $result = $this->producto_model->update($id);
            if ($result) {
                $this->session->set_flashdata('correcto', 'Se ha actualizado correctamente el producto');
            } else {
                $this->session->set_flashdata('error', 'Se ha producido un error al intentar actualizar el producto');
            }
            redirect('/producto');
        }

        public function store() {
            $result = $this->producto_model->insert();
            if ($result) {
                $this->session->set_flashdata('correcto', 'Se ha guardado correctamente el producto');
            } else {
                $this->session->set_flashdata('error', 'Se ha producido un error al intentar guardar el producto');
            }
            redirect('/producto');
        }

        public function destroy($id) {
            $result = $this->producto_model->destroy($id);
            if ($result) {
                $this->session->set_flashdata('correcto', 'Se ha eliminado correctamente el producto');
            } else {
                $this->session->set_flashdata('error', 'Se ha producido un error al intentar eliminar el producto');
            }
            redirect('/producto');
        }
    }