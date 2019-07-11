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

        public function getByID($usu_cod) {
            $query  = $this->db->query("CALL pa_presupuesto_getByID(?)", [$usu_cod]);
            $result = $query->result();
            $this->db->next_result();
            return $result[0];
        }

        public function listar($buscar = '') {
            $query = $this->db->query("CALL pa_presupuesto_listar('%$buscar%')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function insertar() {
            $rs       = $this->db->query("CALL pa_presupuesto_insert(?,?,?,?,?,?,?,@pres_cod)", [
                $this->pres_forma_pago,
                $this->pres_lugar_trabajo,
                $this->pres_costo_mano_obra,
                $this->pres_costo_materiales,
                $this->pres_costo_total,
                $this->cli_codigo,
                $this->pres_encargado
            ]);
            $query    = $this->db->query("SELECT @pres_cod as pres_cod");
            $pres_cod = $query->result_array()[0]['pres_cod'];

            foreach ($this->prod_list as $d) {
                $rs = $rs && $this->db->query('CALL pa_detalle_presupuesto_insert(?,?,?,?)', [
                        $pres_cod,
                        $d['codigo'],
                        $d['cantidad'],
                        $d['precio']
                    ]);

                // descontar stock e indicar reposicion
                $rs = $rs && $this->db->query("
                        UPDATE producto 
                        SET prod_stock = if(prod_stock - $d[cantidad] >= 0, prod_stock - $d[cantidad], 0),
                            prod_stock_reponer = if(prod_stock - $d[cantidad] < 0, $d[cantidad] - prod_stock, 0)
                        WHERE prod_cod = $d[codigo];
                ");
            }

            $query   = $this->db->query("CALL pa_actividad_insert(?,?,?,?,?,@act_cod)", [
                $pres_cod,
                "Mano de obra",
                '0000-00-00 00:00:00',
                '0000-00-00 00:00:00',
                $this->pres_costo_mano_obra
            ]);
            $query   = $this->db->query("SELECT @act_cod as act_cod");
            $act_cod = $query->result_array()[0]['act_cod'];

            foreach ($this->emp_list as $d) {
                $rs = $this->db->query("CALL pa_actividad_empleado_insert(?,?,?,?,?,@aemp_codigo)", [
                    $act_cod,
                    $d['emp_codigo'],
                    $d['pago_dia'],
                    $d['tiempo'],
                    $d['importe'],
                ]);
            }

            return $pres_cod;
        }
    }