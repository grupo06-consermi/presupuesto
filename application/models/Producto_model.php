<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Producto_model extends CI_Model
    {

        public function fetch_all($buscar = '') {
            $query  = $this->db->query("CALL PA_Listar_producto() ");
            $result = $query->result();
            $query->free_result();
            return $result;
        }

        public function fetch_all_state() {
            $query  = $this->db->query("CALL PA_Listar_producto()");
            $result = $query->result();
            $query->next_result();
            $query->free_result();
            return $result;
        }

        public function update($id) {
            $cat     = $_POST['cat_codigo'];
            $marca   = $_POST['mar_codigo'];
            $unidad  = $_POST['uni_codigo'];
            $nom     = $_POST['prod_descripcion'];
            $pc      = $_POST['prod_precio_compra'];
            $pv      = $_POST['prod_precio_venta'];
            $cant    = $_POST['prod_cant'];
            $almacen = $_POST['alm_codigo'];
            $result  = $this->db->query("CALL pa_producto_actualizar('$id', '$nom', '$marca', '$cat', '$unidad', '$almacen', '$pc', '$pv','$cant', 1)");
            return $result ? true : false;
        }

        public function insert() {
            $categoria = $_POST['cat_codigo'];
            $marca     = $_POST['mar_codigo'];
            $unidad    = $_POST['uni_codigo'];
            $nombre    = $_POST['prod_descripcion'];
            $almacen   = $_POST['alm_codigo'];
            $pc        = $_POST['prod_precio_compra'];
            $pv        = $_POST['prod_precio_venta'];
            $cant      = $_POST['prod_cant'];
            $nombre    = strtoupper($nombre);
            $result    = $this->db->query("CALL PA_Registrar_producto('$nombre', '$pc', '$pv','$cant', '$marca', '$categoria', '$unidad', '$almacen', 1)");
            return $result ? true : false;
        }

        public function destroy($id) {
            $query = $this->db->query("CALL pa_borrar_producto('$id')");
            $query->free_result();
            return $query ? true : false;
        }

        public function getId($id) {
            $query  = $this->db->query("CALL PA_producto_x_Cod($id)");
            $result = $query->row();
            $query->next_result();
            $query->free_result();
            return $result;
        }
    }
