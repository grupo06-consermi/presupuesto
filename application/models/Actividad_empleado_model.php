<?php

    class Actividad_empleado_model extends CI_Model
    {
        var $aemp_codigo;
        var $aemp_cantidad_dias;
        var $aemp_pago_dia;
        var $aemp_total;
        var $emp_cod;
        var $act_cod;

        function getRow($aemp_codigo) {
            $query = $this->db->query("CALL pa_actividad_empleado_getRow('$aemp_codigo')");
            $row   = $query->result();
            $query->next_result();
            return $row;
        }

        function getByID($aemp_codigo) {
            $query = $this->db->query("CALL pa_actividad_empleado_getByID('$aemp_codigo')");
            $row   = $query->result();
            $query->next_result();
            return $row;
        }

        function listCbo($aemp_codigo = 0) {
            $query = $this->db->query("CALL pa_actividad_empleado_listCbo('$aemp_codigo')");
            $row   = $query->result();
            $query->next_result();
            return $row;
        }

        function listar($buscar = '') {
            $query = $this->db->query("CALL pa_actividad_empleado_list('$buscar')");
            $row   = $query->result();
            $query->next_result();
            return $row;
        }

        function insert() {
            $rs = $this->db->query("CALL pa_actividad_empleado_insert(?,?,?,?,?,@aemp_codigo)", [
                $this->aemp_cantidad_dias,
                $this->aemp_pago_dia,
                $this->aemp_total,
                $this->emp_cod,
                $this->act_cod
            ]);

            if ($rs) {
                $query       = $this->db->query("SELECT @aemp_codigo as aemp_codigo");
                $aemp_codigo = $query->result_array()[0]['aemp_codigo'];
                return $aemp_codigo;
            } else {
                return 0;
            }
        }

        function update() {
            $rs = $this->db->query("CALL pa_actividad_empleado_udpate(?,?,?,?,?,?)", [
                $this->aemp_codigo,
                $this->aemp_cantidad_dias,
                $this->aemp_pago_dia,
                $this->aemp_total,
                $this->emp_cod,
                $this->act_cod
            ]);
            return $rs;
        }

        function activar($aemp_codigo) {
            $query = $this->db->query("CALL pa_actividad_empleado_activate('$aemp_codigo')");
            return $query;
        }

        function desactivar($aemp_codigo) {

            $query = $this->db->query("CALL pa_actividad_empleado_deactivate('$aemp_codigo')");
            return $query;
        }

        function borrar($aemp_codigo) {

            $query = $this->db->query("CALL pa_actividad_empleado_delete('$aemp_codigo')");
            return $query;
        }
    }
