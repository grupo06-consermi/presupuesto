DELIMITER $$
-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_getRow;

CREATE PROCEDURE pa_presupuesto_getRow(
	IN _pres_cod int(11)
)
BEGIN
	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_getByID;

CREATE PROCEDURE pa_presupuesto_getByID(
	IN _pres_cod int(11)
)
BEGIN
	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, cli_email, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_getDetalles;

CREATE PROCEDURE pa_presupuesto_getDetalles(
    IN _pres_cod int(11)
)
BEGIN
    SELECT pres_cod, prod_cod, prod_nombre_comercial, prod_stock,
           dpre_cantidad, dpre_precio
    FROM detalle_presupuesto presdet
             INNER JOIN presupuesto pres ON presdet.pre_cod = pres.pres_cod
             INNER JOIN producto prod ON presdet.pro_cod = prod.prod_cod
    WHERE pres.pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_getManoObra;

CREATE PROCEDURE pa_presupuesto_getManoObra(
    IN _pres_cod int(11)
)
BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
             INNER JOIN presupuesto p ON act.pres_cod = p.pres_cod
    WHERE p.pres_cod = _pres_cod;
END $$

CALL pa_presupuesto_getManoObra(23);

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_listCbo;

CREATE PROCEDURE pa_presupuesto_listCbo(
	IN _pres_cod int(11)
)
BEGIN
	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_estado = 1 OR (pre.pres_cod = _pres_cod);
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_list;

CREATE PROCEDURE pa_presupuesto_list(
	IN _buscar varchar(50),
	IN _pres_estado tinyint unsigned
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado, pres_situacion
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_estado = _pres_estado
	ORDER BY pres_cod DESC;
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_insert;

CREATE PROCEDURE pa_presupuesto_insert(
	IN _pres_forma_pago char(30),
	IN _pres_lugar_trabajo varchar(45),
	IN _pres_costo_mano_obra decimal(8, 2),
	IN _pres_costo_materiales decimal(8, 2),
	IN _pres_costo_total decimal(8, 2),
	IN _cli_codigo int(11),
	IN _pres_encargado varchar(100),
	OUT _pres_cod int(11)
)
BEGIN
	INSERT INTO presupuesto (
		pres_fecha_emision,
	    pres_hash_emision,
		pres_fecha_recepcion,
		pres_forma_pago,
		pres_lugar_trabajo,
		pres_estado,
		pres_costo_mano_obra,
		pres_costo_materiales,
		pres_costo_total,
		cli_codigo,
		pres_encargado
	)
	VALUES (
		now(),
	    '',
		null,
		_pres_forma_pago,
		_pres_lugar_trabajo,
		1,
		_pres_costo_mano_obra,
		_pres_costo_materiales,
		_pres_costo_total,
		_cli_codigo,
		_pres_encargado
	);
	SET _pres_cod = LAST_INSERT_ID();
    UPDATE presupuesto set pres_hash_emision = md5(_pres_cod) where pres_cod = _pres_cod;
END $$

CALL pa_presupuesto_insert(1, 'santa', '100', '120', '220', 1, 'x',@s);

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_update;

CREATE PROCEDURE pa_presupuesto_update(
	IN _pres_cod int(11),
	IN _pres_forma_pago char(30),
	IN _pres_lugar_trabajo varchar(45),
	IN _pres_costo_mano_obra decimal(8, 2),
	IN _pres_costo_materiales decimal(8, 2),
	IN _pres_costo_total decimal(8, 2),
	IN _cli_codigo int(11),
	IN _pres_encargado varchar(100)
)
BEGIN
	UPDATE presupuesto
	SET pres_forma_pago = _pres_forma_pago,
		pres_lugar_trabajo = _pres_lugar_trabajo,
		pres_costo_mano_obra = _pres_costo_mano_obra,
		pres_costo_materiales = _pres_costo_materiales,
		pres_costo_total = _pres_costo_total,
		cli_codigo = _cli_codigo,
		pres_encargado = _pres_encargado
	WHERE pres_cod = _pres_cod;
END $$

call pa_presupuesto_update(27, 1,'santa',4,202.48,206.8,3,'');

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_activate;

CREATE PROCEDURE pa_presupuesto_activate(
	IN _pres_cod int(11)
)
BEGIN
	UPDATE presupuesto
	SET pres_estado = 1
	WHERE pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_deactivate;

CREATE PROCEDURE pa_presupuesto_deactivate(
	IN _pres_cod int(11)
)
BEGIN
	UPDATE presupuesto
	SET pres_estado = 2
	WHERE pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_delete;

CREATE PROCEDURE pa_presupuesto_delete(
	IN _pres_cod int(11)
)
BEGIN
	UPDATE presupuesto
	SET pres_estado = 0
	WHERE pres_cod = _pres_cod;
END $$

