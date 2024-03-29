<?php

    class CompraModel extends CI_Model
    {
        var $comp_cod;
        var $comp_fecha;
        var $comp_costo_total;
        var $comp_estado;
        var $prov_cod;
        var $detalles = [];

        public function getByID($comp_cod) {
            $query  = $this->db->query("CALL pa_compra_getByID(?)", [$comp_cod]);
            $result = $query->result_array();
            $this->db->next_result();
            return $result[0];
        }

        public function getDetalles($comp_cod) {
            $query  = $this->db->query("CALL pa_compra_getDetalle($comp_cod)", ["$comp_cod"]);
            $result = $query->result();
            $this->db->next_result();
            return $result;
        }

        public function listar($buscar = '') {
            $query  = $this->db->query("CALL pa_compra_list(?,?)", ["$buscar", 1]);
            $result = $query->result();
            $this->db->next_result();
            return $result;
        }

        public function insertar() {
            $result = $this->db->query("CALL pa_compra_insert(?,?,?,@comp_cod)", [
                $this->prov_cod,
                $this->comp_fecha,
                $this->comp_costo_total
            ]);

            $query    = $this->db->query("SELECT @comp_cod as comp_cod");
            $comp_cod = $query->result_array()[0]['comp_cod'];

            foreach ($this->detalles as $cdet) {
                $result = $this->db->query('CALL pa_compra_detalle_insert(?,?,?,?,?)', [
                    $comp_cod,
                    $cdet['codigo'],
                    $cdet['cantidad'],
                    $cdet['precio'],
                    $cdet['total']
                ]);
            }

            // actualizar stock de producto
            $result = $this->db->query("
                UPDATE producto prod,
                    (SELECT * FROM compra_detalle cd 
                     WHERE cd.comp_cod = '$comp_cod') cd
                SET prod.prod_stock = prod.prod_stock + cd.cdet_cantidad
                WHERE prod.prod_cod = cd.prod_cod;

             ");

            return $comp_cod;
        }

        public function getProductosFaltantes() {
            $query  = $this->db->query("
                SELECT prod.prod_cod, prod_nombre_comercial,
                       avg(prod.prod_precio_compra) AS prod_precio_compra,                       
                       sum(actpro_cant_presup) AS actpro_cant_presup,               
                       sum(actpro_cant_usado) AS actpro_cant_usado,             
                       sum(actpro_cant_presup - actpro_cant_usado) - prod_stock_reponer AS cant_pedir                
                FROM actividad_productos actpro
                    INNER JOIN producto prod ON actpro.prod_cod = prod.prod_cod
                    INNER JOIN actividad act ON actpro.act_cod = act.act_cod
                WHERE actpro_cant_presup - actpro_cant_usado > 0
                GROUP BY prod.prod_cod, prod_nombre_comercial ;   
            ");
            $result = $query->result();
            // $this->db->next_result();
            return $result;
        }

        public function update() {
            $result = $this->db->query("CALL pa_compra_update(?,?,?,?,?)",
                [$this->comp_cod,
                 $this->comp_fecha,
                 $this->comp_costo_total,
                 $this->prov_cod]);
            return $result ? 1 : 0;
        }

        public function borrar($comp_cod) {
            $query = $this->db->query("CALL pa_compra_delete(?);", $comp_cod);
            return $query;
        }

        public function activar($comp_cod) {
            $query = $this->db->query("CALL pa_compra_activate(?);", $comp_cod);
            return $query;
        }
    }
