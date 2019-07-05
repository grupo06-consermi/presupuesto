DELIMITER $$
-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_getRow;

CREATE PROCEDURE pa_actividad_getRow(
	IN _act_cod int(11)
)
BEGIN
	SELECT act_cod, act_descripcion, act_costo_total, pre.pres_cod
	FROM actividad act
		LEFT JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
	WHERE act.act_cod = _act_cod;
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_getByID;

CREATE PROCEDURE pa_actividad_getByID(
	IN _act_cod int(11)
)
BEGIN
	SELECT act_cod, act_descripcion, act_costo_total, pre.pres_cod
	FROM actividad act
		LEFT JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
	WHERE act.act_cod = _act_cod;
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_listCbo;

CREATE PROCEDURE pa_actividad_listCbo(
	IN _act_cod int(11)
)
BEGIN
	SELECT act_cod, act_descripcion, act_costo_total, pre.pres_cod
	FROM actividad act
		LEFT JOIN presupuesto pre ON act.pres_cod = pre.pres_cod;
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_list;

CREATE PROCEDURE pa_actividad_list(
	IN _buscar varchar(50) 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT act_cod, act_descripcion, act_costo_total, pre.pres_cod
	FROM actividad act
		LEFT JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
	WHERE (act.act_descripcion LIKE _buscar);
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_insert;

CREATE PROCEDURE pa_actividad_insert(
	IN _act_descripcion varchar(100),
	IN _act_costo_total decimal(8, 2),
	IN _pres_cod int(11),
	OUT _act_cod int(11)
)
BEGIN
	SET _pres_cod = IF(_pres_cod  = 0, NULL, _pres_cod);

	INSERT INTO actividad (
		act_descripcion,
		act_costo_total,
		pres_cod
	)
	VALUES (
		_act_descripcion,
		_act_costo_total,
		_pres_cod
	);
	SET _act_cod = LAST_INSERT_ID();
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_update;

CREATE PROCEDURE pa_actividad_update(
	IN _act_cod int(11),
	IN _act_descripcion varchar(100),
	IN _act_costo_total decimal(8, 2),
	IN _pres_cod int(11)
)
BEGIN
	SET _pres_cod = IF(_pres_cod  = 0, NULL, _pres_cod);

	UPDATE actividad
	SET act_descripcion = _act_descripcion,
		act_costo_total = _act_costo_total,
		pres_cod = _pres_cod
	WHERE act_cod = _act_cod;
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_activate;

CREATE PROCEDURE pa_actividad_activate(
	IN _act_cod int(11)
)
BEGIN
	-- actividad no tiene columna estado
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_deactivate;

CREATE PROCEDURE pa_actividad_deactivate(
	IN _act_cod int(11)
)
BEGIN
	-- actividad no tiene columna estado
END $$

-- Tabla: actividad
-- DROP PROCEDURE IF EXISTS pa_actividad_delete;

CREATE PROCEDURE pa_actividad_delete(
	IN _act_cod int(11)
)
BEGIN
	-- actividad no tiene columna estado
END $$

