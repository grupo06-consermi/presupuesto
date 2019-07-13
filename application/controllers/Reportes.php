<?php

    /**
     * @property  Presupuesto_model Presupuesto_model
     * @property  Cliente_model Cliente_model
     */
    class Reportes extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            $this->load->view('index/header');
            $this->load->view('index/menu');
            $this->load->model('Presupuesto_model');
            $this->load->model('Cliente_model');
        }

        public function PresupBySituacion() {
            $anio    = IssetOr($_POST['cboAnio'], 2019);
            $cli_cod = IssetOr($_POST['cboClientes'], 0);

            $cli_list = $this->Cliente_model->listar();
            $cli_data = $this->Cliente_model->getByID($cli_cod);
            $reporte  = $this->Presupuesto_model->reporteBySituacion($anio, $cli_cod);

            $this->load->view('reportes/PresupBySituacion', compact('anio', 'cli_list', 'cli_data', 'reporte'));
        }

        public function CostosByMes() {
            $anio    = IssetOr($_POST['cboAnio'], 2019);
            $cli_cod = IssetOr($_POST['cboClientes'], 0);

            $cli_list = $this->Cliente_model->listar();
            $cli_data = $this->Cliente_model->getByID($cli_cod);
            $reporte  = $this->Presupuesto_model->reportCostoByMes($anio, $cli_cod);

            $this->load->view('reportes/CostosByMes', compact('anio', 'cli_list', 'cli_data', 'reporte'));
        }
    }