DELIMITER $$
-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_getRow;

CREATE PROCEDURE pa_compra_detalle_getRow(
    IN _comp_cod int(11),
    IN _prod_cod int(11)
)
BEGIN
    SELECT com.comp_cod, pro.prod_cod, cdet_cantidad, cdet_total, cdet_importe
    FROM compra_detalle cdet
             INNER JOIN compra com ON cdet.comp_cod = com.comp_cod
             INNER JOIN producto pro ON cdet.prod_cod = pro.prod_cod
    WHERE cdet.comp_cod = _comp_cod
      AND cdet.prod_cod = _prod_cod;
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_getByID;

CREATE PROCEDURE pa_compra_detalle_getByID(
    IN _comp_cod int(11),
    IN _prod_cod int(11)
)
BEGIN
    SELECT com.comp_cod, pro.prod_cod, cdet_cantidad, cdet_total, cdet_importe
    FROM compra_detalle cdet
             INNER JOIN compra com ON cdet.comp_cod = com.comp_cod
             INNER JOIN producto pro ON cdet.prod_cod = pro.prod_cod
    WHERE cdet.comp_cod = _comp_cod
      AND cdet.prod_cod = _prod_cod;
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_listCbo;

CREATE PROCEDURE pa_compra_detalle_listCbo(
    IN _comp_cod int(11),
    IN _prod_cod int(11)
)
BEGIN
    SELECT com.comp_cod, pro.prod_cod, cdet_cantidad, cdet_total, cdet_importe
    FROM compra_detalle cdet
             INNER JOIN compra com ON cdet.comp_cod = com.comp_cod
             INNER JOIN producto pro ON cdet.prod_cod = pro.prod_cod;
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_list;

CREATE PROCEDURE pa_compra_detalle_list(
    IN _buscar varchar(50)
)
BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT com.comp_cod, pro.prod_cod, cdet_cantidad, cdet_total, cdet_importe
    FROM compra_detalle cdet
             INNER JOIN compra com ON cdet.comp_cod = com.comp_cod
             INNER JOIN producto pro ON cdet.prod_cod = pro.prod_cod;
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_insert;

CREATE PROCEDURE pa_compra_detalle_insert(
    IN _comp_cod int(11),
    IN _prod_cod int(11),
    IN _cdet_cantidad int(11),
    IN _cdet_total double(8, 2),
    IN _cdet_importe double(8, 2)
)
BEGIN
    INSERT INTO compra_detalle (
        comp_cod,
        prod_cod,
        cdet_cantidad,
        cdet_total,
        cdet_importe
    )
    VALUES (
               _comp_cod,
               _prod_cod,
               _cdet_cantidad,
               _cdet_total,
               _cdet_importe
           );
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_update;

CREATE PROCEDURE pa_compra_detalle_update(
    IN _comp_cod int(11),
    IN _prod_cod int(11),
    IN _cdet_cantidad int(11),
    IN _cdet_total double(8, 2),
    IN _cdet_importe double(8, 2)
)
BEGIN
    UPDATE compra_detalle
    SET comp_cod = _comp_cod,
        prod_cod = _prod_cod,
        cdet_cantidad = _cdet_cantidad,
        cdet_total = _cdet_total,
        cdet_importe = _cdet_importe
    WHERE comp_cod = _comp_cod
      AND prod_cod = _prod_cod;
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_activate;

CREATE PROCEDURE pa_compra_detalle_activate(
    IN _comp_cod int(11),
    IN _prod_cod int(11)
)
BEGIN
    -- compra_detalle no tiene columna estado
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_deactivate;

CREATE PROCEDURE pa_compra_detalle_deactivate(
    IN _comp_cod int(11),
    IN _prod_cod int(11)
)
BEGIN
    -- compra_detalle no tiene columna estado
END $$

-- Tabla: compra_detalle
DROP PROCEDURE IF EXISTS pa_compra_detalle_delete;

CREATE PROCEDURE pa_compra_detalle_delete(
    IN _comp_cod int(11),
    IN _prod_cod int(11)
)
BEGIN
    -- compra_detalle no tiene columna estado
END $$

