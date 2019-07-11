DELIMITER $$
-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_getRow;

CREATE PROCEDURE pa_producto_getRow(
	IN _prod_cod int(11)
)
BEGIN
	SELECT prod_cod, prov.prov_cod, prov_razon_social, cat_cod, cat_nombre, mar.mar_codigo, mar_nombre,
		   prod_nombre_comercial, prod_precio_compra, prod_precio_venta, prod_stock,
		   prod_stock_min, prod_stock_reponer, uni.uni_codigo, uni_descripcion, alm.alm_codigo,
		   alm_nombre
	FROM producto pro
		INNER JOIN almacen alm ON pro.alm_codigo = alm.alm_codigo
		INNER JOIN categoria categ ON pro.cat_codigo = categ.cat_cod
		INNER JOIN marca mar ON pro.mar_codigo = mar.mar_codigo
		INNER JOIN proveedor prov ON pro.prov_cod = prov.prov_cod
		INNER JOIN unidad_medida uni ON pro.uni_codigo = uni.uni_codigo
	WHERE pro.prod_cod = _prod_cod;
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_getByID;

CREATE PROCEDURE pa_producto_getByID(
	IN _prod_cod int(11)
)
BEGIN
	SELECT prod_cod, prov.prov_cod, prov_razon_social, cat_cod, cat_nombre, mar.mar_codigo, mar_nombre,
		   prod_nombre_comercial, prod_precio_compra, prod_precio_venta, prod_stock,
		   prod_stock_min, prod_stock_reponer, uni.uni_codigo, uni_descripcion, alm.alm_codigo,
		   alm_nombre
	FROM producto pro
		INNER JOIN almacen alm ON pro.alm_codigo = alm.alm_codigo
		INNER JOIN categoria categ ON pro.cat_codigo = categ.cat_cod
		INNER JOIN marca mar ON pro.mar_codigo = mar.mar_codigo
		INNER JOIN proveedor prov ON pro.prov_cod = prov.prov_cod
		INNER JOIN unidad_medida uni ON pro.uni_codigo = uni.uni_codigo
	WHERE pro.prod_cod = _prod_cod;
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_listCbo;

CREATE PROCEDURE pa_producto_listCbo(
	IN _prod_cod int(11)
)
BEGIN
	SELECT prod_cod, prov.prov_cod, prov_razon_social, cat_cod, cat_nombre, mar.mar_codigo, mar_nombre,
		   prod_nombre_comercial, prod_precio_compra, prod_precio_venta, prod_stock,
		   prod_stock_min, prod_stock_reponer, uni.uni_codigo, uni_descripcion, alm.alm_codigo,
		   alm_nombre
	FROM producto pro
		INNER JOIN almacen alm ON pro.alm_codigo = alm.alm_codigo
		INNER JOIN categoria categ ON pro.cat_codigo = categ.cat_cod
		INNER JOIN marca mar ON pro.mar_codigo = mar.mar_codigo
		INNER JOIN proveedor prov ON pro.prov_cod = prov.prov_cod
		INNER JOIN unidad_medida uni ON pro.uni_codigo = uni.uni_codigo
    WHERE pro.prod_estado = 1 OR (pro.prod_cod = _prod_cod);
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_list;

CREATE PROCEDURE pa_producto_list(
	IN _buscar varchar(50) 
)
BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT prod_cod, prov.prov_cod, prov_razon_social, cat_cod, cat_nombre, mar.mar_codigo, mar_nombre,
		   prod_nombre_comercial, prod_precio_compra, prod_precio_venta, prod_stock,
		   prod_stock_min, prod_stock_reponer, uni.uni_codigo, uni_descripcion, alm.alm_codigo,
		   alm_nombre
	FROM producto pro
		INNER JOIN almacen alm ON pro.alm_codigo = alm.alm_codigo
		INNER JOIN categoria categ ON pro.cat_codigo = categ.cat_cod
		INNER JOIN marca mar ON pro.mar_codigo = mar.mar_codigo
		INNER JOIN proveedor prov ON pro.prov_cod = prov.prov_cod
		INNER JOIN unidad_medida uni ON pro.uni_codigo = uni.uni_codigo;
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_insert;

CREATE PROCEDURE pa_producto_insert(
	IN _prov_cod int(11),
	IN _cat_codigo int(11),
	IN _mar_codigo int(11),
	IN _prod_nombre_comercial varchar(150),
	IN _prod_precio_compra decimal(8, 2),
	IN _prod_precio_venta decimal(8, 2),
	IN _prod_stock decimal(8, 0),
	IN _prod_stock_min int(11),
	IN _prod_stock_reponer decimal(8, 0),
	IN _uni_codigo int(11),
	IN _alm_codigo int(11),
	OUT _prod_cod int(11)
)
BEGIN
	INSERT INTO producto (
		prov_cod,
		cat_codigo,
		mar_codigo,
		prod_nombre_comercial,
		prod_precio_compra,
		prod_precio_venta,
		prod_stock,
		prod_stock_min,
		prod_stock_reponer,
		uni_codigo,
		alm_codigo
	)
	VALUES (
		_prov_cod,
		_cat_codigo,
		_mar_codigo,
		_prod_nombre_comercial,
		_prod_precio_compra,
		_prod_precio_venta,
		_prod_stock,
		_prod_stock_min,
		_prod_stock_reponer,
		_uni_codigo,
		_alm_codigo
	);
	SET _prod_cod = LAST_INSERT_ID();
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_update;

CREATE PROCEDURE pa_producto_update(
	IN _prod_cod int(11),
	IN _prov_cod int(11),
	IN _cat_codigo int(11),
	IN _mar_codigo int(11),
	IN _prod_nombre_comercial varchar(150),
	IN _prod_precio_compra decimal(8, 2),
	IN _prod_precio_venta decimal(8, 2),
	IN _prod_stock decimal(8, 0),
	IN _prod_stock_min int(11),
	IN _uni_codigo int(11),
	IN _alm_codigo int(11)
)
BEGIN
	UPDATE producto
	SET prov_cod = _prov_cod,
		cat_codigo = _cat_codigo,
		mar_codigo = _mar_codigo,
		prod_nombre_comercial = _prod_nombre_comercial,
		prod_precio_compra = _prod_precio_compra,
		prod_precio_venta = _prod_precio_venta,
		prod_stock = _prod_stock,
		prod_stock_min = _prod_stock_min,
		uni_codigo = _uni_codigo,
		alm_codigo = _alm_codigo
	WHERE prod_cod = _prod_cod;
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_activate;

CREATE PROCEDURE pa_producto_activate(
	IN _prod_cod int(11)
)
BEGIN
    UPDATE producto SET prod_estado = 1 WHERE prod_cod = _prod_cod;
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_deactivate;

CREATE PROCEDURE pa_producto_deactivate(
	IN _prod_cod int(11)
)
BEGIN
    UPDATE producto SET prod_estado = 2 WHERE prod_cod = _prod_cod;
END $$

-- Tabla: producto
-- DROP PROCEDURE IF EXISTS pa_producto_delete;

CREATE PROCEDURE pa_producto_delete(
	IN _prod_cod int(11)
)
BEGIN
    UPDATE producto SET prod_estado = 0 WHERE prod_cod = _prod_cod;
END

