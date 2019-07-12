<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Actividad_productos_model extends CI_Model
    {
        var $actpro_cod;
        var $act_cod;
        var $prod_cod;
        var $actpro_precio;
        var $actpro_cantidad;
        var $actpro_total;

        function getRow($actpro_cod) {
            $query  = $this->db->query("CALL pa_actividad_productos_getRow(?)", [$actpro_cod]);
            $result = $query->result();
            $this->db->next_result();
            return $result;

        }

        function getByID($actpro_cod) {
            $query  = $this->db->query("CALL pa_actividad_productos_getByID(?)", [$actpro_cod]);
            $result = $query->result();
            $this->db->next_result();
            return $result;

        }

        function listCbo($actpro_cod = 0) {
            $query  = $this->db->query("CALL pa_actividad_productos_listCbo(?)", [$actpro_cod]);
            $result = $query->result();
            $this->db->next_result();
            return $result;
        }

        function listar($buscar = '') {
            $query  = $this->db->query("CALL pa_actividad_productos_list(?)", [$buscar]);
            $result = $query->result();
            $this->db->next_result();
            return $result;
        }

        function insert() {
            $query = $this->db->query("CALL pa_actividad_productos_insert(?,?,?,?,?)", [
                $this->act_cod,
                $this->prod_cod,
                $this->actpro_precio,
                $this->actpro_cantidad,
                $this->actpro_total
            ]);

            if ($query) {
                $query      = $this->db->query("SELECT @actpro_cod as actpro_cod");
                $actpro_cod = $query->result_array()[0]['act_cod'];
                return $actpro_cod;
            } else {
                return 0;
            }
        }

        function update() {
            $query = $this->db->query("CALL pa_actividad_productos_update(?,?,?,?,?,?)", [
                $this->actpro_cod,
                $this->act_cod,
                $this->prod_cod,
                $this->actpro_precio,
                $this->actpro_cantidad,
                $this->actpro_total
            ]);
            return $query;
        }

        function activar($actpro_cod) {
            $query = $this->db->query("CALL pa_actividad_productos_activate(?)", [$actpro_cod]);
            return $query;
        }

        function desactivar($actpro_cod) {
            $query = $this->db->query("CALL pa_actividad_productos_deactivate(?)", [$actpro_cod]);
            return $query;
        }

        function borrar($actpro_cod) {
            $query = $this->db->query("CALL pa_actividad_productos_delete(?)", [$actpro_cod]);
            return $query;
        }
    }
