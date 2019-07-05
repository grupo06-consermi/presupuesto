DELIMITER $$
-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_getRow;

CREATE PROCEDURE pa_actividad_empleado_getRow(
	IN _aemp_codigo int(11)
)
BEGIN
	SELECT aemp_codigo, aemp_cantidad_dias, aemp_pago_dia, aemp_total, emp_codigo,
		   emp_nombre, act.act_cod, act_descripcion
	FROM actividad_empleado aempl
		INNER JOIN actividad act ON aempl.act_cod = act.act_cod
		INNER JOIN empleado empl ON aempl.emp_cod = empl.emp_codigo
	WHERE aempl.aemp_codigo = _aemp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_getByID;

CREATE PROCEDURE pa_actividad_empleado_getByID(
	IN _aemp_codigo int(11)
)
BEGIN
	SELECT aemp_codigo, aemp_cantidad_dias, aemp_pago_dia, aemp_total, emp_codigo,
		   emp_nombre, act.act_cod, act_descripcion
	FROM actividad_empleado aempl
		INNER JOIN actividad act ON aempl.act_cod = act.act_cod
		INNER JOIN empleado empl ON aempl.emp_cod = empl.emp_codigo
	WHERE aempl.aemp_codigo = _aemp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_listCbo;

CREATE PROCEDURE pa_actividad_empleado_listCbo(
	IN _aemp_codigo int(11)
)
BEGIN
	SELECT aemp_codigo, aemp_cantidad_dias, aemp_pago_dia, aemp_total, emp_codigo,
		   emp_nombre, act.act_cod, act_descripcion
	FROM actividad_empleado aempl
		INNER JOIN actividad act ON aempl.act_cod = act.act_cod
		INNER JOIN empleado empl ON aempl.emp_cod = empl.emp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_list;

CREATE PROCEDURE pa_actividad_empleado_list(
	IN _buscar varchar(50) 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT aemp_codigo, aemp_cantidad_dias, aemp_pago_dia, aemp_total, emp_codigo,
		   emp_nombre, act.act_cod, act_descripcion
	FROM actividad_empleado aempl
		INNER JOIN actividad act ON aempl.act_cod = act.act_cod
		INNER JOIN empleado empl ON aempl.emp_cod = empl.emp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_insert;

CREATE PROCEDURE pa_actividad_empleado_insert(
	IN _aemp_cantidad_dias tinyint(4),
	IN _aemp_pago_dia decimal(8, 2),
	IN _aemp_total decimal(8, 2),
	IN _emp_cod int(11),
	IN _act_cod int(11),
	OUT _aemp_codigo int(11)
)
BEGIN
	INSERT INTO actividad_empleado (
		aemp_cantidad_dias,
		aemp_pago_dia,
		aemp_total,
		emp_cod,
		act_cod
	)
	VALUES (
		_aemp_cantidad_dias,
		_aemp_pago_dia,
		_aemp_total,
		_emp_cod,
		_act_cod
	);
	SET _aemp_codigo = LAST_INSERT_ID();
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_update;

CREATE PROCEDURE pa_actividad_empleado_update(
	IN _aemp_codigo int(11),
	IN _aemp_cantidad_dias tinyint(4),
	IN _aemp_pago_dia decimal(8, 2),
	IN _aemp_total decimal(8, 2),
	IN _emp_cod int(11),
	IN _act_cod int(11)
)
BEGIN
	UPDATE actividad_empleado
	SET aemp_cantidad_dias = _aemp_cantidad_dias,
		aemp_pago_dia = _aemp_pago_dia,
		aemp_total = _aemp_total,
		emp_cod = _emp_cod,
		act_cod = _act_cod
	WHERE aemp_codigo = _aemp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_activate;

CREATE PROCEDURE pa_actividad_empleado_activate(
	IN _aemp_codigo int(11)
)
BEGIN
	-- actividad_empleado no tiene columna estado
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_deactivate;

CREATE PROCEDURE pa_actividad_empleado_deactivate(
	IN _aemp_codigo int(11)
)
BEGIN
	-- actividad_empleado no tiene columna estado
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_delete;

CREATE PROCEDURE pa_actividad_empleado_delete(
	IN _aemp_codigo int(11)
)
BEGIN
	-- actividad_empleado no tiene columna estado
END $$

