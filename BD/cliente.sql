DELIMITER $$
-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_getRow;

CREATE PROCEDURE pa_cliente_getRow(
	IN _cli_codigo int(11)
)
BEGIN
	SELECT cli_codigo, cli_razon_social, cli_ruc, cli_direccion, cli_telefono, cli_email,
		   cli_estado
	FROM cliente cli
	WHERE cli.cli_codigo = _cli_codigo;
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_getByID;

CREATE PROCEDURE pa_cliente_getByID(
	IN _cli_codigo int(11)
)
BEGIN
	SELECT cli_codigo, cli_razon_social, cli_ruc, cli_direccion, cli_telefono, cli_email,
		   cli_estado
	FROM cliente cli
	WHERE cli.cli_codigo = _cli_codigo;
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_listCbo;

CREATE PROCEDURE pa_cliente_listCbo(
	IN _cli_codigo int(11)
)
BEGIN
	SELECT cli_codigo, cli_razon_social, cli_ruc, cli_direccion, cli_telefono, cli_email,
		   cli_estado
	FROM cliente cli
	WHERE cli.cli_estado = 1 OR (cli.cli_codigo = _cli_codigo);
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_list;

CREATE PROCEDURE pa_cliente_list(
	IN _buscar varchar(50),
	IN _cli_estado tinyint unsigned 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT cli_codigo, cli_razon_social, cli_ruc, cli_direccion, cli_telefono, cli_email,
		   cli_estado
	FROM cliente cli
	WHERE (cli.cli_razon_social LIKE _buscar)
		AND cli.cli_estado = _cli_estado;
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_insert;

CREATE PROCEDURE pa_cliente_insert(
	IN _cli_razon_social varchar(45),
	IN _cli_ruc varchar(45),
	IN _cli_direccion varchar(45),
	IN _cli_telefono char(9),
	IN _cli_email varchar(100),
	OUT _cli_codigo int(11)
)
BEGIN
	INSERT INTO cliente (
		cli_razon_social,
		cli_ruc,
		cli_direccion,
		cli_telefono,
		cli_email,
		cli_estado
	)
	VALUES (
		_cli_razon_social,
		_cli_ruc,
		_cli_direccion,
		_cli_telefono,
		_cli_email,
		1
	);
	SET _cli_codigo = LAST_INSERT_ID();
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_update;

CREATE PROCEDURE pa_cliente_update(
	IN _cli_codigo int(11),
	IN _cli_razon_social varchar(45),
	IN _cli_ruc varchar(45),
	IN _cli_direccion varchar(45),
	IN _cli_telefono char(9),
	IN _cli_email varchar(100)
)
BEGIN
	UPDATE cliente
	SET cli_razon_social = _cli_razon_social,
		cli_ruc = _cli_ruc,
		cli_direccion = _cli_direccion,
		cli_telefono = _cli_telefono,
		cli_email = _cli_email
	WHERE cli_codigo = _cli_codigo;
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_activate;

CREATE PROCEDURE pa_cliente_activate(
	IN _cli_codigo int(11)
)
BEGIN
	UPDATE cliente
	SET cli_estado = 1
	WHERE cli_codigo = _cli_codigo;
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_deactivate;

CREATE PROCEDURE pa_cliente_deactivate(
	IN _cli_codigo int(11)
)
BEGIN
	UPDATE cliente
	SET cli_estado = 2
	WHERE cli_codigo = _cli_codigo;
END $$

-- Tabla: cliente
-- DROP PROCEDURE IF EXISTS pa_cliente_delete;

CREATE PROCEDURE pa_cliente_delete(
	IN _cli_codigo int(11)
)
BEGIN
	UPDATE cliente
	SET cli_estado = 0
	WHERE cli_codigo = _cli_codigo;
END $$

