DELIMITER $$
-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_getRow;

CREATE PROCEDURE pa_compra_getRow(
    IN _comp_cod int(11)
)
BEGIN
    SELECT comp_cod, prov.prov_cod, prov_razon_social, comp_fecha, comp_costo_total, comp_estado
    FROM compra comp
             INNER JOIN proveedor prov ON comp.prov_cod = prov.prov_cod
    WHERE comp.comp_cod = _comp_cod;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_getByID;

CREATE PROCEDURE pa_compra_getByID(
    IN _comp_cod int(11)
)
BEGIN
    SELECT comp_cod, prov.prov_cod, prov_razon_social, comp_fecha, comp_costo_total, comp_estado
    FROM compra comp
             INNER JOIN proveedor prov ON comp.prov_cod = prov.prov_cod
    WHERE comp.comp_cod = _comp_cod;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_getDetalle;

CREATE PROCEDURE pa_compra_getDetalle(
    IN _comp_cod int(11)
)
BEGIN
    SELECT com.comp_cod, pro.prod_cod, pro.prod_nombre_comercial,
           cdet_cantidad, cdet_total, cdet_importe
    FROM compra_detalle cdet
             INNER JOIN compra com ON cdet.comp_cod = com.comp_cod
             INNER JOIN producto pro ON cdet.prod_cod = pro.prod_cod
    WHERE com.comp_cod = _comp_cod;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_listCbo;

CREATE PROCEDURE pa_compra_listCbo(
    IN _comp_cod int(11)
)
BEGIN
    SELECT comp_cod, prov.prov_cod, prov_razon_social, comp_fecha, comp_costo_total, comp_estado
    FROM compra comp
             INNER JOIN proveedor prov ON comp.prov_cod = prov.prov_cod
    WHERE comp.comp_estado = 1
       OR (comp.comp_cod = _comp_cod);
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_list;

CREATE PROCEDURE pa_compra_list(IN _buscar varchar(50),
                                IN _comp_estado tinyint UNSIGNED)
BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT comp_cod, prov.prov_cod, prov_razon_social, comp_fecha, comp_costo_total, comp_estado
    FROM compra comp
             INNER JOIN proveedor prov ON comp.prov_cod = prov.prov_cod
    WHERE comp.comp_estado = _comp_estado;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_insert;

CREATE PROCEDURE pa_compra_insert(IN _prov_cod int(11),
                                  IN _comp_fecha date,
                                  IN _comp_costo_total double(8, 2),
                                  OUT _comp_cod int(11))
BEGIN
    INSERT INTO
        compra (prov_cod,
                comp_fecha,
                comp_costo_total,
                comp_estado)
    VALUES
    (_prov_cod,
     _comp_fecha,
     _comp_costo_total,
     1);
    SET _comp_cod = LAST_INSERT_ID();
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_update;

CREATE PROCEDURE pa_compra_update(IN _comp_cod int(11),
                                  IN _prov_cod int(11),
                                  IN _comp_fecha date,
                                  IN _comp_costo_total double(8, 2))
BEGIN
    UPDATE compra
    SET prov_cod         = _prov_cod,
        comp_fecha       = _comp_fecha,
        comp_costo_total = _comp_costo_total
    WHERE comp_cod = _comp_cod;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_activate;

CREATE PROCEDURE pa_compra_activate(
    IN _comp_cod int(11)
)
BEGIN
    UPDATE compra
    SET comp_estado = 1
    WHERE comp_cod = _comp_cod;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_deactivate;

CREATE PROCEDURE pa_compra_deactivate(
    IN _comp_cod int(11)
)
BEGIN
    UPDATE compra
    SET comp_estado = 2
    WHERE comp_cod = _comp_cod;
END $$

-- Tabla: compra
-- DROP PROCEDURE IF EXISTS pa_compra_delete;

CREATE PROCEDURE pa_compra_delete(
    IN _comp_cod int(11)
)
BEGIN
    UPDATE compra
    SET comp_estado = 0
    WHERE comp_cod = _comp_cod;
END $$

