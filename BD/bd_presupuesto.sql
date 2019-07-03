-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2019 a las 02:18:13
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_presupuesto`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `PA_actividad_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_actividad_x_Cod` (IN `p_act_cod` INT(11))  BEGIN
SELECT `act_cod`, `act_descripcion`, `act_costo_total`, `pres_cod`
FROM `actividad`
WHERE `act_cod` = p_act_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_almacen`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_almacen` (IN `p_alm_codigo` INT(11), IN `p_alm_nombre` VARCHAR(45), IN `p_alm_direccion` VARCHAR(100))  BEGIN
UPDATE `almacen` 
SET `alm_nombre` = p_alm_nombre, `alm_direccion` = p_alm_direccion
WHERE `alm_codigo` = p_alm_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_categoria` (IN `p_cat_cod` INT(11), IN `p_cat_nombre` CHAR(8), IN `p_cat_estado` TINYINT)  BEGIN
UPDATE `categoria` 
SET `cat_nombre` = p_cat_nombre, `cat_estado` = p_cat_estado
WHERE `cat_cod` = p_cat_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_cliente` (IN `p_cli_codigo` INT(11), IN `p_cli_razon_social` VARCHAR(45), IN `p_cli_ruc` VARCHAR(45), IN `p_cli_direccion` VARCHAR(45), IN `p_cli_telefono` CHAR(9), IN `p_cli_email` VARCHAR(100))  BEGIN
UPDATE `cliente` 
SET `cli_razon_social` = p_cli_razon_social, `cli_ruc` = p_cli_ruc, `cli_direccion` = p_cli_direccion, `cli_telefono` = p_cli_telefono, 
`cli_email` = p_cli_email
WHERE `cli_codigo` = p_cli_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_empleado` (IN `p_emp_codigo` INT(11), IN `p_emp_nombre` VARCHAR(45), IN `p_emp_ape_pat` VARCHAR(45), IN `p_emp_ape_mat` VARCHAR(45), IN `p_emp_direccion` VARCHAR(45), IN `p_emp_telefono` CHAR(9), IN `p_emp_fecha_fin_trabajo` DATETIME, IN `p_emp_estado` TINYINT, IN `p_emp_sexo` TINYINT, IN `p_tdoc_cod` INT(11), IN `p_emp_numero_doc` CHAR(12), IN `p_emp_correo` VARCHAR(50))  BEGIN
UPDATE `empleado` 
SET `emp_nombre` = p_emp_nombre, `emp_ape_pat` = p_emp_ape_pat, `emp_ape_mat` = p_emp_ape_mat, `emp_direccion` = p_emp_direccion, 
`emp_telefono` = p_emp_telefono,  `emp_fecha_fin_trabajo` = p_emp_fecha_fin_trabajo, `emp_estado` = p_emp_estado, 
`emp_sexo` = p_emp_sexo, `tdoc_cod` = p_tdoc_cod, `emp_numero_doc` = p_emp_numero_doc, `emp_correo` = p_emp_correo
WHERE `emp_codigo` = p_emp_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_marca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_marca` (IN `p_mar_codigo` INT(11), IN `p_mar_nombre` VARCHAR(45), IN `p_mar_estado` CHAR(8))  BEGIN
UPDATE `marca` 
SET `mar_nombre` = p_mar_nombre, `mar_estado` = p_mar_estado
WHERE `mar_codigo` = p_mar_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_orden_ejecucion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_orden_ejecucion` (IN `p_ord_cod` INT(11), IN `p_ord_num_orden` INT(11) UNSIGNED, IN `p_ord_fecha` DATE, IN `p_ord_odm` INT(11) UNSIGNED, IN `p_ord_emisor` CHAR(100), IN `p_pres_cod` INT(11), IN `p_ord_estado` CHAR(3))  BEGIN
UPDATE `orden_ejecucion` 
SET `ord_num_orden` = p_ord_num_orden, `ord_fecha` = p_ord_fecha, `ord_odm` = p_ord_odm, `ord_emisor` = p_ord_emisor, 
`pres_cod` = p_pres_cod, `ord_estado` = p_ord_estado
WHERE `ord_cod` = p_ord_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_presupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_presupuesto` (IN `p_pres_cod` INT(11), IN `p_pres_fecha_emision` DATE, IN `p_pres_fecha_recepcion` DATE, IN `p_pres_forma_pago` CHAR(30), IN `p_pres_lugar_trabajo` VARCHAR(45), IN `p_pres_estado` VARCHAR(45), IN `p_pres_costo_mano_obra` DECIMAL(8,2) UNSIGNED, IN `p_pres_costo_materiales` DECIMAL(8,2) UNSIGNED, IN `p_pres_costo_total` DECIMAL(8,2) UNSIGNED, IN `p_cli_codigo` INT(11), IN `p_pres_encargado` VARCHAR(100))  BEGIN
UPDATE `presupuesto` 
SET `pres_fecha_emision` = p_pres_fecha_emision, `pres_fecha_recepcion` = p_pres_fecha_recepcion, `pres_forma_pago` = p_pres_forma_pago, `pres_lugar_trabajo` = p_pres_lugar_trabajo, 
`pres_estado` = p_pres_estado, `pres_costo_mano_obra` = p_pres_costo_mano_obra, `pres_costo_materiales` = p_pres_costo_materiales, `pres_costo_total` = p_pres_costo_total, 
`cli_codigo` = p_cli_codigo, `pres_encargado` = p_pres_encargado
WHERE `pres_cod` = p_pres_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_proveedor` (IN `p_prov_cod` INT(11), IN `p_prov_razon_social` CHAR(100), IN `p_prov_ruc` CHAR(11), IN `p_prov_direccion` VARCHAR(50), IN `p_prov_telefono` CHAR(9), IN `p_prov_email` CHAR(50))  BEGIN
UPDATE `proveedor` 
SET `prov_razon_social` = p_prov_razon_social, `prov_ruc` = p_prov_ruc, `prov_direccion` = p_prov_direccion, `prov_telefono` = p_prov_telefono, 
`prov_email` = p_prov_email
WHERE `prov_cod` = p_prov_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actualizar_tdocumento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actualizar_tdocumento` (IN `t_tdoc_cod` INT, IN `t_tdoc_nombre` CHAR(50), IN `t_tdoc_estado` TINYINT)  BEGIN
UPDATE `tipo_documento` 
SET `tdoc_nombre` = t_tdoc_nombre, `tdoc_estado` = t_tdoc_estado
WHERE `tdoc_cod` = t_tdoc_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Actualizar_unidad_medida`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Actualizar_unidad_medida` (IN `p_uni_codigo` INT(11), IN `p_uni_descripcion` VARCHAR(45), IN `p_uni_estado` CHAR(8))  BEGIN
UPDATE `unidad_medida` 
SET `uni_descripcion` = p_uni_descripcion, `uni_estado` = p_uni_estado
WHERE `uni_codigo` = p_uni_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_almacen_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_almacen_x_Cod` (IN `p_alm_codigo` INT(11))  BEGIN
SELECT `alm_codigo`, `alm_nombre`, `alm_direccion`
FROM `almacen`
WHERE `alm_codigo` = p_alm_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_almacen`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_almacen` (IN `p_alm_codigo` INT(11))  BEGIN
DELETE FROM `almacen`
WHERE `alm_codigo` = p_alm_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_categoria` (IN `p_cat_cod` INT(11))  BEGIN
DELETE FROM `categoria`
WHERE `cat_cod` = p_cat_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_cliente` (IN `p_cli_codigo` INT(11))  BEGIN
DELETE FROM `cliente`
WHERE `cli_codigo` = p_cli_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_empleado` (IN `p_emp_codigo` INT(11))  BEGIN
DELETE FROM `empleado`
WHERE `emp_codigo` = p_emp_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_marca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_marca` (IN `p_mar_codigo` INT(11))  BEGIN
DELETE FROM `marca`
WHERE `mar_codigo` = p_mar_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_orden_ejecucion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_orden_ejecucion` (IN `p_ord_cod` INT(11))  BEGIN
DELETE FROM `orden_ejecucion`
WHERE `ord_cod` = p_ord_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_presupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_presupuesto` (IN `p_pres_cod` INT(11))  BEGIN
DELETE FROM `presupuesto`
WHERE `pres_cod` = p_pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_borrar_producto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_borrar_producto` (IN `id` INT)  BEGIN
DELETE FROM producto WHERE prod_cod = id;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_proveedor` (IN `p_prov_cod` INT(11))  BEGIN
DELETE FROM `proveedor`
WHERE `prov_cod` = p_prov_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_borrar_tdoc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_borrar_tdoc` (IN `t_tdoc_cod` INT)  BEGIN
DELETE FROM `tipo_documento`
WHERE `tdoc_cod` = t_tdoc_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Borrar_unidad_medida`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Borrar_unidad_medida` (IN `p_uni_codigo` INT(11))  BEGIN
DELETE FROM `unidad_medida`
WHERE `uni_codigo` = p_uni_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_categoria_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_categoria_x_Cod` (IN `p_cat_cod` INT(11))  BEGIN
SELECT `cat_cod`, `cat_nombre`, `cat_estado`
FROM `categoria`
WHERE `cat_cod` = p_cat_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_cliente_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_cliente_x_Cod` (IN `p_cli_codigo` INT(11))  BEGIN
SELECT `cli_codigo`, `cli_razon_social`, `cli_ruc`, `cli_direccion`, 
`cli_telefono`, `cli_email`
FROM `cliente`
WHERE `cli_codigo` = p_cli_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_empleado_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_empleado_listCbo` (IN `_emp_codigo` INT(11))  BEGIN
	SELECT emp_codigo, emp_nombre, emp_ape_pat, emp_ape_mat, emp_direccion, emp_telefono,
		   emp_fecha_inicio_trabajo, emp_fecha_fin_trabajo, emp_estado, emp_sexo,
		   tdoc.tdoc_cod, tdoc_nombre, emp_numero_doc
	FROM empleado emp
		LEFT JOIN tipo_documento tdoc ON emp.tdoc_cod = tdoc.tdoc_cod
	WHERE emp.emp_estado = 1 OR (emp.emp_codigo = _emp_codigo);
END$$

DROP PROCEDURE IF EXISTS `PA_empleado_Por_Codigo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_empleado_Por_Codigo` (IN `p_emp_codigo` INT(11))  BEGIN
SELECT `emp_codigo`, `emp_nombre`, `emp_ape_pat`, `emp_ape_mat`, 
`emp_direccion`, `emp_telefono`, `emp_fecha_inicio_trabajo`, `emp_fecha_fin_trabajo`, 
`emp_estado`, `emp_sexo`, `tdoc_cod`, `emp_numero_doc`, 
`emp_correo`
FROM `empleado`
WHERE `emp_codigo` = p_emp_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_Listar_categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Listar_categoria` (IN `buscar` VARCHAR(50))  BEGIN
SELECT * FROM categoria WHERE cat_nombre LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_listar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_cliente` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM cliente WHERE cli_razon_social LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `PA_Listar_compra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Listar_compra` ()  BEGIN
SELECT `comp_cod`, `comp_fecha`, `comp_costo_total`, `comp_estado`, 
`prov_cod`
FROM `compra`;
END$$

DROP PROCEDURE IF EXISTS `Pa_Listar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_Listar_empleado` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM empleado WHERE emp_nombre LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `PA_Listar_marca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Listar_marca` (IN `buscar` VARCHAR(50))  BEGIN
SELECT * FROM marca WHERE mar_nombre LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_listar_marca_estado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_marca_estado` (IN `estado` TINYINT(1), IN `buscar` VARCHAR(50))  BEGIN
SELECT * FROM marca WHERE mar_estado = estado AND mar_nombre LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `PA_Listar_presupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Listar_presupuesto` ()  BEGIN
SELECT `pres_cod`, `pres_fecha_emision`, `pres_fecha_recepcion`, `pres_forma_pago`, 
`pres_lugar_trabajo`, `pres_estado`, `pres_costo_mano_obra`, `pres_costo_materiales`, 
`pres_costo_total`, `cli_codigo`, `pres_encargado`
FROM `presupuesto`;
END$$

DROP PROCEDURE IF EXISTS `PA_Listar_producto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Listar_producto` ()  BEGIN
SELECT `p`.`prod_cod`, `p`.`prod_nombre_comercial`, `p`.`prod_precio_compra`, `p`.`prod_precio_venta`, `p`.`prod_cant`,
`p`.`mar_codigo`, `p`.`cat_codigo`, `p`.`uni_codigo`, `p`.`alm_codigo`,
m.mar_nombre, c.cat_nombre, a.alm_nombre, u.uni_descripcion
FROM `producto` `p` INNER JOIN marca m ON p.mar_codigo = m.mar_codigo
INNER JOIN categoria c ON p.cat_codigo = c.cat_cod
INNER JOIN almacen a ON a.alm_codigo = p.alm_codigo
INNER JOIN unidad_medida u ON p.uni_codigo = u.uni_codigo;
END$$

DROP PROCEDURE IF EXISTS `Pa_listar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_listar_proveedor` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM proveedor WHERE prov_razon_social LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `PA_Listar_unidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Listar_unidad` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM unidad_medida WHERE uni_descripcion LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_lista_almacen`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_lista_almacen` (IN `buscar` VARCHAR(50))  BEGIN
SELECT * FROM almacen WHERE alm_nombre LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_lista_categoria_estado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_lista_categoria_estado` (IN `estado` TINYINT(1), IN `buscar` VARCHAR(50))  BEGIN
SELECT * FROM categoria WHERE cat_estado = 1 AND cat_nombre LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_lista_tdocumento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_lista_tdocumento` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM tipo_documento WHERE tdoc_cod LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_lista_unidades`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_lista_unidades` (IN `buscar` VARCHAR(50), IN `estado` TINYINT(1))  BEGIN
SELECT * FROM unidad_medida WHERE uni_estado = estado AND uni_descripcion LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `PA_marca_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_marca_x_Cod` (IN `p_mar_codigo` INT(11))  BEGIN
SELECT `mar_codigo`, `mar_nombre`, `mar_estado`
FROM `marca`
WHERE `mar_codigo` = p_mar_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_orden_ejecucion_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_orden_ejecucion_x_Cod` (IN `p_ord_cod` INT(11))  BEGIN
SELECT `ord_cod`, `ord_num_orden`, `ord_fecha`, `ord_odm`, 
`ord_emisor`, `pres_cod`, `ord_estado`
FROM `orden_ejecucion`
WHERE `ord_cod` = p_ord_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_listar` (IN `buscar` VARCHAR(70))  BEGIN
SELECT *, c.cli_razon_social
FROM presupuesto p 
INNER JOIN cliente c ON p.cli_codigo = c.cli_codigo
WHERE c.cli_razon_social LIKE buscar OR p.pres_lugar_trabajo LIKE buscar
OR p.pres_encargado LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `PA_presupuesto_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_presupuesto_x_Cod` (IN `p_pres_cod` INT(11))  BEGIN
SELECT `pres_cod`, `pres_fecha_emision`, `pres_fecha_recepcion`, `pres_forma_pago`, 
`pres_lugar_trabajo`, `pres_estado`, `pres_costo_mano_obra`, `pres_costo_materiales`, 
`pres_costo_total`, `cli_codigo`, `pres_encargado`
FROM `presupuesto`
WHERE `pres_cod` = p_pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_producto_actualizar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_actualizar` (IN `prod_codigo` INT, IN `descripcion` VARCHAR(150), IN `mar_cod` INT, IN `cat_cod` INT, IN `uni_cod` INT, IN `alm_cod` INT, IN `prov_cod` INT, IN `precio_compra` DECIMAL(8,2), IN `precio_venta` DECIMAL(8,2), IN `prod_cant` DECIMAL(8,0))  BEGIN
UPDATE producto SET
prod_nombre_comercial = descripcion,
mar_codigo = mar_cod,
cat_codigo = cat_cod,
uni_codigo = uni_cod,
alm_codigo = alm_cod,
prov_cod   = prov_cod,
prod_precio_compra = precio_compra,
prod_precio_venta = precio_venta ,
prod_cant=prod_cant WHERE prod_cod = prod_codigo;
END$$

DROP PROCEDURE IF EXISTS `PA_producto_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_producto_x_Cod` (IN `p_prod_cod` INT(11))  BEGIN
SELECT `prod_cod`, `prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, `prod_cant`,
`mar_codigo`, `cat_codigo`, `uni_codigo`, `alm_codigo`, `prov_cod`
FROM `producto`
WHERE `prod_cod` = p_prod_cod;
END$$

DROP PROCEDURE IF EXISTS `Pa_proveedor_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_proveedor_x_Cod` (IN `p_prov_cod` INT)  BEGIN
SELECT `prov_cod`, `prov_razon_social`, `prov_ruc`, `prov_direccion`, `prov_telefono`, `prov_email`
FROM `proveedor`
WHERE `prov_cod` = p_prov_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_actividad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_actividad` (IN `p_act_cod` INT(11), IN `p_act_descripcion` VARCHAR(100), IN `p_act_costo_total` DECIMAL(8,2), IN `p_pres_cod` INT(11))  BEGIN
INSERT INTO `actividad`(`act_cod`, `act_descripcion`, `act_costo_total`, `pres_cod`) 
VALUES (p_act_cod, p_act_descripcion, p_act_costo_total, p_pres_cod);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_actividad_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_actividad_empleado` (IN `p_aemp_codigo` INT(11), IN `p_aemp_cantidad_dias` TINYINT(3) UNSIGNED, IN `p_aemp_pago_dia` DECIMAL(8,2) UNSIGNED, IN `p_aemp_total` DECIMAL(8,2) UNSIGNED, IN `p_emp_cod` INT(11), IN `p_act_cod` INT(11))  BEGIN
INSERT INTO `actividad_empleado`(`aemp_codigo`, `aemp_cantidad_dias`, `aemp_pago_dia`, `aemp_total`, 
`emp_cod`, `act_cod`) 
VALUES (p_aemp_codigo, p_aemp_cantidad_dias, p_aemp_pago_dia, p_aemp_total, 
p_emp_cod, p_act_cod);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_actividad_productos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_actividad_productos` (IN `p_actpro_cod` INT(11), IN `p_act_cod` INT(11), IN `p_prod_cod` INT(11), IN `p_actpro_precio` DECIMAL(8,2) UNSIGNED, IN `p_actpro_cantidad` INT(11) UNSIGNED, IN `p_actpro_total` DECIMAL(8,2) UNSIGNED)  BEGIN
INSERT INTO `actividad_productos`(`actpro_cod`, `act_cod`, `prod_cod`, `actpro_precio`, 
`actpro_cantidad`, `actpro_total`) 
VALUES (p_actpro_cod, p_act_cod, p_prod_cod, p_actpro_precio, 
p_actpro_cantidad, p_actpro_total);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_almacen`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_almacen` (IN `p_alm_nombre` VARCHAR(45), IN `p_alm_direccion` VARCHAR(100))  BEGIN
INSERT INTO `almacen`( `alm_nombre`, `alm_direccion`) 
VALUES ( p_alm_nombre, p_alm_direccion);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_categoria` (IN `p_cat_nombre` CHAR(8), IN `p_cat_estado` TINYINT)  BEGIN
INSERT INTO `categoria`( `cat_nombre`, `cat_estado`) 
VALUES ( p_cat_nombre, p_cat_estado);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_cliente` (IN `p_cli_razon_social` VARCHAR(45), IN `p_cli_ruc` VARCHAR(45), IN `p_cli_direccion` VARCHAR(45), IN `p_cli_telefono` CHAR(9), IN `p_cli_email` VARCHAR(100))  BEGIN
INSERT INTO `cliente`( `cli_razon_social`, `cli_ruc`, `cli_direccion`, 
`cli_telefono`, `cli_email`) 
VALUES (p_cli_razon_social, p_cli_ruc, p_cli_direccion, 
p_cli_telefono, p_cli_email);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_compra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_compra` (IN `p_comp_cod` INT(11), IN `p_comp_fecha` DATE, IN `p_comp_costo_total` DOUBLE(8,2) UNSIGNED, IN `p_comp_estado` CHAR(12), IN `p_prov_cod` INT(11))  BEGIN
INSERT INTO `compra`(`comp_cod`, `comp_fecha`, `comp_costo_total`, `comp_estado`, 
`prov_cod`) 
VALUES (p_comp_cod, p_comp_fecha, p_comp_costo_total, p_comp_estado, 
p_prov_cod);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_conformidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_conformidad` (IN `p_conf_cod` INT(11), IN `p_conf_fecha_inicio` DATE, IN `p_conf_fecha_fin` DATE, IN `p_conf_estado` CHAR(3), IN `p_conf_act_conformidad` INT(11) UNSIGNED, IN `p_pres_cod` INT(11))  BEGIN
INSERT INTO `conformidad`(`conf_cod`, `conf_fecha_inicio`, `conf_fecha_fin`, `conf_estado`, 
`conf_act_conformidad`, `pres_cod`) 
VALUES (p_conf_cod, p_conf_fecha_inicio, p_conf_fecha_fin, p_conf_estado, 
p_conf_act_conformidad, p_pres_cod);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_empleado` (IN `p_emp_nombre` VARCHAR(45), IN `p_emp_ape_pat` VARCHAR(45), IN `p_emp_ape_mat` VARCHAR(45), IN `p_emp_direccion` VARCHAR(45), IN `p_emp_telefono` CHAR(9), IN `p_emp_fecha_inicio_trabajo` DATE, IN `p_emp_sexo` CHAR(1), IN `p_tdoc_cod` INT(11), IN `p_emp_numero_doc` CHAR(12), IN `p_emp_correo` VARCHAR(50))  BEGIN
INSERT INTO `empleado`( `emp_nombre`, `emp_ape_pat`, `emp_ape_mat`, 
`emp_direccion`, `emp_telefono`, `emp_fecha_inicio_trabajo`, 
`emp_sexo`, `tdoc_cod`, `emp_numero_doc`, 
`emp_correo`) 
VALUES ( p_emp_nombre, p_emp_ape_pat, p_emp_ape_mat, 
p_emp_direccion, p_emp_telefono, p_emp_fecha_inicio_trabajo, 
p_emp_sexo, p_tdoc_cod, p_emp_numero_doc, 
p_emp_correo);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_marca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_marca` (IN `p_mar_nombre` VARCHAR(45), IN `p_mar_estado` CHAR(8))  BEGIN
INSERT INTO `marca`( `mar_nombre`, `mar_estado`) 
VALUES ( p_mar_nombre, p_mar_estado);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_orden_ejecucion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_orden_ejecucion` (IN `p_ord_cod` INT(11), IN `p_ord_num_orden` INT(11) UNSIGNED, IN `p_ord_fecha` DATE, IN `p_ord_odm` INT(11) UNSIGNED, IN `p_ord_emisor` CHAR(100), IN `p_pres_cod` INT(11), IN `p_ord_estado` CHAR(3))  BEGIN
INSERT INTO `orden_ejecucion`(`ord_cod`, `ord_num_orden`, `ord_fecha`, `ord_odm`, 
`ord_emisor`, `pres_cod`, `ord_estado`) 
VALUES (p_ord_cod, p_ord_num_orden, p_ord_fecha, p_ord_odm, 
p_ord_emisor, p_pres_cod, p_ord_estado);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_presupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_presupuesto` (IN `p_pres_cod` INT(11), IN `p_pres_fecha_emision` DATE, IN `p_pres_fecha_recepcion` DATE, IN `p_pres_forma_pago` CHAR(30), IN `p_pres_lugar_trabajo` VARCHAR(45), IN `p_pres_estado` VARCHAR(45), IN `p_pres_costo_mano_obra` DECIMAL(8,2) UNSIGNED, IN `p_pres_costo_materiales` DECIMAL(8,2) UNSIGNED, IN `p_pres_costo_total` DECIMAL(8,2) UNSIGNED, IN `p_cli_codigo` INT(11), IN `p_pres_encargado` VARCHAR(100))  BEGIN
INSERT INTO `presupuesto`(`pres_cod`, `pres_fecha_emision`, `pres_fecha_recepcion`, `pres_forma_pago`, 
`pres_lugar_trabajo`, `pres_estado`, `pres_costo_mano_obra`, `pres_costo_materiales`, 
`pres_costo_total`, `cli_codigo`, `pres_encargado`) 
VALUES (p_pres_cod, p_pres_fecha_emision, p_pres_fecha_recepcion, p_pres_forma_pago, 
p_pres_lugar_trabajo, p_pres_estado, p_pres_costo_mano_obra, p_pres_costo_materiales, 
p_pres_costo_total, p_cli_codigo, p_pres_encargado);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_producto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_producto` (IN `p_prod_nombre_comercial` VARCHAR(150), IN `p_prod_precio_compra` DECIMAL(8,2) UNSIGNED, IN `p_prod_precio_venta` DECIMAL(8,2) UNSIGNED, IN `p_prod_cant` DECIMAL(8,0) UNSIGNED, IN `p_mar_codigo` INT(11), IN `p_cat_codigo` INT(11), IN `p_uni_codigo` INT(11), IN `p_alm_codigo` INT(11), IN `p_prov_codigo` INT)  BEGIN
INSERT INTO `producto`(`prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, `prod_cant`,
`mar_codigo`, `cat_codigo`, `uni_codigo`, `alm_codigo`,`prov_cod`) 
VALUES (p_prod_nombre_comercial, p_prod_precio_compra, p_prod_precio_venta, p_prod_cant, 
p_mar_codigo, p_cat_codigo, p_uni_codigo, p_alm_codigo,p_prov_codigo);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_proveedor` (IN `p_prov_razon_social` CHAR(100), IN `p_prov_ruc` CHAR(11), IN `p_prov_direccion` VARCHAR(50), IN `p_prov_telefono` CHAR(9), IN `p_prov_email` CHAR(50))  BEGIN
INSERT INTO `proveedor`(`prov_razon_social`, `prov_ruc`, `prov_direccion`, 
`prov_telefono`, `prov_email`) 
VALUES (p_prov_razon_social, p_prov_ruc, p_prov_direccion, 
p_prov_telefono, p_prov_email);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_tipo_documento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_tipo_documento` (IN `p_tdoc_nombre` CHAR(20), IN `p_tdoc_estado` TINYINT)  BEGIN
INSERT INTO `tipo_documento`( `tdoc_nombre`,`tdoc_estado`) 
VALUES ( p_tdoc_nombre,p_tdoc_estado);
END$$

DROP PROCEDURE IF EXISTS `PA_Registrar_unidad_medida`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_unidad_medida` (IN `p_uni_descripcion` VARCHAR(45), IN `p_uni_estado` CHAR(8))  BEGIN
INSERT INTO `unidad_medida`( `uni_descripcion`, `uni_estado`) 
VALUES ( p_uni_descripcion, p_uni_estado);
END$$

DROP PROCEDURE IF EXISTS `Pa_registra_prod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_registra_prod` (IN `p_prod_nombre_comercial` VARCHAR(50), IN `p_prod_precio_compra` DECIMAL(8,2), IN `p_prod_precio_venta` DECIMAL(8,2), IN `p_prod_cant` DECIMAL(8,0), IN `p_mar_codigo` INT, IN `p_cat_codigo` INT, IN `p_uni_codigo` INT, IN `p_alm_codigo` INT, IN `p_prov_codigo` INT)  BEGIN
INSERT INTO `producto`(`prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, `prod_cant`,
`mar_codigo`, `cat_codigo`, `uni_codigo`, `alm_codigo`,`prov_cod`) 
VALUES (p_prod_nombre_comercial, p_prod_precio_compra, p_prod_precio_venta, p_prod_cant, 
p_mar_codigo, p_cat_codigo, p_uni_codigo, p_alm_codigo,p_prov_codigo);
END$$

DROP PROCEDURE IF EXISTS `pa_rol_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_activate` (IN `_rol_cod` INT(11))  BEGIN
	UPDATE rol
	SET rol_estado = 1
	WHERE rol_cod = _rol_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_rol_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_deactivate` (IN `_rol_cod` INT(11))  BEGIN
	UPDATE rol
	SET rol_estado = 2
	WHERE rol_cod = _rol_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_rol_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_delete` (IN `_rol_cod` INT(11))  BEGIN
	UPDATE rol
	SET rol_estado = 0
	WHERE rol_cod = _rol_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_rol_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_getByID` (IN `_rol_cod` INT(11))  BEGIN
	SELECT rol_cod, rol_nombre, rol_fecha_reg, rol_estado
	FROM rol rol
	WHERE rol.rol_cod = _rol_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_rol_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_getRow` (IN `_rol_cod` INT(11))  BEGIN
	SELECT rol_cod, rol_nombre, rol_fecha_reg, rol_estado
	FROM rol rol
	WHERE rol.rol_cod = _rol_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_rol_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_insert` (IN `_rol_nombre` VARCHAR(50), OUT `_rol_cod` INT(11))  BEGIN
	INSERT INTO rol (
		rol_nombre,
		rol_fecha_reg,
		rol_estado
	)
	VALUES (
		_rol_nombre,
		NOW(),
		1
	);
	SET _rol_cod = LAST_INSERT_ID();
END$$

DROP PROCEDURE IF EXISTS `pa_rol_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_list` (IN `_buscar` VARCHAR(50), IN `_rol_estado` TINYINT UNSIGNED)  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT rol_cod, rol_nombre, rol_fecha_reg, rol_estado
	FROM rol rol
	WHERE (rol.rol_nombre LIKE _buscar)
		AND rol.rol_estado = _rol_estado;
END$$

DROP PROCEDURE IF EXISTS `pa_rol_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_listCbo` (IN `_rol_cod` INT(11))  BEGIN
	SELECT rol_cod, rol_nombre, rol_fecha_reg, rol_estado
	FROM rol rol
	WHERE rol.rol_estado = 1 OR (rol.rol_cod = _rol_cod);
END$$

DROP PROCEDURE IF EXISTS `pa_rol_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_update` (IN `_rol_cod` INT(11), IN `_rol_nombre` VARCHAR(50))  BEGIN
	UPDATE rol
	SET rol_nombre = _rol_nombre
	WHERE rol_cod = _rol_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_tipo_documento_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_tipo_documento_x_Cod` (IN `p_tdoc_cod` INT(11))  BEGIN
SELECT `tdoc_cod`, `tdoc_nombre`
FROM `tipo_documento`
WHERE `tdoc_cod` = p_tdoc_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_unidad_medida_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_unidad_medida_x_Cod` (IN `p_uni_codigo` INT(11))  BEGIN
SELECT `uni_codigo`, `uni_descripcion`, `uni_estado`
FROM `unidad_medida`
WHERE `uni_codigo` = p_uni_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_UsuarioGetByNombre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UsuarioGetByNombre` (IN `_usu_nombre` VARCHAR(50))  BEGIN
		SELECT usu_cod, usu.emp_codigo, emp_nombre, emp_ape_pat, emp_ape_mat, emp_correo,
			   usu_nombre, usu.rol_cod, rol_nombre,
			   usu_ultimo_acceso, usu_fecha_reg, usu_situacion, usu_estado
		FROM usuario usu
				 INNER JOIN empleado emp ON usu.emp_codigo = emp.emp_codigo
				 INNER JOIN rol rol ON usu.rol_cod = rol.rol_cod
		WHERE usu_nombre = _usu_nombre;
	END$$

DROP PROCEDURE IF EXISTS `pa_UsuarioLogin`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UsuarioLogin` (IN `_usu_nombre` VARCHAR(50), IN `_usu_contrasena` VARCHAR(50))  BEGIN
		SELECT usu_cod, usu.emp_codigo, emp_nombre, emp_ape_pat, emp_ape_mat,
			   usu_nombre, usu.rol_cod, rol_nombre,
			   usu_ultimo_acceso, usu_fecha_reg, usu_situacion, usu_estado
		FROM usuario usu
				 INNER JOIN empleado emp ON usu.emp_codigo = emp.emp_codigo
				 INNER JOIN rol rol ON usu.rol_cod = rol.rol_cod
		WHERE usu_nombre = _usu_nombre AND usu_clave = MD5(_usu_contrasena);
	END$$

DROP PROCEDURE IF EXISTS `pa_UsuarioResetearContrasena`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UsuarioResetearContrasena` (IN `_usu_cod` INT, IN `_usu_contrasena` VARCHAR(32))  BEGIN
		UPDATE usuario
		SET	usu_clave = md5(_usu_contrasena)
		WHERE  usu_cod = _usu_cod;
		SELECT row_count() AS reseteado;
	END$$

DROP PROCEDURE IF EXISTS `pa_usuario_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_activate` (IN `_usu_cod` INT(11))  BEGIN
	UPDATE usuario
	SET usu_estado = 1
	WHERE usu_cod = _usu_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_deactivate` (IN `_usu_cod` INT(11))  BEGIN
	UPDATE usuario
	SET usu_estado = 2
	WHERE usu_cod = _usu_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_delete` (IN `_usu_cod` INT(11))  BEGIN
	UPDATE usuario
	SET usu_estado = 0
	WHERE usu_cod = _usu_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_getByID` (IN `_usu_cod` INT(11))  BEGIN
	SELECT usu_cod, usu.emp_codigo, emp_nombre, usu_nombre, usu_clave, usu.rol_cod, rol_nombre,
		   usu_ultimo_acceso, usu_fecha_reg, usu_situacion, usu_estado
	FROM usuario usu
		INNER JOIN empleado emp ON usu.emp_codigo = emp.emp_codigo
		INNER JOIN rol rol ON usu.rol_cod = rol.rol_cod
	WHERE usu.usu_cod = _usu_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_getRow` (IN `_usu_cod` INT(11))  BEGIN
	SELECT usu_cod, usu.emp_codigo, emp_nombre, usu_nombre, usu_clave, usu.rol_cod, rol_nombre,
		   usu_ultimo_acceso, usu_fecha_reg, usu_situacion, usu_estado
	FROM usuario usu
		INNER JOIN empleado emp ON usu.emp_codigo = emp.emp_codigo
		INNER JOIN rol rol ON usu.rol_cod = rol.rol_cod
	WHERE usu.usu_cod = _usu_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_usuario_info`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_usuario_info` (IN `_cod` INT)  SELECT u.usu_cod,u.emp_codigo,e.emp_telefono,e.emp_correo,u.usu_estado,
concat(e.emp_nombre,' ',e.emp_ape_pat) as 
'usu_nombre' FROM usuario u INNER JOIN empleado e ON e.emp_codigo = u.emp_codigo 
WHERE u.usu_cod = _cod$$

DROP PROCEDURE IF EXISTS `pa_usuario_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_insert` (IN `_emp_codigo` INT(11), IN `_usu_nombre` VARCHAR(50), IN `_usu_clave` VARCHAR(50), IN `_rol_cod` INT(11), IN `_usu_situacion` CHAR(1), OUT `_usu_cod` INT(11))  BEGIN
	INSERT INTO usuario (
		emp_codigo,
		usu_nombre,
		usu_clave,
		rol_cod,
		usu_ultimo_acceso,
		usu_fecha_reg,
		usu_situacion,
		usu_estado
	)
	VALUES (
		_emp_codigo,
		_usu_nombre,
		_usu_clave,
		_rol_cod,
		NULL,
		NOW(),
		_usu_situacion,
		1
	);
	SET _usu_cod = LAST_INSERT_ID();
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_list` (IN `_buscar` VARCHAR(50), IN `_usu_estado` TINYINT UNSIGNED)  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT usu_cod, usu.emp_codigo, emp_nombre, usu_nombre, usu_clave, usu.rol_cod, rol_nombre,
		   usu_ultimo_acceso, usu_fecha_reg, usu_situacion, usu_estado
	FROM usuario usu
		INNER JOIN empleado emp ON usu.emp_codigo = emp.emp_codigo
		INNER JOIN rol rol ON usu.rol_cod = rol.rol_cod
	WHERE (usu.usu_nombre LIKE _buscar)
		;
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_listCbo` (IN `_usu_cod` INT(11))  BEGIN
	SELECT usu_cod, usu.emp_codigo, emp_nombre, usu_nombre, usu_clave, usu.rol_cod, rol_nombre,
		   usu_ultimo_acceso, usu_fecha_reg, usu_situacion, usu_estado
	FROM usuario usu
		INNER JOIN empleado emp ON usu.emp_codigo = emp.emp_codigo
		INNER JOIN rol rol ON usu.rol_cod = rol.rol_cod
	WHERE usu.usu_estado = 1 OR (usu.usu_cod = _usu_cod);
END$$

DROP PROCEDURE IF EXISTS `pa_usuario_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_update` (IN `_usu_cod` INT(11), IN `_emp_codigo` INT(11), IN `_usu_nombre` VARCHAR(50), IN `_rol_cod` INT(11), IN `_usu_situacion` CHAR(1))  BEGIN
	UPDATE usuario
	SET emp_codigo = _emp_codigo,
		usu_nombre = _usu_nombre,
		rol_cod = _rol_cod,
		usu_situacion = _usu_situacion
	WHERE usu_cod = _usu_cod;
END$$

DROP PROCEDURE IF EXISTS `PA_usuario_verificar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_usuario_verificar` (IN `_usuario` CHAR(50), IN `_clave` CHAR(50))  SELECT u.usu_cod,u.emp_codigo,e.emp_telefono,e.emp_correo,u.usu_estado,
concat(e.emp_nombre,' ',e.emp_ape_pat) as 
'usu_nombre' FROM usuario u INNER JOIN empleado e ON e.emp_codigo = u.emp_codigo 
WHERE u.usu_nombre = _usuario AND u.usu_clave = _clave$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `act_cod` int(11) NOT NULL,
  `act_descripcion` varchar(100) DEFAULT NULL,
  `act_costo_total` decimal(8,2) DEFAULT NULL,
  `pres_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_empleado`
--

DROP TABLE IF EXISTS `actividad_empleado`;
CREATE TABLE `actividad_empleado` (
  `aemp_codigo` int(11) NOT NULL,
  `aemp_cantidad_dias` tinyint(3) UNSIGNED DEFAULT NULL,
  `aemp_pago_dia` decimal(8,2) UNSIGNED DEFAULT NULL,
  `aemp_total` decimal(8,2) UNSIGNED DEFAULT NULL,
  `emp_cod` int(11) NOT NULL,
  `act_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_productos`
--

DROP TABLE IF EXISTS `actividad_productos`;
CREATE TABLE `actividad_productos` (
  `actpro_cod` int(11) NOT NULL,
  `act_cod` int(11) DEFAULT NULL,
  `prod_cod` int(11) DEFAULT NULL,
  `actpro_precio` decimal(8,2) UNSIGNED DEFAULT NULL,
  `actpro_cantidad` int(11) UNSIGNED DEFAULT NULL,
  `actpro_total` decimal(8,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `alm_codigo` int(11) NOT NULL,
  `alm_nombre` varchar(45) NOT NULL,
  `alm_direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`alm_codigo`, `alm_nombre`, `alm_direccion`) VALUES
(0, 'almacen3', 'direccion3'),
(1, 'Almacen1', 'S/N'),
(2, 'Almacen2', 'S/N'),
(3, 'Almacen4', 'direccion4'),
(5, 'almacen5', 'almacen6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `cat_cod` int(11) NOT NULL,
  `cat_nombre` char(8) NOT NULL,
  `cat_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cat_cod`, `cat_nombre`, `cat_estado`) VALUES
(1, 'Servicio', 1),
(2, 'Producto', 1),
(9, 'Material', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cli_codigo` int(11) NOT NULL,
  `cli_razon_social` varchar(45) NOT NULL,
  `cli_ruc` varchar(45) DEFAULT NULL,
  `cli_direccion` varchar(45) DEFAULT NULL,
  `cli_telefono` char(9) DEFAULT NULL,
  `cli_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cli_codigo`, `cli_razon_social`, `cli_ruc`, `cli_direccion`, `cli_telefono`, `cli_email`) VALUES
(1, 'TESTEO3', 'TESTEO2', 'TESTEO2', 'TESTEO2', 'TESTEO2'),
(2, 'Testeo', '10203040604', 'S/N', '999999999', 'testeo@hotmail.com'),
(3, 'xxx', 'xxx', 'xxx', 'xxx', 'xx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `comp_cod` int(11) NOT NULL,
  `comp_fecha` date DEFAULT NULL,
  `comp_costo_total` double(8,2) UNSIGNED DEFAULT NULL,
  `comp_estado` char(12) DEFAULT NULL,
  `prov_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

DROP TABLE IF EXISTS `compra_detalle`;
CREATE TABLE `compra_detalle` (
  `cdet_cod` int(11) NOT NULL,
  `cdet_cantidad` int(11) UNSIGNED DEFAULT NULL,
  `cdet_total` double(8,2) UNSIGNED DEFAULT NULL,
  `prod_cod` int(11) NOT NULL,
  `comp_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conformidad`
--

DROP TABLE IF EXISTS `conformidad`;
CREATE TABLE `conformidad` (
  `conf_cod` int(11) NOT NULL,
  `conf_fecha_inicio` date DEFAULT NULL,
  `conf_fecha_fin` date DEFAULT NULL,
  `conf_estado` char(3) DEFAULT NULL,
  `conf_act_conformidad` int(11) UNSIGNED DEFAULT NULL,
  `pres_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presupuesto`
--

DROP TABLE IF EXISTS `detalle_presupuesto`;
CREATE TABLE `detalle_presupuesto` (
  `dpre_cod` int(11) NOT NULL,
  `pre_cod` int(11) DEFAULT NULL,
  `pro_cod` int(11) DEFAULT NULL,
  `dpre_cantidad` decimal(8,2) UNSIGNED DEFAULT NULL,
  `dpre_precio` decimal(8,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `emp_codigo` int(11) NOT NULL,
  `emp_nombre` varchar(45) NOT NULL,
  `emp_ape_pat` varchar(45) NOT NULL,
  `emp_ape_mat` varchar(45) NOT NULL,
  `emp_direccion` varchar(45) NOT NULL,
  `emp_telefono` char(9) DEFAULT NULL,
  `emp_fecha_inicio_trabajo` date DEFAULT NULL,
  `emp_fecha_fin_trabajo` date DEFAULT NULL,
  `emp_estado` tinyint(1) DEFAULT '1',
  `emp_sexo` tinyint(1) DEFAULT NULL,
  `tdoc_cod` int(11) DEFAULT NULL,
  `emp_numero_doc` char(12) DEFAULT NULL,
  `emp_correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`emp_codigo`, `emp_nombre`, `emp_ape_pat`, `emp_ape_mat`, `emp_direccion`, `emp_telefono`, `emp_fecha_inicio_trabajo`, `emp_fecha_fin_trabajo`, `emp_estado`, `emp_sexo`, `tdoc_cod`, `emp_numero_doc`, `emp_correo`) VALUES
(1, 'Eduardo', 'Cruz', 'Montenegro', 'Nvo. Chimbote', '955748771', '2019-05-01', '2019-12-31', 1, 0, 1, '47121523', 'thewil_ed@hotmail.com'),
(2, 'Yhoni', 'Pulido', 'Vasquez', 'Chimbote', '042585698', '2019-05-01', '2019-08-22', 1, 0, 1, '54654654', 'yhon@hotmail.com'),
(3, 'Ingrid', 'Principe', 'Guerra', 'Nvo.Chimbote', '045859698', '2018-08-02', '2019-06-21', 1, 1, 1, '54545466', 'ingrid@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `mar_codigo` int(11) NOT NULL,
  `mar_nombre` varchar(45) DEFAULT NULL,
  `mar_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`mar_codigo`, `mar_nombre`, `mar_estado`) VALUES
(1, 'prueba', 1),
(2, 'Prueba2', 1),
(3, 'Marcados', 1),
(6, 'Prueba3', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_ejecucion`
--

DROP TABLE IF EXISTS `orden_ejecucion`;
CREATE TABLE `orden_ejecucion` (
  `ord_cod` int(11) NOT NULL,
  `ord_num_orden` int(11) UNSIGNED DEFAULT NULL,
  `ord_fecha` date DEFAULT NULL,
  `ord_odm` int(11) UNSIGNED DEFAULT NULL,
  `ord_emisor` char(100) DEFAULT NULL,
  `pres_cod` int(11) NOT NULL,
  `ord_estado` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE `presupuesto` (
  `pres_cod` int(11) NOT NULL,
  `pres_fecha_emision` date NOT NULL,
  `pres_fecha_recepcion` date DEFAULT NULL,
  `pres_forma_pago` char(30) DEFAULT NULL,
  `pres_lugar_trabajo` varchar(45) DEFAULT NULL,
  `pres_estado` varchar(45) DEFAULT NULL,
  `pres_costo_mano_obra` decimal(8,2) UNSIGNED DEFAULT NULL,
  `pres_costo_materiales` decimal(8,2) UNSIGNED DEFAULT NULL,
  `pres_costo_total` decimal(8,2) UNSIGNED DEFAULT NULL,
  `cli_codigo` int(11) NOT NULL,
  `pres_encargado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presupuesto`
--

INSERT INTO `presupuesto` (`pres_cod`, `pres_fecha_emision`, `pres_fecha_recepcion`, `pres_forma_pago`, `pres_lugar_trabajo`, `pres_estado`, `pres_costo_mano_obra`, `pres_costo_materiales`, `pres_costo_total`, `cli_codigo`, `pres_encargado`) VALUES
(0, '2019-06-20', '2019-06-20', NULL, NULL, NULL, NULL, NULL, NULL, 1, ''),
(1, '2019-06-20', '2019-06-20', NULL, NULL, NULL, NULL, NULL, NULL, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `prod_cod` int(11) NOT NULL,
  `prod_nombre_comercial` varchar(150) NOT NULL,
  `prod_precio_compra` decimal(8,2) UNSIGNED DEFAULT NULL,
  `prod_precio_venta` decimal(8,2) UNSIGNED DEFAULT NULL,
  `prod_cant` decimal(8,0) UNSIGNED DEFAULT NULL,
  `prov_cod` int(11) DEFAULT NULL,
  `mar_codigo` int(11) DEFAULT NULL,
  `cat_codigo` int(11) DEFAULT NULL,
  `uni_codigo` int(11) DEFAULT NULL,
  `alm_codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`prod_cod`, `prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, `prod_cant`, `prov_cod`, `mar_codigo`, `cat_codigo`, `uni_codigo`, `alm_codigo`) VALUES
(3, 'Tuerca', '14.00', '12.00', '10', NULL, 6, 2, 4, 3),
(4, 'DESMANTELAMIENTO', '1.00', '100.00', '100', NULL, 2, 1, 4, 2),
(5, 'PRUEBA2', '10.00', '5.00', '100', NULL, 1, 1, 1, 1),
(6, 'prueba', '10.00', '11.00', '12', 1, 1, 1, 1, 1),
(9, 'PINTURA', '100.00', '100.00', '1', 2, 2, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `prov_cod` int(11) NOT NULL,
  `prov_razon_social` char(100) DEFAULT NULL,
  `prov_ruc` char(11) NOT NULL,
  `prov_direccion` varchar(50) DEFAULT NULL,
  `prov_telefono` char(9) NOT NULL,
  `prov_email` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`prov_cod`, `prov_razon_social`, `prov_ruc`, `prov_direccion`, `prov_telefono`, `prov_email`) VALUES
(1, 'Proveedor', '10232356561', 'lurigancho', '000000', 'no tiene'),
(2, 'Prueba', '10471215231', 's/n', '947125315', 'prueba@mail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `rol_cod` int(11) NOT NULL,
  `rol_nombre` varchar(50) NOT NULL,
  `rol_fecha_reg` datetime NOT NULL,
  `rol_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_cod`, `rol_nombre`, `rol_fecha_reg`, `rol_estado`) VALUES
(1, 'Admin', '2019-05-29 23:55:42', 0),
(2, 'Admin', '2019-05-30 11:54:15', 1),
(3, 'Compras', '2019-05-30 11:54:34', 1),
(5, 'erewr', '2019-05-30 11:54:57', 0),
(6, 'Ventas', '2019-05-30 11:55:16', 0),
(7, 'Ventas', '2019-05-30 11:56:08', 0),
(8, 'Ventas', '2019-05-30 11:56:10', 0),
(14, 'Nuevo', '2019-05-30 12:23:57', 0),
(15, 'erer', '2019-05-30 12:55:55', 0),
(16, 'Gerente', '2019-06-13 13:27:10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `tdoc_cod` int(11) NOT NULL,
  `tdoc_nombre` char(20) NOT NULL,
  `tdoc_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tdoc_cod`, `tdoc_nombre`, `tdoc_estado`) VALUES
(1, 'DNI', 1),
(2, 'PPT', 1),
(6, 'Pasaporte', 1),
(7, 'prueba', 0),
(8, 'nada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE `unidad_medida` (
  `uni_codigo` int(11) NOT NULL,
  `uni_descripcion` varchar(45) NOT NULL,
  `uni_estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`uni_codigo`, `uni_descripcion`, `uni_estado`) VALUES
(1, 'prueba0', 0),
(2, 'PPT', 1),
(3, 'Prueba3', 1),
(4, 'prueba6', 1),
(5, 'Prueba5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usu_cod` int(11) NOT NULL,
  `emp_codigo` int(11) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_clave` varchar(50) NOT NULL,
  `rol_cod` int(11) NOT NULL,
  `usu_ultimo_acceso` datetime DEFAULT NULL,
  `usu_fecha_reg` datetime NOT NULL,
  `usu_situacion` char(1) NOT NULL,
  `usu_estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_cod`, `emp_codigo`, `usu_nombre`, `usu_clave`, `rol_cod`, `usu_ultimo_acceso`, `usu_fecha_reg`, `usu_situacion`, `usu_estado`) VALUES
(1, 1, 'admin', '202cb962ac59075b964b07152d234b70', 2, '2019-05-30 00:49:18', '2019-05-30 00:49:25', '1', '1'),
(3, 2, 'compras', '55f584bac6a0782b4d032b4ddc18ed57', 3, NULL, '2019-05-30 13:01:32', '1', '1'),
(5, 3, 'gerente', '5c515b74ab026af01b196f3d044f744c', 16, NULL, '2019-05-30 13:02:58', '1', '1'),
(6, 1, 'thewil', '2895db886ca73a30ba7437e3cdee5b8e', 16, NULL, '2019-06-26 04:43:19', '1', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`act_cod`),
  ADD KEY `FK_actividad_presupuesto` (`pres_cod`);

--
-- Indices de la tabla `actividad_empleado`
--
ALTER TABLE `actividad_empleado`
  ADD PRIMARY KEY (`aemp_codigo`),
  ADD KEY `act_cod_idx` (`act_cod`),
  ADD KEY `emp_cod_idx` (`emp_cod`);

--
-- Indices de la tabla `actividad_productos`
--
ALTER TABLE `actividad_productos`
  ADD PRIMARY KEY (`actpro_cod`),
  ADD KEY `FK_actividad_productos_actividad` (`act_cod`),
  ADD KEY `FK_actividad_productos_producto` (`prod_cod`);

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`alm_codigo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cat_cod`),
  ADD UNIQUE KEY `cat_nombre_UQ` (`cat_nombre`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cli_codigo`),
  ADD UNIQUE KEY `cli_email_UQ` (`cli_email`),
  ADD UNIQUE KEY `cli_ruc_UQ` (`cli_ruc`),
  ADD UNIQUE KEY `cli_telefono_UQ` (`cli_telefono`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`comp_cod`),
  ADD KEY `prov_cod_idx` (`prov_cod`);

--
-- Indices de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD PRIMARY KEY (`cdet_cod`),
  ADD KEY `comp_cod_idx` (`comp_cod`),
  ADD KEY `prod_cod_idx` (`prod_cod`);

--
-- Indices de la tabla `conformidad`
--
ALTER TABLE `conformidad`
  ADD PRIMARY KEY (`conf_cod`),
  ADD UNIQUE KEY `conf_act_conformidad_UQ` (`conf_act_conformidad`),
  ADD KEY `FK_conformidad_presupuesto` (`pres_cod`);

--
-- Indices de la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  ADD KEY `FK_detalle_presupuesto_presupuesto` (`pre_cod`),
  ADD KEY `FK_detalle_presupuesto_producto` (`pro_cod`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`emp_codigo`),
  ADD UNIQUE KEY `emp_dni_UQ` (`emp_numero_doc`),
  ADD UNIQUE KEY `emp_telefono_UQ` (`emp_telefono`),
  ADD KEY `tdoc_cod_idx` (`tdoc_cod`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`mar_codigo`),
  ADD UNIQUE KEY `mar_nombre_UQ` (`mar_nombre`);

--
-- Indices de la tabla `orden_ejecucion`
--
ALTER TABLE `orden_ejecucion`
  ADD PRIMARY KEY (`ord_cod`),
  ADD UNIQUE KEY `ord_num_orden_UNIQUE` (`ord_num_orden`),
  ADD UNIQUE KEY `ord_odm_UNIQUE` (`ord_odm`),
  ADD KEY `pres_cod_idx` (`pres_cod`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`pres_cod`),
  ADD KEY `FK_presupuesto_cliente` (`cli_codigo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`prod_cod`),
  ADD KEY `alm_codigo_idx` (`alm_codigo`),
  ADD KEY `cat_codigo_idx` (`cat_codigo`),
  ADD KEY `mar_codigo_idx` (`mar_codigo`),
  ADD KEY `uni_codigo_idx` (`uni_codigo`),
  ADD KEY `prov_codigo_idx` (`prov_cod`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`prov_cod`),
  ADD UNIQUE KEY `proveedor_UQ` (`prov_telefono`,`prov_ruc`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_cod`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tdoc_cod`),
  ADD UNIQUE KEY `tdoc_nombre_UNIQUE` (`tdoc_nombre`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`uni_codigo`),
  ADD UNIQUE KEY `descripcion_UQ` (`uni_descripcion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_cod`),
  ADD UNIQUE KEY `Índice 1` (`usu_nombre`),
  ADD KEY `FK_usuario_empleado_emp_codigo` (`emp_codigo`),
  ADD KEY `FK_usuario_rol_rol_cod` (`rol_cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `act_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `actividad_empleado`
--
ALTER TABLE `actividad_empleado`
  MODIFY `aemp_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `actividad_productos`
--
ALTER TABLE `actividad_productos`
  MODIFY `actpro_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `alm_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cat_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cli_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `comp_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  MODIFY `cdet_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conformidad`
--
ALTER TABLE `conformidad`
  MODIFY `conf_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `emp_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `mar_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `prod_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `prov_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tdoc_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `uni_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `FK_actividad_presupuesto` FOREIGN KEY (`pres_cod`) REFERENCES `presupuesto` (`pres_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `actividad_empleado`
--
ALTER TABLE `actividad_empleado`
  ADD CONSTRAINT `act_cod` FOREIGN KEY (`act_cod`) REFERENCES `actividad` (`act_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emp_cod` FOREIGN KEY (`emp_cod`) REFERENCES `empleado` (`emp_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `actividad_productos`
--
ALTER TABLE `actividad_productos`
  ADD CONSTRAINT `FK_actividad_productos_actividad` FOREIGN KEY (`act_cod`) REFERENCES `actividad` (`act_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_actividad_productos_producto` FOREIGN KEY (`prod_cod`) REFERENCES `producto` (`prod_cod`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `prov_cod` FOREIGN KEY (`prov_cod`) REFERENCES `proveedor` (`prov_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD CONSTRAINT `FK_compra_detalle_producto` FOREIGN KEY (`prod_cod`) REFERENCES `producto` (`prod_cod`),
  ADD CONSTRAINT `comp_cod` FOREIGN KEY (`comp_cod`) REFERENCES `compra` (`comp_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `conformidad`
--
ALTER TABLE `conformidad`
  ADD CONSTRAINT `FK_conformidad_presupuesto` FOREIGN KEY (`pres_cod`) REFERENCES `presupuesto` (`pres_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  ADD CONSTRAINT `FK_detalle_presupuesto_presupuesto` FOREIGN KEY (`pre_cod`) REFERENCES `presupuesto` (`pres_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_detalle_presupuesto_producto` FOREIGN KEY (`pro_cod`) REFERENCES `producto` (`prod_cod`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `tdoc_cod` FOREIGN KEY (`tdoc_cod`) REFERENCES `tipo_documento` (`tdoc_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_ejecucion`
--
ALTER TABLE `orden_ejecucion`
  ADD CONSTRAINT `pres_cod` FOREIGN KEY (`pres_cod`) REFERENCES `presupuesto` (`pres_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `FK_presupuesto_cliente` FOREIGN KEY (`cli_codigo`) REFERENCES `cliente` (`cli_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `alm_codigo` FOREIGN KEY (`alm_codigo`) REFERENCES `almacen` (`alm_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cat_cod` FOREIGN KEY (`cat_codigo`) REFERENCES `categoria` (`cat_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mar_codigo` FOREIGN KEY (`mar_codigo`) REFERENCES `marca` (`mar_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pro_codigo` FOREIGN KEY (`prov_cod`) REFERENCES `proveedor` (`prov_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `uni_codigo` FOREIGN KEY (`uni_codigo`) REFERENCES `unidad_medida` (`uni_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_empleado_emp_codigo` FOREIGN KEY (`emp_codigo`) REFERENCES `empleado` (`emp_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_usuario_rol_rol_cod` FOREIGN KEY (`rol_cod`) REFERENCES `rol` (`rol_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;