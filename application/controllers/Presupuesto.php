<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    /**
     * @property   producto_model producto_model
     * @property   presupuesto_model presupuesto_model
     * @property   Cliente_model cliente_model
     */
    class Presupuesto extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->model('presupuesto_model');
            $this->load->model('producto_model');
            $this->load->model('cliente_model');
        }

        public function index() {
            $records = $this->presupuesto_model->fetch_all();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('presupuesto/index', compact('records'));
        }

        public function edit($id) {
            $this->load->view('index/header');
            $this->load->view('index/menu');
        }

        public function show($id) {
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('presupuesto/show');
        }

        public function create() {
            $products = $this->producto_model->fetch_all_state();
            $clientes = $this->cliente_model->fetch_all();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->view('presupuesto/create', compact('products', 'clientes'));
        }

        public function guardar($pre_id = 0) {
            $this->presupuesto_model->pres_cod              = 0;
            $this->presupuesto_model->pres_fecha_emision    = $_POST['fechaEmision'];
            $this->presupuesto_model->pres_fecha_recepcion  = $_POST['fechaRecepcion'];
            $this->presupuesto_model->pres_forma_pago       = $_POST['formaPago'];
            $this->presupuesto_model->pres_lugar_trabajo    = $_POST['lugarTrabajo'];
            $this->presupuesto_model->pres_estado           = $_POST['estado'];
            $this->presupuesto_model->pres_costo_mano_obra  = $_POST['costoManoObra'];
            $this->presupuesto_model->pres_costo_materiales = $_POST['costoMateriales'];
            $this->presupuesto_model->pres_costo_total      = $_POST['costoTotal'];
            $this->presupuesto_model->cli_codigo            = $_POST['cli_codigo'];
            $this->presupuesto_model->pres_encargado        = ''; // $_POST[''];
            $this->presupuesto_model->detalles              = json_decode($_POST['detalles'], true);

            echo $this->presupuesto_model->insertar();
        }

        public function destroy($id) {

        }
    }