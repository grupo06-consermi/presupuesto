<?php defined('BASEPATH') OR exit('No direct script access allowed');

    class Empleado_model extends CI_Model
    {
        public function fetch_all($buscar = '') {
            $query = $this->db->query("CALL Pa_Listar_empleado('%$buscar%')");
            $rs    = $query->result();
            $query->next_result();
            $query->free_result();
            return $rs;
        }

        public function getId($id) {
            $query  = $this->db->query("CALL PA_empleado_Por_Codigo($id)");
            $result = $query->row();
            $query->next_result();
            $query->free_result();
            return $result;
        }

        public function insert() {

            $nombre = $_POST['emp_nombre'];
            $pat    = $_POST['emp_ape_pat'];
            $mat    = $_POST['emp_ape_mat'];
            $dir    = $_POST['emp_direccion'];
            $tel    = $_POST['emp_telefono'];
            $initr  = $_POST['emp_fecha_inicio_trabajo'];
            $sex    = $_POST['emp_sexo'];
            $tdoc   = $_POST['tdoc_cod'];
            $ndoc   = $_POST['emp_numero_doc'];
            $mail   = $_POST['emp_correo'];

            $result = $this->db->query("CALL PA_Registrar_empleado('$nombre', '$pat','$mat', '$dir', '$tel', '$initr','$sex','$tdoc','$ndoc','$mail')");
            return $result ? true : false;
        }

        public function update($id) {

            $nombre = $_POST['emp_nombre'];
            $pat    = $_POST['emp_ape_pat'];
            $mat    = $_POST['emp_ape_mat'];
            $dir    = $_POST['emp_direccion'];
            $tel    = $_POST['emp_telefono'];
            $fntr   = $_POST['emp_fecha_fin_trabajo'];
            $estado = $_POST['emp_estado'];
            $sex    = $_POST['emp_sexo'];
            $tdoc   = $_POST['tdoc_cod'];
            $ndoc   = $_POST['emp_numero_doc'];
            $mail   = $_POST['emp_correo'];

            $result = $this->db->query("CALL PA_Actualizar_empleado('$id','$nombre', '$pat','$mat', '$dir', '$tel', '$fntr','$estado','$sex','$tdoc','$ndoc','$mail')");
            return $result ? true : false;
        }

        public function destroy($id) {
            $result = $this->db->query("CALL PA_Borrar_empleado('$id')");
            return $result ? true : false;
        }

    }
