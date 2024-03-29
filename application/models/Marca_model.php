<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Marca_model extends CI_Model {

    
    public function fetch_all($buscar = '') {
        $query = $this->db->query("CALL PA_Listar_marca('%$buscar%')");
        $rs = $query->result();
        $query->next_result();
        $query->free_result();
        return $rs;
    }


    
    public function fetch_all_state($state= 1, $search ='') {
        $query = $this->db->query("CALL pa_listar_marca_estado(1, '%$search%')");
        $result = $query->result();
        $query->next_result();
        $query->free_result();
        return $result;
    }

    
    public function getId($id) {
        $query = $this->db->query("CALL PA_marca_x_Cod($id)");
        $result = $query->row();
        $query->next_result();
        $query->free_result();
        return $result;
    }

    public function update($id) {
        $nombre = $_POST['mar_nombre'];
        $estado =  $_POST['mar_estado'];
        $result = $this->db->query("CALL PA_Actualizar_marca('$id', '$nombre', '$estado')");
        return $result ? true : false;
    }

    public function insert() {
        $nombre =  $_POST['mar_nombre'];
        $estado =  $_POST['mar_estado'];
        $result = $this->db->query("CALL PA_Registrar_marca('$nombre', '$estado')");
        return $result ? true : false;
    }

    public function destroy($id) {
        $result = $this->db->query("CALL PA_Borrar_marca('$id')");
        return $result ? true : false;
    }

}
