<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    /**
     * @property   producto_model producto_model
     * @property   presupuesto_model presupuesto_model
     * @property   Cliente_model cliente_model
     * @property  empleado_model empleado_model
     * @property  phpmailer_lib phpmailer_lib
     */
    class Presupuesto extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();

            if ($this->router->method != 'create_pdf' && $this->router->method != 'guardar') {
                $this->load->view('index/header');
                $this->load->view('index/menu');
            }

            $this->load->helper('pdf_helper');
            $this->load->model('presupuesto_model');
            $this->load->model('producto_model');
            $this->load->model('cliente_model');
            $this->load->model('empleado_model');
        }

        public function index() {
            $records = $this->presupuesto_model->listar();
            $this->load->view('presupuesto/index', compact('records'));
        }

        public function edit($pres_id) {
            $pres_row  = $this->presupuesto_model->getByID($pres_id);
            $prod_list = $this->presupuesto_model->getDetalles($pres_id);
            $empl_list = $this->presupuesto_model->getManoObra($pres_id);
            $clientes  = $this->cliente_model->fetch_all();
            $products  = $this->producto_model->fetch_all();
            $empleados = $this->empleado_model->fetch_all();
            $this->load->view('presupuesto/edit', compact('pres_row', 'clientes', 'prod_list', 'empl_list', 'products', 'empleados'));
        }

        public function show($pres_id) {
            $pres_row  = $this->presupuesto_model->getByID($pres_id);
            $prod_list = $this->presupuesto_model->getDetalles($pres_id);
            $empl_list = $this->presupuesto_model->getManoObra($pres_id);
            $clientes  = $this->cliente_model->fetch_all();
            $products  = $this->producto_model->fetch_all();
            $empleados = $this->empleado_model->fetch_all();
            $this->load->view('presupuesto/show', compact('pres_row', 'clientes', 'prod_list', 'empl_list', 'products', 'empleados'));
        }

        public function create() {
            $products  = $this->producto_model->fetch_all_state();
            $clientes  = $this->cliente_model->fetch_all();
            $empleados = $this->empleado_model->fetch_all();
            $this->load->view('presupuesto/create', compact('products', 'clientes', 'empleados'));
        }


        public function guardar($pres_id = 0) {
            $this->presupuesto_model->pres_cod              = IssetOr($_POST['pres_cod'], 0);
            $this->presupuesto_model->pres_descripcion      = $_POST['pres_descripcion'];
            $this->presupuesto_model->pres_fecha_emision    = ''; // DAL = now() //; $_POST['fechaEmision'];
            $this->presupuesto_model->pres_fecha_recepcion  = ''; // null $_POST['fechaRecepcion'];
            $this->presupuesto_model->pres_forma_pago       = $_POST['formaPago'];
            $this->presupuesto_model->pres_lugar_trabajo    = $_POST['lugarTrabajo'];
            $this->presupuesto_model->pres_estado           = $_POST['estado'];
            $this->presupuesto_model->pres_costo_mano_obra  = $_POST['costoManoObra'];
            $this->presupuesto_model->pres_costo_materiales = $_POST['costoMateriales'];
            $this->presupuesto_model->pres_costo_total      = $_POST['costoTotal'];
            $this->presupuesto_model->cli_codigo            = $_POST['cli_codigo'];
            $this->presupuesto_model->pres_encargado        = $_POST['encargado'];
            $this->presupuesto_model->prod_list             = json_decode($_POST['prod_list'], true);
            $this->presupuesto_model->emp_list              = json_decode($_POST['emp_list'], true);

            if ($this->presupuesto_model->pres_cod == 0) {
                echo $this->presupuesto_model->insertar();
            } else {
                echo $this->presupuesto_model->actualizar();
            }
        }

        public function set_acepted($pres_id) {
            $this->presupuesto_model->setAsAceptado($pres_id);
            $records = $this->presupuesto_model->listar();
            $this->load->view('presupuesto/index', compact('records'));
        }

        public function set_rechazado($pres_id) {
            $this->presupuesto_model->setAsRechazado($pres_id);
            $records = $this->presupuesto_model->listar();
            $this->load->view('presupuesto/index', compact('records'));
        }

        public function borrar($pres_id) {
            $this->presupuesto_model->borrar($pres_id);
            $records = $this->presupuesto_model->listar();
            $this->load->view('presupuesto/index', compact('records'));
        }

    }