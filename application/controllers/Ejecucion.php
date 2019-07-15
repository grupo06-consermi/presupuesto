<?php

    /**
     * @property  presupuesto_model $presupuesto_model
     * @property  ejecucion_model $ejecucion_model
     * @property  almacen_model $almacen_model
     * @property  phpmailer_lib phpmailer_lib
     * @property  cliente_model cliente_model
     * @property  producto_model producto_model
     * @property  empleado_model empleado_model
     */
    class Ejecucion extends CI_Controller
    {
        public function __construct() {
            parent::__construct();
            verificarLogin();
            if ($this->router->method != 'create_pdf') {
                $this->load->view('index/header');
                $this->load->view('index/menu');
            }

            $this->load->helper('pdf_helper');
            $this->load->model('ejecucion_model');
            $this->load->model('presupuesto_model');
            $this->load->model('producto_model');
            $this->load->model('cliente_model');
            $this->load->model('empleado_model');
        }

        public function index() {
            $buscar = empty($this->input->post('q')) ? '' : $this->input->post('q');
            $rows   = $this->ejecucion_model->fetch_all_state($buscar);
            $this->load->view('ejecuciones/index', compact('rows'));
        }

        public function create() {
            $presupuestos = $this->presupuesto_model->listar();
            $this->load->view('ejecuciones/create', compact('presupuestos'));
        }

        public function createOn($pres_id, $page) {
            $pres_row     = $this->presupuesto_model->getByID($pres_id);
            $presdet_list = $this->presupuesto_model->getDetalles($pres_id);
            $this->load->view('ejecuciones/create', compact('pres_id', 'page', 'pres_row', 'presdet_list'));
        }

        public function edit($id) {
            $ejecucion    = $this->ejecucion_model->getId($id);
            $presupuestos = $this->presupuesto_model->listar();
            $this->load->view('ejecuciones/edit', compact('ejecucion', 'presupuestos'));
        }

        public function update($id) {
            $result = $this->ejecucion_model->update($id);
            if ($result) {
                $result = array('title' => 'Actualizado', 'message' => 'Se ha actualizado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido Actualizar el registro.', 'type' => 'error');
            }
            $rows = $this->ejecucion_model->fetch_all_state();
            $this->load->view('ejecuciones/index', compact('rows', 'result'));
        }

        public function store() {
            $result = $this->ejecucion_model->insert();
            if ($result) {
                $result = array('title' => 'Guardado', 'message' => 'Se ha guardado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido guardar el registro.', 'type' => 'error');
            }
            $rows = $this->ejecucion_model->fetch_all_state();
            $this->load->view('ejecuciones/index', compact('rows', 'result'));
        }

        public function destroy($id) {
            $result = $this->ejecucion_model->destroy($id);
            if ($result) {
                $result = array('title' => 'Eliminado', 'message' => 'Se ha eliminado correctamente el registro.');
            } else {
                $result = array('title' => 'Error', 'message' => 'No se ha podido eliminar el registro.', 'type' => 'error');
            }
            $rows = $this->almacen_model->fetch_all_state();
            $this->load->view('ejecuciones/index', compact('rows', 'result'));

        }

        public function create_pdf($pres_id) {
            $pres = $this->presupuesto_model->getByID($pres_id);
            $this->load->view('presupuesto/presupuesto_pdf', compact('pres'));
        }

        public function send_pdf($pres_id, $page = '') {
            $pres      = $this->presupuesto_model->getByID($pres_id);
            $titulo    = "Presupuesto No. $pres_id - CONSERMI";
            $contenido = "<h2 style='color: #985430;'>Presupuesto</h2>
                         <p>Estimado cliente, en el presente mensaje le presentamos su presupuesto en formato PDF.</p>";

            $rpta = $this->SendEmail($pres->cli_email, $titulo, $contenido, APPPATH."documentos/presupuesto_{$pres->pres_cod}.pdf");

            $pres_row     = $this->presupuesto_model->getByID($pres_id);
            $presdet_list = $this->presupuesto_model->getDetalles($pres_id);

            if ($page == 'presupuesto_edit') {
                $pres_row  = $this->presupuesto_model->getByID($pres_id);
                $prod_list = $this->presupuesto_model->getDetalles($pres_id);
                $empl_list = $this->presupuesto_model->getManoObra($pres_id);
                $clientes  = $this->cliente_model->fetch_all();
                $products  = $this->producto_model->fetch_all();
                $empleados = $this->empleado_model->fetch_all();
                $this->load->view('presupuesto/edit', compact('pres_row', 'clientes', 'prod_list', 'empl_list', 'products', 'empleados', 'rpta'));

            } elseif ($page == 'presupuesto_show') {
                $pres_row  = $this->presupuesto_model->getByID($pres_id);
                $prod_list = $this->presupuesto_model->getDetalles($pres_id);
                $empl_list = $this->presupuesto_model->getManoObra($pres_id);
                $clientes  = $this->cliente_model->fetch_all();
                $products  = $this->producto_model->fetch_all();
                $empleados = $this->empleado_model->fetch_all();
                $this->load->view('presupuesto/show', compact('pres_row', 'clientes', 'prod_list', 'empl_list', 'products', 'empleados', 'rpta'));

            } else {
                $this->load->view('ejecuciones/create', compact('pres_id', 'page', 'pres_row', 'presdet_list', 'rpta'));
            }
        }

        function SendEmail($email, $titulo, $contenido, $archivo) {
            date_default_timezone_set('Etc/UTC');

            $this->load->library('phpmailer_lib');
            $mail = $this->phpmailer_lib->load();
            $mail->isSMTP();
            $mail->CharSet = 'UTF-8';

            $mail->Debugoutput = 'html';
            $mail->Host        = 'smtp.live.com';
            $mail->Port        = 587;
            $mail->SMTPSecure  = 'tls';
            $mail->SMTPAuth    = true;

            $mail->Username = "consermi@outlook.com";
            $mail->Password = "******44A";
            $mail->setFrom($mail->Username);
            $mail->addReplyTo($mail->Username);
            $mail->addAddress($email);

            $mail->Subject = $titulo;
            $mail->msgHTML($contenido);
            $mail->addAttachment($archivo);

            if (!$mail->send()) {
                return "Mailer error: ".$mail->ErrorInfo;
            } else {
                return "Mensaje enviado";
            }
        }

    }