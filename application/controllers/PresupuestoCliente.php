<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    /**
     * @property   producto_model producto_model
     * @property   presupuesto_model presupuesto_model
     * @property   Cliente_model cliente_model
     * @property  empleado_model empleado_model
     */
    class PresupuestoCliente extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            $this->load->view('index/header');
            $this->load->model('presupuesto_model');
            $this->load->model('producto_model');
            $this->load->model('cliente_model');
            $this->load->model('empleado_model');
        }

        public function index($pres_id) {
            $pres_row  = $this->presupuesto_model->getByID($pres_id);
            $prod_list = $this->presupuesto_model->getDetalles($pres_id);
            $empl_list = $this->presupuesto_model->getManoObra($pres_id);
            $clientes  = $this->cliente_model->fetch_all();
            $products  = $this->producto_model->fetch_all();
            $empleados = $this->empleado_model->fetch_all();
            $this->load->view('presupuestocliente/index', compact('pres_row', 'clientes', 'prod_list', 'empl_list', 'products', 'empleados'));
        }
    }