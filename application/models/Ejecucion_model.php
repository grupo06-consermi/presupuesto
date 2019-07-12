<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Ejecucion_model extends CI_Model
    {

        public function fetch_all_state($buscar = '') {
            $query = $this->db->query("CALL Pa_listar_ejecucion('%$buscar%')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function getId($id) {
            $query  = $this->db->query("CALL PA_orden_ejecucion_x_Cod($id)");
            $result = $query->row();
            $query->next_result();
            $query->free_result();
            return $result;
        }

        public function update($id) {

            $num    = $_POST['ord_num_orden'];
            $fecha  = $_POST['ord_fecha'];
            $odm    = $_POST['ord_odm'];
            $emisor = $_POST['ord_emisor'];
            $pres   = $_POST['pres_cod'];
            $estado = $_POST['ord_estado'];
            $result = $this->db->query("CALL PA_Actualizar_orden_ejecucion('$id','$num', '$fecha', '$odm', '$emisor', '$pres ', '$estado ')");
            return $result ? true : false;
        }

        public function insert() {
            $rs = $this->db->query("CALL pa_orden_ejecucion_insert(?,?,?,?,?,@ord_cod)", [
                $_POST['ord_num_orden'],
                "0000-00-00 00:00:00",
                $_POST['ord_odm'],
                $_POST['ord_emisor'],
                $_POST['pres_cod']
            ]);
            if ($rs) {
                $query   = $this->db->query("SELECT @ord_cod as ord_cod");
                $ord_cod = $query->result_array()[0]['ord_cod'];
                return $ord_cod;
            } else {
                return 0;
            }

            /*foreach ($this->prod_list as $d) {
               // descontar stock e indicar reposicion
               $rs = $this->db->query("
                       UPDATE producto
                       SET prod_stock = if(prod_stock - $d[cantidad] >= 0, prod_stock - $d[cantidad], 0),
                           prod_stock_reponer = if(prod_stock - $d[cantidad] < 0, $d[cantidad] - prod_stock, 0)
                       WHERE prod_cod = $d[codigo];
               ");
           }*/
        }

        public function destroy($id) {
            $result = $this->db->query("CALL PA_Borrar_orden_ejecucion('$id')");
            return $result ? true : false;
        }

    }