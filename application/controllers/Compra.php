<?php

    /**
     * @property  RolModel RolModel
     * @property  proveedor_model proveedor_model
     * @property  Producto_model Producto_model
     * @property  CompraModel CompraModel
     */
    class compra extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            if ($this->router->method != 'registrar') {
                $this->load->view('index/header');
                $this->load->view('index/menu');
            }
            $this->load->model('CompraModel');
            $this->load->model('proveedor_model');
            $this->load->model('Producto_model');
        }

        public function create() {
            $prov_list = $this->proveedor_model->listarCbo();
            $prod_list = $this->Producto_model->fetch_all();
            $this->load->view('compra/registrar', ['prov_list' => $prov_list, 'prod_list' => $prod_list]);
        }

        public function Registrar($comp_cod = 0) {
            $this->CompraModel->comp_cod         = $this->input->post('comp_cod');
            $this->CompraModel->prov_cod         = $this->input->post('prov_cod');
            $this->CompraModel->comp_fecha       = $this->input->post('comp_fecha');
            $this->CompraModel->comp_costo_total = $this->input->post('comp_costo_total');
            $this->CompraModel->detalles         = json_decode($_POST['prod_list'], true);

            if ($this->CompraModel->comp_cod == 0) {
                echo $this->CompraModel->insertar();
            } else {
                echo $this->CompraModel->update();
            }
        }

        public function detalles($comp_id) {
            $compdet_list = $this->CompraModel->getDetalles($comp_id);
            $this->load->view('compra/detalles', compact('compdet_list', 'comp_id'));
        }

        public function Listar() {
            $data['comp_list'] = $this->CompraModel->listar();
            $this->load->view('compra/listar', $data);
        }

        public function Borrar($rol_cod) {
            $this->CompraModel->borrar($rol_cod);
            $data['comp_list'] = $this->CompraModel->listar();
            $this->load->view('compra/listar', $data);
        }

        public function Activar($rol_cod) {
            $this->CompraModel->activar($rol_cod);
            $data['comp_list'] = $this->CompraModel->listar();
            $this->load->view('compra/listar', $data);
        }
    }