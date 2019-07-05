<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ejecucion_model extends CI_Model {

    public function fetch_all_state($buscar = '') {
        $query = $this->db->query("CALL Pa_listar_ejecucion('%$buscar%')");
        $rs = $query->result();
        $query->next_result();
        $query->free_result();
        return $rs;
    }
    

    public function getId($id) {
        $query = $this->db->query("CALL PA_almacen_x_Cod($id)");
        $result = $query->row();
        $query->next_result();
        $query->free_result();
        return $result;
    }

    public function update($id) {

        $nombre = $_POST['alm_nombre'];
        $direccion =  $_POST['alm_direccion'];
        $result = $this->db->query("CALL PA_Actualizar_almacen('$id', '$nombre', '$direccion')");
        return $result ? true : false;
    }

    public function insert() {
        $nombre =  $_POST['alm_nombre'];
        $direccion =  $_POST['alm_direccion'];
        
        $result = $this->db->query("CALL PA_Registrar_almacen('$nombre', '$direccion')");
        return $result ? true : false;
    }

    public function destroy($id) {
        $result = $this->db->query("CALL PA_Borrar_almacen('$id')");
        return $result ? true : false;
    }

   

}