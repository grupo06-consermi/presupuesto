DELIMITER $$
-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_getRow;

CREATE PROCEDURE pa_conformidad_getRow(
	IN _conf_cod int(11)
)
BEGIN
	SELECT conf_cod, pres_cod, conf_fecha_inicio, conf_fecha_fin, conf_act_conformidad,
		   conf_estado
	FROM conformidad conf
		INNER JOIN presupuesto pres ON conf.pres_cod = pres.pres_cod
	WHERE conf.conf_cod = _conf_cod;
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_getByID;

CREATE PROCEDURE pa_conformidad_getByID(
	IN _conf_cod int(11)
)
BEGIN
	SELECT conf_cod, pres_cod, conf_fecha_inicio, conf_fecha_fin, conf_act_conformidad,
		   conf_estado
	FROM conformidad conf
		INNER JOIN presupuesto pres ON conf.pres_cod = pres.pres_cod
	WHERE conf.conf_cod = _conf_cod;
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_listCbo;

CREATE PROCEDURE pa_conformidad_listCbo(
	IN _conf_cod int(11)
)
BEGIN
	SELECT conf_cod, pres_cod, conf_fecha_inicio, conf_fecha_fin, conf_act_conformidad,
		   conf_estado
	FROM conformidad conf
		INNER JOIN presupuesto pres ON conf.pres_cod = pres.pres_cod
	WHERE conf.conf_estado = 1 OR (conf.conf_cod = _conf_cod);
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_list;

CREATE PROCEDURE pa_conformidad_list(
	IN _buscar varchar(50),
	IN _conf_estado tinyint unsigned 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT conf_cod, pres_cod, conf_fecha_inicio, conf_fecha_fin, conf_act_conformidad,
		   conf_estado
	FROM conformidad conf
		INNER JOIN presupuesto pres ON conf.pres_cod = pres.pres_cod
	WHERE conf.conf_estado = _conf_estado;
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_insert;

CREATE PROCEDURE pa_conformidad_insert(
	IN _pres_cod int(11),
	IN _conf_fecha_inicio date,
	IN _conf_fecha_fin date,
	IN _conf_act_conformidad int(11),
	OUT _conf_cod int(11)
)
BEGIN
	INSERT INTO conformidad (
		pres_cod,
		conf_fecha_inicio,
		conf_fecha_fin,
		conf_act_conformidad,
		conf_estado
	)
	VALUES (
		_pres_cod,
		_conf_fecha_inicio,
		_conf_fecha_fin,
		_conf_act_conformidad,
		1
	);
	SET _conf_cod = LAST_INSERT_ID();
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_update;

CREATE PROCEDURE pa_conformidad_update(
	IN _conf_cod int(11),
	IN _pres_cod int(11),
	IN _conf_fecha_inicio date,
	IN _conf_fecha_fin date,
	IN _conf_act_conformidad int(11)
)
BEGIN
	UPDATE conformidad
	SET pres_cod = _pres_cod,
		conf_fecha_inicio = _conf_fecha_inicio,
		conf_fecha_fin = _conf_fecha_fin,
		conf_act_conformidad = _conf_act_conformidad
	WHERE conf_cod = _conf_cod;
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_activate;

CREATE PROCEDURE pa_conformidad_activate(
	IN _conf_cod int(11)
)
BEGIN
	UPDATE conformidad
	SET conf_estado = 1
	WHERE conf_cod = _conf_cod;
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_deactivate;

CREATE PROCEDURE pa_conformidad_deactivate(
	IN _conf_cod int(11)
)
BEGIN
	UPDATE conformidad
	SET conf_estado = 2
	WHERE conf_cod = _conf_cod;
END $$

-- Tabla: conformidad
-- DROP PROCEDURE IF EXISTS pa_conformidad_delete;

CREATE PROCEDURE pa_conformidad_delete(
	IN _conf_cod int(11)
)
BEGIN
	UPDATE conformidad
	SET conf_estado = 0
	WHERE conf_cod = _conf_cod;
END $$

