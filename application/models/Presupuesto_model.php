<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Presupuesto_model extends CI_Model
    {
        var $pres_cod;
        var $pres_fecha_emision;
        var $pres_fecha_recepcion;
        var $pres_forma_pago;
        var $pres_lugar_trabajo;
        var $pres_estado;
        var $pres_costo_mano_obra;
        var $pres_costo_materiales;
        var $pres_costo_total;
        var $cli_codigo;
        var $pres_encargado;
        var $prod_list;
        var $emp_list;

        public function fetch_all($buscar = '') {
            $query = $this->db->query("CALL pa_presupuesto_listar('%$buscar%')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function insertar() {
            $rs = $this->db->query("CALL pa_presupuesto_insert(?,?,?,?,?,?,?,?,?,@pres_cod)", [
                $this->pres_fecha_emision,
                $this->pres_fecha_recepcion,
                $this->pres_forma_pago,
                $this->pres_lugar_trabajo,
                $this->pres_costo_mano_obra,
                $this->pres_costo_materiales,
                $this->pres_costo_total,
                $this->cli_codigo,
                $this->pres_encargado
            ]);

            $query   = $this->db->query("SELECT @pres_cod as pres_cod");
            $pres_id = $query->result_array()[0]['pres_cod'];


             foreach ($this->prod_list as $d) {
                  $rs = $rs && $this->db->query('CALL pa_detalle_presupuesto_insert(?,?,?,?)', [
                          $pres_id,
                          $d['codigo'],
                          $d['cantidad'],
                          $d['precio']
                      ]);
              }



            return $pres_id;
        }
    }