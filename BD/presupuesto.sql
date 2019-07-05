DELIMITER $$
-- Tabla: presupuesto
DROP PROCEDURE IF EXISTS pa_presupuesto_getRow;

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
DROP PROCEDURE IF EXISTS pa_presupuesto_getByID;

CREATE PROCEDURE pa_presupuesto_getByID(
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
DROP PROCEDURE IF EXISTS pa_presupuesto_listCbo;

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
DROP PROCEDURE IF EXISTS pa_presupuesto_list;

CREATE PROCEDURE pa_presupuesto_list(
	IN _buscar varchar(50),
	IN _pres_estado tinyint unsigned 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_estado = _pres_estado;
END $$

-- Tabla: presupuesto
DROP PROCEDURE IF EXISTS pa_presupuesto_insert;

CREATE PROCEDURE pa_presupuesto_insert(
	IN _pres_fecha_emision date,
	IN _pres_fecha_recepcion date,
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
		_pres_fecha_emision,
		_pres_fecha_recepcion,
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
END $$

-- Tabla: presupuesto
DROP PROCEDURE IF EXISTS pa_presupuesto_update;

CREATE PROCEDURE pa_presupuesto_update(
	IN _pres_cod int(11),
	IN _pres_fecha_emision date,
	IN _pres_fecha_recepcion date,
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
	SET pres_fecha_emision = _pres_fecha_emision,
		pres_fecha_recepcion = _pres_fecha_recepcion,
		pres_forma_pago = _pres_forma_pago,
		pres_lugar_trabajo = _pres_lugar_trabajo,
		pres_costo_mano_obra = _pres_costo_mano_obra,
		pres_costo_materiales = _pres_costo_materiales,
		pres_costo_total = _pres_costo_total,
		cli_codigo = _cli_codigo,
		pres_encargado = _pres_encargado
	WHERE pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
DROP PROCEDURE IF EXISTS pa_presupuesto_activate;

CREATE PROCEDURE pa_presupuesto_activate(
	IN _pres_cod int(11)
)
BEGIN
	UPDATE presupuesto
	SET pres_estado = 1
	WHERE pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
DROP PROCEDURE IF EXISTS pa_presupuesto_deactivate;

CREATE PROCEDURE pa_presupuesto_deactivate(
	IN _pres_cod int(11)
)
BEGIN
	UPDATE presupuesto
	SET pres_estado = 2
	WHERE pres_cod = _pres_cod;
END $$

-- Tabla: presupuesto
DROP PROCEDURE IF EXISTS pa_presupuesto_delete;

CREATE PROCEDURE pa_presupuesto_delete(
	IN _pres_cod int(11)
)
BEGIN
	UPDATE presupuesto
	SET pres_estado = 0
	WHERE pres_cod = _pres_cod;
END $$

