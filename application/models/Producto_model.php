<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Producto_model extends CI_Model
    {

        public function fetch_all($buscar = '') {
            $query  = $this->db->query("CALL PA_Listar_producto() ");
            $result = $query->result();
            $query->next_result();
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
            $prod_cod              = $id;
            $prov_cod              = $_POST['prov_cod'];
            $cat_codigo            = $_POST['cat_codigo'];
            $mar_codigo            = $_POST['mar_codigo'];
            $prod_nombre_comercial = strtoupper($_POST['prod_descripcion']);
            $prod_precio_compra    = $_POST['prod_precio_compra'];
            $prod_precio_venta     = $_POST['prod_precio_venta'];
            $prod_stock            = $_POST['prod_stock'];
            $prod_stock_min        = $_POST['prod_stock_min'];
            $uni_codigo            = $_POST['uni_codigo'];
            $alm_codigo            = $_POST['alm_codigo'];

            $result = $this->db->query("CALL pa_producto_update( 
                        '$prod_cod',
                        '$prov_cod',
                        '$cat_codigo',
                        '$mar_codigo',
                        '$prod_nombre_comercial',
                        '$prod_precio_compra',
                        '$prod_precio_venta',
                        '$prod_stock',
                        '$prod_stock_min',                        
                        '$uni_codigo',
                        '$alm_codigo');");

            return $result ? true : false;
        }

        public function insert() {
            $prov_cod              = $_POST['prov_cod'];
            $cat_codigo            = $_POST['cat_codigo'];
            $mar_codigo            = $_POST['mar_codigo'];
            $prod_nombre_comercial = strtoupper($_POST['prod_descripcion']);
            $prod_precio_compra    = $_POST['prod_precio_compra'];
            $prod_precio_venta     = $_POST['prod_precio_venta'];
            $prod_stock            = $_POST['prod_stock'];
            $prod_stock_min        = $_POST['prod_stock_min'];
            $prod_stock_reponer    = 0; // $_POST['prod_stock_reponer']; // volatil
            $uni_codigo            = $_POST['uni_codigo'];
            $alm_codigo            = $_POST['alm_codigo'];

            $result = $this->db->query("CALL pa_producto_insert( 
                        '$prov_cod',
                        '$cat_codigo',
                        '$mar_codigo',
                        '$prod_nombre_comercial',
                        '$prod_precio_compra',
                        '$prod_precio_venta',
                        '$prod_stock',
                        '$prod_stock_min',
                        '$prod_stock_reponer',
                        '$uni_codigo',
                        '$alm_codigo', @prod_cod);");

            return $result ? true : false;
        }

        public function destroy($id) {
            $query = $this->db->query("CALL pa_borrar_producto('$id')");
            $query->free_result();
            return $query ? true : false;
        }

        public function getId($id) {
            $query  = $this->db->query("CALL pa_producto_getRow($id)");
            $result = $query->row();
            $query->next_result();
            $query->free_result();
            return $result;
        }
    }
