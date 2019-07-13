<?php defined('BASEPATH') OR exit('No direct script access allowed');

    class Cliente_model extends CI_Model
    {

        public function fetch_all($buscar = '') {
            $query = $this->db->query("CALL pa_listar_cliente('%$buscar%')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function listar($buscar = '') {
            $query = $this->db->query("CALL pa_cliente_list('$buscar', 1)");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function getByID($cli_id) {
            $query = $this->db->query("CALL pa_cliente_getByID('$cli_id')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs ? $rs[0] : null;
        }

        public function getId($id) {
            $query  = $this->db->query("CALL PA_cliente_x_Cod($id)");
            $result = $query->row();
            $query->next_result();
            $query->free_result();
            return $result;
        }

        public function update($id) {
            $nombre = $_POST['cli_razon_social'];
            $ruc    = $_POST['cli_ruc'];
            $dir    = $_POST['cli_direccion'];
            $tel    = $_POST['cli_telefono'];
            $mail   = $_POST['cli_email'];
            $result = $this->db->query("CALL PA_Actualizar_cliente('$id','$nombre', '$ruc', '$dir', '$tel', '$mail')");
            return $result ? true : false;
        }

        public function insert() {
            $nombre = $_POST['cli_razon_social'];
            $ruc    = $_POST['cli_ruc'];
            $dir    = $_POST['cli_direccion'];
            $tel    = $_POST['cli_telefono'];
            $mail   = $_POST['cli_email'];
            $result = $this->db->query("CALL PA_Registrar_cliente('$nombre', '$ruc', '$dir', '$tel', '$mail')");
            return $result ? true : false;
        }

        public function destroy($id) {
            $result = $this->db->query("CALL PA_Borrar_cliente('$id')");
            return $result ? true : false;
        }

    }
