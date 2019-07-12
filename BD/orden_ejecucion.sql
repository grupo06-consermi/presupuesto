DELIMITER $$
-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_getRow;

CREATE PROCEDURE pa_orden_ejecucion_getRow(
	IN _ord_cod int(11)
)
BEGIN
	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_cod = _ord_cod;
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_getByID;

CREATE PROCEDURE pa_orden_ejecucion_getByID(
	IN _ord_cod int(11)
)
BEGIN
	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_cod = _ord_cod;
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_listCbo;

CREATE PROCEDURE pa_orden_ejecucion_listCbo(
	IN _ord_cod int(11)
)
BEGIN
	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_estado = 1 OR (ord.ord_cod = _ord_cod);
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_list;

CREATE PROCEDURE pa_orden_ejecucion_list(
	IN _buscar varchar(50),
	IN _ord_estado tinyint unsigned
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_estado = _ord_estado;
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_insert;

CREATE PROCEDURE pa_orden_ejecucion_insert(
	IN _ord_num_orden int(11),
	IN _ord_fecha date,
	IN _ord_odm int(11),
	IN _ord_emisor char(100),
	IN _pres_cod int(11),
	OUT _ord_cod int(11)
)
BEGIN
    SET _ord_fecha = if(_ord_fecha <> '0000-00-00 00:00:00', _ord_fecha, now());

	INSERT INTO orden_ejecucion (
		ord_num_orden,
		ord_fecha,
		ord_odm,
		ord_emisor,
		pres_cod,
		ord_estado
	)
	VALUES (
		_ord_num_orden,
		_ord_fecha,
		_ord_odm,
		_ord_emisor,
		_pres_cod,
		1
	);
	SET _ord_cod = LAST_INSERT_ID();
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_update;

CREATE PROCEDURE pa_orden_ejecucion_update(
	IN _ord_cod int(11),
	IN _ord_num_orden int(11),
	IN _ord_fecha date,
	IN _ord_odm int(11),
	IN _ord_emisor char(100),
	IN _pres_cod int(11)
)
BEGIN
	UPDATE orden_ejecucion
	SET ord_num_orden = _ord_num_orden,
		ord_fecha = _ord_fecha,
		ord_odm = _ord_odm,
		ord_emisor = _ord_emisor,
		pres_cod = _pres_cod
	WHERE ord_cod = _ord_cod;
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_activate;

CREATE PROCEDURE pa_orden_ejecucion_activate(
	IN _ord_cod int(11)
)
BEGIN
	UPDATE orden_ejecucion
	SET ord_estado = 1
	WHERE ord_cod = _ord_cod;
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_deactivate;

CREATE PROCEDURE pa_orden_ejecucion_deactivate(
	IN _ord_cod int(11)
)
BEGIN
	UPDATE orden_ejecucion
	SET ord_estado = 2
	WHERE ord_cod = _ord_cod;
END $$

-- Tabla: orden_ejecucion
-- DROP PROCEDURE IF EXISTS pa_orden_ejecucion_delete;

CREATE PROCEDURE pa_orden_ejecucion_delete(
	IN _ord_cod int(11)
)
BEGIN
	UPDATE orden_ejecucion
	SET ord_estado = 0
	WHERE ord_cod = _ord_cod;
END $$

