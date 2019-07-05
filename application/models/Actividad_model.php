<?php

    class Actividad_model extends CI_Model
    {
        var $act_cod;
        var $act_descripcion;
        var $act_costo_total;
        var $pres_cod;

        function getRow($act_cod) {

            $query  = $this->db->query("CALL pa_actividad_getRow(?)", [$act_cod]);
            $result = $query->result_array();
            $this->db->next_result();
            return $result;
        }

        function getByID($act_cod) {

            $query  = $this->db->query("CALL pa_actividad_getByID(?)", [$act_cod]);
            $result = $query->result_array();
            $this->db->next_result();
            return $result;
        }

        function listCbo($act_cod = 0) {

            $query  = $this->db->query("CALL pa_actividad_listCbo(?)", [$act_cod]);
            $result = $query->result_array();
            $this->db->next_result();
            return $result;
        }

        function listar($buscar = '') {
            $query  = $this->db->query("CALL pa_actividad_list(?)", [$buscar]);
            $result = $query->result_array();
            $this->db->next_result();
            return $result;
        }

        function insert() {
            $query = $this->db->query("CALL pa_actividad_insert(?,?,?,@act_cod)", [
                $this->act_descripcion,
                $this->act_costo_total,
                $this->pres_cod
            ]);

            if ($query) {
                $query   = $this->db->query("SELECT @act_cod as act_cod");
                $act_cod = $query->result_array()[0]['act_cod'];
                return $act_cod;
            } else {
                return 0;
            }
        }

        function update() {

            $query = $this->db->query("CALL pa_actividad_update(?,?,?,?)", [
                $this->act_cod,
                $this->act_descripcion,
                $this->act_costo_total,
                $this->pres_cod
            ]);
            return $query;
        }

        function activar($act_cod) {

            $query = $this->db->query("CALL pa_actividad_activate(?)", [$act_cod]);
            return $query;
        }

        function desactivar($act_cod) {

            $query = $this->db->query("CALL pa_actividad_deactivate(?)", [$act_cod]);
            return $query;
        }

        function borrar($act_cod) {

            $query = $this->db->query("CALL pa_actividad_delete(?)", [$act_cod]);
            return $query;
        }
    }