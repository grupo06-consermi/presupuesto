DELIMITER $$
-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_getRow;

CREATE PROCEDURE pa_detalle_presupuesto_getRow(
	IN _pre_cod int(11),
	IN _pro_cod int(11)
)
BEGIN
	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod
	WHERE dpre.pre_cod = _pre_cod
		AND dpre.pro_cod = _pro_cod;
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_getByID;

CREATE PROCEDURE pa_detalle_presupuesto_getByID(
	IN _pre_cod int(11),
	IN _pro_cod int(11)
)
BEGIN
	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod
	WHERE dpre.pre_cod = _pre_cod
		AND dpre.pro_cod = _pro_cod;
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_listCbo;

CREATE PROCEDURE pa_detalle_presupuesto_listCbo(
	IN _pre_cod int(11),
	IN _pro_cod int(11)
)
BEGIN
	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod;
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_list;

CREATE PROCEDURE pa_detalle_presupuesto_list(
	IN _buscar varchar(50) 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod;
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_insert;

CREATE PROCEDURE pa_detalle_presupuesto_insert(
	IN _pre_cod int(11),
	IN _pro_cod int(11),
	IN _dpre_cantidad decimal(8, 2),
	IN _dpre_precio decimal(8, 2)
)
BEGIN
	INSERT INTO detalle_presupuesto (
		pre_cod,
		pro_cod,
		dpre_cantidad,
		dpre_precio
	)
	VALUES (
		_pre_cod,
		_pro_cod,
		_dpre_cantidad,
		_dpre_precio
	);
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_update;

CREATE PROCEDURE pa_detalle_presupuesto_update(
	IN _pre_cod int(11),
	IN _pro_cod int(11),
	IN _dpre_cantidad decimal(8, 2),
	IN _dpre_precio decimal(8, 2)
)
BEGIN
	UPDATE detalle_presupuesto
	SET pre_cod = _pre_cod,
		pro_cod = _pro_cod,
		dpre_cantidad = _dpre_cantidad,
		dpre_precio = _dpre_precio
	WHERE pre_cod = _pre_cod
	  AND pro_cod = _pro_cod;
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_activate;

CREATE PROCEDURE pa_detalle_presupuesto_activate(
	IN _pre_cod int(11),
	IN _pro_cod int(11)
)
BEGIN
	-- detalle_presupuesto no tiene columna estado
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_deactivate;

CREATE PROCEDURE pa_detalle_presupuesto_deactivate(
	IN _pre_cod int(11),
	IN _pro_cod int(11)
)
BEGIN
	-- detalle_presupuesto no tiene columna estado
END $$

-- Tabla: detalle_presupuesto
-- DROP PROCEDURE IF EXISTS pa_detalle_presupuesto_delete;

CREATE PROCEDURE pa_detalle_presupuesto_delete(
	IN _pre_cod int(11),
	IN _pro_cod int(11)
)
BEGIN
	-- detalle_presupuesto no tiene columna estado
END $$

