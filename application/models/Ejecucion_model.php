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
            $pres_cod = $_POST['pres_cod'];

            $rs = $this->db->query("CALL pa_orden_ejecucion_insert(?,?,?,?,?,@ord_cod)", [
                $_POST['ord_num_orden'],
                "0000-00-00 00:00:00",
                $_POST['ord_odm'],
                $_POST['ord_emisor'],
                $pres_cod
            ]);

            $query   = $this->db->query("SELECT * FROM actividad WHERE pres_cod = '$pres_cod'");
            $result  = $query->result()[0];
            $act_cod = $result->act_cod;

            $this->db->query("
                 INSERT INTO actividad_productos (
                    act_cod,
                    prod_cod,
                    actpro_precio,
                    actpro_cant_presup,
                    actpro_cant_usado,
                    actpro_total
                ) 
                SELECT $act_cod, pro_cod, dpre_precio, dpre_cantidad, if(prod_stock > dpre_cantidad, dpre_cantidad, dpre_cantidad - prod_stock), dpre_precio * dpre_cantidad
                FROM detalle_presupuesto
                    INNER JOIN producto p ON detalle_presupuesto.pro_cod = p.prod_cod
                WHERE pre_cod = $pres_cod;
            ");

            /*foreach ($this->prod_list as $d) {
             // descontar stock e indicar reposicion
             $rs = $this->db->query("
                     UPDATE producto
                     SET prod_stock = if(prod_stock - $d[cantidad] >= 0, prod_stock - $d[cantidad], 0),
                         prod_stock_reponer = if(prod_stock - $d[cantidad] < 0, $d[cantidad] - prod_stock, 0)
                     WHERE prod_cod = $d[codigo];
             ");
         }*/

            if ($rs) {
                $query   = $this->db->query("SELECT @ord_cod as ord_cod");
                $ord_cod = $query->result_array()[0]['ord_cod'];
                return $ord_cod;
            } else {
                return 0;
            }
        }

        public function destroy($id) {
            $result = $this->db->query("CALL PA_Borrar_orden_ejecucion('$id')");
            return $result ? true : false;
        }

    }