<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Conformidad_model extends CI_Model
    {

        public function fetch_all_state($buscar = '') {
            $query = $this->db->query("CALL pa_listar_conformidad('%$buscar%')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function getId($id) {
            $query  = $this->db->query("CALL Pa_conformidad_Por_Codigo($id)");
            $result = $query->row();
            $query->next_result();
            $query->free_result();
            return $result;
        }

        public function update($id) {

            $fech1 = $_POST['conf_fecha_inicio'];
            $fech2 = $_POST['conf_fecha_fin'];
            $est   = $_POST['conf_estado'];
            $conf  = $_POST['conf_act_conformidad'];
            $pres  = $_POST['pres_cod'];

            $result = $this->db->query("CALL Pa_Actualizar_conformidad('$id', '$fech1', '$fech2', '$est', '$conf', '$pres')");
            return $result ? true : false;
        }

        public function insert() {

            $fech1    = $_POST['conf_fecha_inicio'];
            $fech2    = $_POST['conf_fecha_fin'];
            $est      = $_POST['conf_estado'];
            $conf     = $_POST['conf_act_conformidad'];
            $pres_cod = $_POST['pres_cod'];

            $result = $this->db->query("CALL PA_Registrar_conformidad('$fech1', '$fech2', '$est', '$conf', '$pres_cod')");

            $PRES_TERMINADO = PRES_TERMINADO;

            $this->db->query("
                UPDATE presupuesto
                SET pres_situacion = '$PRES_TERMINADO'
                WHERE pres_cod = '$pres_cod';            
            ");

            return $result ? true : false;

        }

        public function destroy($id) {
            $result = $this->db->query("CALL PA_Borrar_almacen('$id')");
            return $result ? true : false;
        }

    }