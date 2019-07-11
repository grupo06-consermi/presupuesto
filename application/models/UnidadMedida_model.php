<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class UnidadMedida_model extends CI_Model
    {
        public function fetch_all_state($state = 1, $buscar = '') {
            $query = $this->db->query("CALL pa_lista_unidades('%$buscar%', $state)");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }
    }