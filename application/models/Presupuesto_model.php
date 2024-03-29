<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Presupuesto_model extends CI_Model {
		var $pres_cod;
		var $pres_descripcion;
		var $pres_fecha_emision;
		var $pres_fecha_recepcion;
		var $pres_forma_pago;
		var $pres_lugar_trabajo;
		var $pres_estado;
		var $pres_costo_mano_obra;
		var $pres_costo_materiales;
		var $pres_costo_total;
		var $cli_codigo;
		var $pres_encargado;
		var $prod_list;
		var $emp_list;
		
		public function getByID($pres_cod) {
			$query  = $this->db->query("CALL pa_presupuesto_getByID(?)", [$pres_cod]);
			$result = $query->result();
			$this->db->next_result();
			return $result[0];
		}
		
		public function getDetalles($pres_id = '') {
			$query = $this->db->query("CALL pa_presupuesto_getDetalles('$pres_id')");
			$rs    = $query->result();
			$query->next_result();
			$query->free_result();
			return $rs;
		}
		
		public function getManoObra($pres_id) {
			$query = $this->db->query("CALL pa_presupuesto_getManoObra('$pres_id');");
			$rs    = $query->result();
			$query->next_result();
			$query->free_result();
			return $rs;
		}
		
		public function reportar($buscar = '') {
			$query = $this->db->query("CALL pa_presupuesto_reporte('$buscar')");
			$rs    = $query->result();
			$query->next_result();
			$query->free_result();
			return $rs;
		}
		
		public function listar($buscar = '') {
			$query = $this->db->query("CALL pa_presupuesto_list('$buscar', 1)");
			$rs    = $query->result();
			$query->next_result();
			$query->free_result();
			return $rs;
		}
		
		public function reporteBySituacion($anio, $cliente) {
			$query = $this->db->query("CALL pa_presupuesto_reportbySituacion('$anio', '$cliente')");
			$rs    = $query->result();
			$query->next_result();
			$query->free_result();
			return $rs;
		}
		
		public function reportCostoByMes($anio, $cliente) {
			$query = $this->db->query("CALL pa_presupuesto_CostoByMes('$anio', '$cliente')");
			$rs    = $query->result();
			$query->next_result();
			$query->free_result();
			return $rs;
		}
		
		public function insertar() {
			$rs       = $this->db->query("CALL pa_presupuesto_insert(?,?,?,?,?,?,?,?,@pres_cod)", [$this->cli_codigo,
			                                                                                       $this->pres_descripcion,
			                                                                                       $this->pres_lugar_trabajo,
			                                                                                       $this->pres_costo_mano_obra,
			                                                                                       $this->pres_costo_materiales,
			                                                                                       $this->pres_costo_total,
			                                                                                       $this->pres_forma_pago,
			                                                                                       $this->pres_encargado]);
			$query    = $this->db->query("SELECT @pres_cod as pres_cod");
			$pres_cod = $query->result_array()[0]['pres_cod'];
			
			foreach ($this->prod_list as $d) {
				$rs = $rs && $this->db->query('CALL pa_detalle_presupuesto_insert(?,?,?,?)', [$pres_cod, $d['codigo'],
				                                                                              $d['cantidad'],
				                                                                              $d['precio']]);
			}
			$query = $this->db->query("
                UPDATE presupuesto p, (                      
                    SELECT ifnull(count(pres_cod), 1) as conteo 
                    FROM presupuesto
                    WHERE year(pres_fecha_emision) = year(now())
                ) as p2                   
                SET pres_numero = CONCAT(YEAR(NOW()), '-', lpad( conteo, 5, '0') )
                WHERE pres_cod = '$pres_cod';
            ");
			
			$query   = $this->db->query("CALL pa_actividad_insert(?,?,?,?,?,@act_cod)", [$pres_cod, "Mano de obra",
			                                                                             '0000-00-00 00:00:00',
			                                                                             '0000-00-00 00:00:00',
			                                                                             $this->pres_costo_mano_obra]);
			$query   = $this->db->query("SELECT @act_cod as act_cod");
			$act_cod = $query->result_array()[0]['act_cod'];
			
			foreach ($this->emp_list as $d) {
				$rs = $this->db->query("CALL pa_actividad_empleado_insert(?,?,?,?,?)", [$act_cod, $d['emp_codigo'],
				                                                                        $d['pago_dia'], $d['tiempo'],
				                                                                        $d['importe'],]);
			}
			return $pres_cod;
		}
		
		public function actualizar() {
			
			$rs = $this->db->query("CALL pa_presupuesto_update(?,?,?,?,?,?,?,?,?)", [$this->pres_cod, $this->cli_codigo,
			                                                                         $this->pres_descripcion,
			                                                                         $this->pres_lugar_trabajo,
			                                                                         $this->pres_costo_mano_obra,
			                                                                         $this->pres_costo_materiales,
			                                                                         $this->pres_costo_total,
			                                                                         $this->pres_forma_pago,
			                                                                         $this->pres_encargado]);
			
			// eliminar detalle
			$rs = $this->db->query("DELETE FROM detalle_presupuesto WHERE pre_cod = '$this->pres_cod';");
			
			// volver a crear
			foreach ($this->prod_list as $d) {
				$rs = $rs && $this->db->query('CALL pa_detalle_presupuesto_insert(?,?,?,?)', [$this->pres_cod,
				                                                                              $d['codigo'],
				                                                                              $d['cantidad'],
				                                                                              $d['precio']]);
			}
			
			$query   = $this->db->query("SELECT act_cod FROM actividad WHERE pres_cod = '$this->pres_cod';");
			$act_cod = $query->result_array()[0]['act_cod'];
			
			// eliminar detalle
			$rs = $this->db->query("DELETE FROM actividad_empleado WHERE act_cod = '$act_cod';");
			
			foreach ($this->emp_list as $d) {
				$rs = $rs && $this->db->query("CALL pa_actividad_empleado_insert(?,?,?,?,?)", [$act_cod,
				                                                                               $d['emp_codigo'],
				                                                                               $d['pago_dia'],
				                                                                               $d['tiempo'],
				                                                                               $d['importe'],]);
			}
			
			if ($rs) {
				return 1;
			} else {
				return 0;
			}
		}
		
		function borrar($pres_id) {
			$rs = $this->db->query("
                UPDATE presupuesto 
                SET pres_estado = 0
                WHERE pres_cod = '$pres_id';
            ");
			return $rs ? 1 : 0;
		}
		
		function setAsAceptado($pres_id) {
			$PRES_ACEPTADO = PRES_ACEPTADO;
			$rs            = $this->db->query("
                UPDATE presupuesto 
                SET pres_situacion = '$PRES_ACEPTADO', 
                    pres_fecha_recepcion = now() 
                WHERE pres_cod = '$pres_id';
            ");
			return $rs ? 1 : 0;
		}
		
		function setAsRechazado($pres_id) {
			
			$PRES_ANULADO = PRES_ANULADO;
			
			$rs = $this->db->query("
                UPDATE presupuesto 
                SET pres_situacion = '$PRES_ANULADO'
                WHERE pres_cod = '$pres_id';
            ");
			
			return $rs ? 1 : 0;
		}
	}