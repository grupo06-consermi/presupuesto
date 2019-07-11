DELIMITER $$
-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_getRow;

CREATE PROCEDURE pa_proveedor_getRow(
	IN _prov_cod int(11)
)
BEGIN
	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE prov.prov_cod = _prov_cod;
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_getByID;

CREATE PROCEDURE pa_proveedor_getByID(
	IN _prov_cod int(11)
)
BEGIN
	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE prov.prov_cod = _prov_cod;
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_listCbo;

CREATE PROCEDURE pa_proveedor_listCbo(
	IN _prov_cod int(11)
)
BEGIN
	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE prov.prov_estado = 1 OR (prov.prov_cod = _prov_cod);
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_list;

CREATE PROCEDURE pa_proveedor_list(
	IN _buscar varchar(50),
	IN _prov_estado tinyint unsigned 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE (prov.prov_razon_social LIKE _buscar)
		AND prov.prov_estado = _prov_estado;
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_insert;

CREATE PROCEDURE pa_proveedor_insert(
	IN _prov_razon_social char(100),
	IN _prov_ruc char(11),
	IN _prov_email char(50),
	IN _prov_telefono char(9),
	IN _prov_direccion varchar(50),
	OUT _prov_cod int(11)
)
BEGIN
	INSERT INTO proveedor (
		prov_razon_social,
		prov_ruc,
		prov_email,
		prov_telefono,
		prov_direccion,
		prov_estado
	)
	VALUES (
		_prov_razon_social,
		_prov_ruc,
		_prov_email,
		_prov_telefono,
		_prov_direccion,
		1
	);
	SET _prov_cod = LAST_INSERT_ID();
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_update;

CREATE PROCEDURE pa_proveedor_update(
	IN _prov_cod int(11),
	IN _prov_razon_social char(100),
	IN _prov_ruc char(11),
	IN _prov_email char(50),
	IN _prov_telefono char(9),
	IN _prov_direccion varchar(50)
)
BEGIN
	UPDATE proveedor
	SET prov_razon_social = _prov_razon_social,
		prov_ruc = _prov_ruc,
		prov_email = _prov_email,
		prov_telefono = _prov_telefono,
		prov_direccion = _prov_direccion
	WHERE prov_cod = _prov_cod;
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_activate;

CREATE PROCEDURE pa_proveedor_activate(
	IN _prov_cod int(11)
)
BEGIN
	UPDATE proveedor
	SET prov_estado = 1
	WHERE prov_cod = _prov_cod;
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_deactivate;

CREATE PROCEDURE pa_proveedor_deactivate(
	IN _prov_cod int(11)
)
BEGIN
	UPDATE proveedor
	SET prov_estado = 2
	WHERE prov_cod = _prov_cod;
END $$

-- Tabla: proveedor
-- DROP PROCEDURE IF EXISTS pa_proveedor_delete;

CREATE PROCEDURE pa_proveedor_delete(
	IN _prov_cod int(11)
)
BEGIN
	UPDATE proveedor
	SET prov_estado = 0
	WHERE prov_cod = _prov_cod;
END $$

