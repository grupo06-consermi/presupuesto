<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Proveedor_model extends CI_Model {

    
    public function fetch_all($buscar = '') {
        $query = $this->db->query("CALL Pa_listar_proveedor('%$buscar%')");
        $rs = $query->result();
        $query->next_result();
        $query->free_result();
        return $rs;
    }

    
    
    public function getId($id) {
        $query = $this->db->query("CALL Pa_proveedor_x_Cod($id)");
        $result = $query->row();
        $query->next_result();
        $query->free_result();
        return $result;
    }

    public function update($id) {
        $nomb =  $_POST['prov_razon_social'];
        $ruc =  $_POST['prov_ruc'];
        $dir =  $_POST['prov_direccion'];
        $tel =  $_POST['prov_telefono'];
        $mail =  $_POST['prov_email'];
        $result = $this->db->query("CALL PA_Actualizar_proveedor('$id','$nomb', '$ruc', '$dir', '$tel', '$mail')");
        return $result ? true : false;
    }

    public function insert() {
        $nomb =  $_POST['prov_razon_social'];
        $ruc =  $_POST['prov_ruc'];
        $dir =  $_POST['prov_direccion'];
        $tel =  $_POST['prov_telefono'];
        $mail =  $_POST['prov_email'];
        $result = $this->db->query("CALL PA_Registrar_proveedor('$nomb', '$ruc', '$dir', '$tel', '$mail')");
        return $result ? true : false;
    }

    public function destroy($id) {
        $result = $this->db->query("CALL PA_Borrar_proveedor('$id')");
        return $result ? true : false;
    }

}
