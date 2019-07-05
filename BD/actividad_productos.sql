DELIMITER $$
-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_getRow;

CREATE PROCEDURE pa_actividad_productos_getRow(
	IN _actpro_cod int(11)
)
BEGIN
	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod
	WHERE actpro.actpro_cod = _actpro_cod;
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_getByID;

CREATE PROCEDURE pa_actividad_productos_getByID(
	IN _actpro_cod int(11)
)
BEGIN
	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod
	WHERE actpro.actpro_cod = _actpro_cod;
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_listCbo;

CREATE PROCEDURE pa_actividad_productos_listCbo(
	IN _actpro_cod int(11)
)
BEGIN
	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod;
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_list;

CREATE PROCEDURE pa_actividad_productos_list(
	IN _buscar varchar(50) 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod;
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_insert;

CREATE PROCEDURE pa_actividad_productos_insert(
	IN _act_cod int(11),
	IN _prod_cod int(11),
	IN _actpro_precio decimal(8, 2),
	IN _actpro_cantidad int(11),
	IN _actpro_total decimal(8, 2),
	OUT _actpro_cod int(11)
)
BEGIN
	SET _act_cod = IF(_act_cod  = 0, NULL, _act_cod);
	SET _prod_cod = IF(_prod_cod  = 0, NULL, _prod_cod);

	INSERT INTO actividad_productos (
		act_cod,
		prod_cod,
		actpro_precio,
		actpro_cantidad,
		actpro_total
	)
	VALUES (
		_act_cod,
		_prod_cod,
		_actpro_precio,
		_actpro_cantidad,
		_actpro_total
	);
	SET _actpro_cod = LAST_INSERT_ID();
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_update;

CREATE PROCEDURE pa_actividad_productos_update(
	IN _actpro_cod int(11),
	IN _act_cod int(11),
	IN _prod_cod int(11),
	IN _actpro_precio decimal(8, 2),
	IN _actpro_cantidad int(11),
	IN _actpro_total decimal(8, 2)
)
BEGIN
	SET _act_cod = IF(_act_cod  = 0, NULL, _act_cod);
	SET _prod_cod = IF(_prod_cod  = 0, NULL, _prod_cod);

	UPDATE actividad_productos
	SET act_cod = _act_cod,
		prod_cod = _prod_cod,
		actpro_precio = _actpro_precio,
		actpro_cantidad = _actpro_cantidad,
		actpro_total = _actpro_total
	WHERE actpro_cod = _actpro_cod;
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_activate;

CREATE PROCEDURE pa_actividad_productos_activate(
	IN _actpro_cod int(11)
)
BEGIN
	-- actividad_productos no tiene columna estado
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_deactivate;

CREATE PROCEDURE pa_actividad_productos_deactivate(
	IN _actpro_cod int(11)
)
BEGIN
	-- actividad_productos no tiene columna estado
END $$

-- Tabla: actividad_productos
-- DROP PROCEDURE IF EXISTS pa_actividad_productos_delete;

CREATE PROCEDURE pa_actividad_productos_delete(
	IN _actpro_cod int(11)
)
BEGIN
	-- actividad_productos no tiene columna estado
END $$

