-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2019 a las 23:34:52
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
DROP PROCEDURE IF EXISTS `pa_actividad_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_activate` (IN `_act_cod` INT(11))  BEGIN
    UPDATE actividad
    SET act_estado = 1
    WHERE act_cod = _act_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_deactivate` (IN `_act_cod` INT(11))  BEGIN
    UPDATE actividad
    SET act_estado = 2
    WHERE act_cod = _act_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_delete` (IN `_act_cod` INT(11))  BEGIN
    UPDATE actividad
    SET act_estado = 0
    WHERE act_cod = _act_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_activate` (IN `_aemp_codigo` INT(11))  BEGIN
    END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_deactivate` (IN `_aemp_codigo` INT(11))  BEGIN
    END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_delete` (IN `_aemp_codigo` INT(11))  BEGIN
    END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_getByID` (IN `_aemp_codigo` INT(11))  BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
    WHERE aemp.aemp_codigo = _aemp_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_getRow` (IN `_aemp_codigo` INT(11))  BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
    WHERE aemp.aemp_codigo = _aemp_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_insert` (IN `_act_cod` INT(11), IN `_emp_cod` INT(11), IN `_aemp_pago_dia` DECIMAL(8,2), IN `_aemp_cantidad_dias` TINYINT(4), IN `_aemp_total` DECIMAL(8,2), OUT `_aemp_codigo` INT(11))  BEGIN
    INSERT INTO actividad_empleado (
        act_cod,
        emp_cod,
        aemp_pago_dia,
        aemp_cantidad_dias,
        aemp_total
    )
    VALUES (
               _act_cod,
               _emp_cod,
               _aemp_pago_dia,
               _aemp_cantidad_dias,
               _aemp_total
           );
    SET _aemp_codigo = LAST_INSERT_ID();
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_list` (IN `_buscar` VARCHAR(50))  BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_listCbo` (IN `_aemp_codigo` INT(11))  BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_update` (IN `_aemp_codigo` INT(11), IN `_act_cod` INT(11), IN `_emp_cod` INT(11), IN `_aemp_pago_dia` DECIMAL(8,2), IN `_aemp_cantidad_dias` TINYINT(4), IN `_aemp_total` DECIMAL(8,2))  BEGIN
    UPDATE actividad_empleado
    SET act_cod = _act_cod,
        emp_cod = _emp_cod,
        aemp_pago_dia = _aemp_pago_dia,
        aemp_cantidad_dias = _aemp_cantidad_dias,
        aemp_total = _aemp_total
    WHERE aemp_codigo = _aemp_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_getByID` (IN `_act_cod` INT(11))  BEGIN
    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE act.act_cod = _act_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_getRow` (IN `_act_cod` INT(11))  BEGIN
    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE act.act_cod = _act_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_insert` (IN `_pres_cod` INT(11), IN `_act_descripcion` VARCHAR(100), IN `_act_fecha_inicio` DATETIME, IN `_act_fecha_fin` DATETIME, IN `_act_costo_total` DECIMAL(8,2), OUT `_act_cod` INT(11))  BEGIN
    set _act_fecha_inicio = if(_act_fecha_inicio='0000-00-00 00:00:00', null, _act_fecha_inicio);
    set _act_fecha_fin = if(_act_fecha_fin='0000-00-00 00:00:00', null, _act_fecha_fin);

    INSERT INTO actividad (
        pres_cod,
        act_descripcion,
        act_fecha_inicio,
        act_fecha_fin,
        act_costo_total,
        act_estado
    )
    VALUES (
               _pres_cod,
               _act_descripcion,
               _act_fecha_inicio,
               _act_fecha_fin,
               _act_costo_total,
               1
           );
    SET _act_cod = LAST_INSERT_ID();
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_list` (IN `_buscar` VARCHAR(50), IN `_act_estado` TINYINT UNSIGNED)  BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE (act.act_descripcion LIKE _buscar)
      AND act.act_estado = _act_estado;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_listCbo` (IN `_act_cod` INT(11))  BEGIN
    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE act.act_estado = 1 OR (act.act_cod = _act_cod);
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_activate` (IN `_actpro_cod` INT(11))  BEGIN
	END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_deactivate` (IN `_actpro_cod` INT(11))  BEGIN
	END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_delete` (IN `_actpro_cod` INT(11))  BEGIN
	END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_getByID` (IN `_actpro_cod` INT(11))  BEGIN
	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod
	WHERE actpro.actpro_cod = _actpro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_getRow` (IN `_actpro_cod` INT(11))  BEGIN
	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod
	WHERE actpro.actpro_cod = _actpro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_insert` (IN `_act_cod` INT(11), IN `_prod_cod` INT(11), IN `_actpro_precio` DECIMAL(8,2), IN `_actpro_cantidad` INT(11), IN `_actpro_total` DECIMAL(8,2), OUT `_actpro_cod` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_list` (IN `_buscar` VARCHAR(50))  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_listCbo` (IN `_actpro_cod` INT(11))  BEGIN
	SELECT actpro_cod, act.act_cod, act_descripcion, pro.prod_cod, actpro_precio, actpro_cantidad,
		   actpro_total
	FROM actividad_productos actpro
		LEFT JOIN actividad act ON actpro.act_cod = act.act_cod
		LEFT JOIN producto pro ON actpro.prod_cod = pro.prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_update` (IN `_actpro_cod` INT(11), IN `_act_cod` INT(11), IN `_prod_cod` INT(11), IN `_actpro_precio` DECIMAL(8,2), IN `_actpro_cantidad` INT(11), IN `_actpro_total` DECIMAL(8,2))  BEGIN
	SET _act_cod = IF(_act_cod  = 0, NULL, _act_cod);
	SET _prod_cod = IF(_prod_cod  = 0, NULL, _prod_cod);

	UPDATE actividad_productos
	SET act_cod = _act_cod,
		prod_cod = _prod_cod,
		actpro_precio = _actpro_precio,
		actpro_cantidad = _actpro_cantidad,
		actpro_total = _actpro_total
	WHERE actpro_cod = _actpro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_update` (IN `_act_cod` INT(11), IN `_pres_cod` INT(11), IN `_act_descripcion` VARCHAR(100), IN `_act_fecha_inicio` DATETIME, IN `_act_fecha_fin` DATETIME, IN `_act_costo_total` DECIMAL(8,2))  BEGIN
    UPDATE actividad
    SET pres_cod = _pres_cod,
        act_descripcion = _act_descripcion,
        act_fecha_inicio = _act_fecha_inicio,
        act_fecha_fin = _act_fecha_fin,
        act_costo_total = _act_costo_total
    WHERE act_cod = _act_cod;
END$$

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

DROP PROCEDURE IF EXISTS `Pa_Actualizar_conformidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_Actualizar_conformidad` (IN `p_conf_cod` INT(11), IN `p_conf_fecha_inicio` DATE, IN `p_conf_fecha_fin` DATE, IN `p_conf_estado` CHAR(3), IN `p_conf_act_conformidad` INT(11) UNSIGNED, IN `p_pres_cod` INT(11))  BEGIN
UPDATE `conformidad` 
SET `conf_fecha_inicio` = p_conf_fecha_inicio, `conf_fecha_fin` = p_conf_fecha_fin, `conf_estado` = p_conf_estado, `conf_act_conformidad` = p_conf_act_conformidad, 
`pres_cod` = p_pres_cod
WHERE `conf_cod` = p_conf_cod;
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

DROP PROCEDURE IF EXISTS `Pa_Borrar_conformidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_Borrar_conformidad` (IN `p_conf_cod` INT(11))  BEGIN
DELETE FROM `conformidad`
WHERE `conf_cod` = p_conf_cod;
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

DROP PROCEDURE IF EXISTS `Pa_conformidad_Por_Codigo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_conformidad_Por_Codigo` (IN `p_conf_cod` INT(11))  BEGIN
SELECT `conf_cod`, `conf_fecha_inicio`, `conf_fecha_fin`, `conf_estado`, 
`conf_act_conformidad`, `pres_cod`
FROM `conformidad`
WHERE `conf_cod` = p_conf_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_activate` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_deactivate` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_delete` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_getByID` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod
	WHERE dpre.pre_cod = _pre_cod
		AND dpre.pro_cod = _pro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_getRow` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod
	WHERE dpre.pre_cod = _pre_cod
		AND dpre.pro_cod = _pro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_insert` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11), IN `_dpre_cantidad` DECIMAL(8,2), IN `_dpre_precio` DECIMAL(8,2))  BEGIN
	INSERT INTO detalle_presupuesto (
		pre_cod,
		pro_cod,
		dpre_cantidad,
		dpre_precio
	)
	VALUES (
		_pre_cod,
		_pro_cod,
		_dpre_cantidad,
		_dpre_precio
	);
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_list` (IN `_buscar` VARCHAR(50))  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_listCbo` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	SELECT pres_cod, prod_cod, dpre_cantidad, dpre_precio
	FROM detalle_presupuesto dpre
		INNER JOIN presupuesto pre ON dpre.pre_cod = pre.pres_cod
		INNER JOIN producto pro ON dpre.pro_cod = pro.prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_update` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11), IN `_dpre_cantidad` DECIMAL(8,2), IN `_dpre_precio` DECIMAL(8,2))  BEGIN
	UPDATE detalle_presupuesto
	SET pre_cod = _pre_cod,
		pro_cod = _pro_cod,
		dpre_cantidad = _dpre_cantidad,
		dpre_precio = _dpre_precio
	WHERE pre_cod = _pre_cod
	  AND pro_cod = _pro_cod;
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

DROP PROCEDURE IF EXISTS `pa_listar_conformidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listar_conformidad` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM conformidad WHERE conf_cod LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `Pa_listar_ejecucion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pa_listar_ejecucion` (IN `buscar` CHAR(50))  BEGIN
SELECT * FROM orden_ejecucion WHERE ord_num_orden LIKE buscar;
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
    SELECT
        `p`.`prod_cod`,
        `p`.`prod_nombre_comercial`,
        `p`.`prod_precio_compra`,
        `p`.`prod_precio_venta`,
        `p`.prod_stock,
        `p`.`mar_codigo`,
        `p`.`cat_codigo`,
        `p`.`uni_codigo`,
        `p`.`alm_codigo`,
        m.mar_nombre,
        c.cat_nombre,
        a.alm_nombre,
        u.uni_descripcion
    FROM `producto` `p`
        INNER JOIN marca m
            ON p.mar_codigo = m.mar_codigo
        INNER JOIN categoria c
            ON p.cat_codigo = c.cat_cod
        INNER JOIN almacen a
            ON a.alm_codigo = p.alm_codigo
        INNER JOIN unidad_medida u
            ON p.uni_codigo = u.uni_codigo;
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

DROP PROCEDURE IF EXISTS `pa_presupuesto_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_activate` (IN `_pres_cod` INT(11))  BEGIN
	UPDATE presupuesto
	SET pres_estado = 1
	WHERE pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_deactivate` (IN `_pres_cod` INT(11))  BEGIN
	UPDATE presupuesto
	SET pres_estado = 2
	WHERE pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_delete` (IN `_pres_cod` INT(11))  BEGIN
	UPDATE presupuesto
	SET pres_estado = 0
	WHERE pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_getByID` (IN `_pres_cod` INT(11))  BEGIN
	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_getRow` (IN `_pres_cod` INT(11))  BEGIN
	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_insert` (IN `_pres_forma_pago` CHAR(30), IN `_pres_lugar_trabajo` VARCHAR(45), IN `_pres_costo_mano_obra` DECIMAL(8,2), IN `_pres_costo_materiales` DECIMAL(8,2), IN `_pres_costo_total` DECIMAL(8,2), IN `_cli_codigo` INT(11), IN `_pres_encargado` VARCHAR(100), OUT `_pres_cod` INT(11))  BEGIN
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
		now(),
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
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_list` (IN `_buscar` VARCHAR(50), IN `_pres_estado` TINYINT UNSIGNED)  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_estado = _pres_estado;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_listar` (IN `buscar` VARCHAR(70))  BEGIN
SELECT *, c.cli_razon_social
FROM presupuesto p 
INNER JOIN cliente c ON p.cli_codigo = c.cli_codigo
WHERE c.cli_razon_social LIKE buscar OR p.pres_lugar_trabajo LIKE buscar
OR p.pres_encargado LIKE buscar;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_listCbo` (IN `_pres_cod` INT(11))  BEGIN
	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_estado = 1 OR (pre.pres_cod = _pres_cod);
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_update` (IN `_pres_cod` INT(11), IN `_pres_fecha_emision` DATE, IN `_pres_fecha_recepcion` DATE, IN `_pres_forma_pago` CHAR(30), IN `_pres_lugar_trabajo` VARCHAR(45), IN `_pres_costo_mano_obra` DECIMAL(8,2), IN `_pres_costo_materiales` DECIMAL(8,2), IN `_pres_costo_total` DECIMAL(8,2), IN `_cli_codigo` INT(11), IN `_pres_encargado` VARCHAR(100))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `PA_presupuesto_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_presupuesto_x_Cod` (IN `p_pres_cod` INT(11))  BEGIN
SELECT `pres_cod`, `pres_fecha_emision`, `pres_fecha_recepcion`, `pres_forma_pago`, 
`pres_lugar_trabajo`, `pres_estado`, `pres_costo_mano_obra`, `pres_costo_materiales`, 
`pres_costo_total`, `cli_codigo`, `pres_encargado`
FROM `presupuesto`
WHERE `pres_cod` = p_pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_producto_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_activate` (IN `_prod_cod` INT(11))  BEGIN
    UPDATE producto SET prod_estado = 1 WHERE prod_cod = _prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_producto_actualizar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_actualizar` (IN `prod_codigo` INT, IN `descripcion` VARCHAR(150), IN `mar_cod` INT, IN `cat_cod` INT, IN `uni_cod` INT, IN `alm_cod` INT, IN `prov_cod` INT, IN `precio_compra` DECIMAL(8,2), IN `precio_venta` DECIMAL(8,2), IN `prod_cant` DECIMAL(8,0))  BEGIN
    UPDATE producto
    SET prod_nombre_comercial = descripcion,
        mar_codigo = mar_cod,
        cat_codigo = cat_cod,
        uni_codigo = uni_cod,
        alm_codigo = alm_cod,
        prov_cod = prov_cod,
        prod_precio_compra = precio_compra,
        prod_precio_venta = precio_venta,
        prod_stock = prod_stock
    WHERE prod_cod = prod_codigo;
END$$

DROP PROCEDURE IF EXISTS `pa_producto_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_deactivate` (IN `_prod_cod` INT(11))  BEGIN
    UPDATE producto SET prod_estado = 2 WHERE prod_cod = _prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_producto_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_delete` (IN `_prod_cod` INT(11))  BEGIN
    UPDATE producto SET prod_estado = 0 WHERE prod_cod = _prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_producto_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_getByID` (IN `_prod_cod` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_producto_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_getRow` (IN `_prod_cod` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_producto_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_insert` (IN `_prov_cod` INT(11), IN `_cat_codigo` INT(11), IN `_mar_codigo` INT(11), IN `_prod_nombre_comercial` VARCHAR(150), IN `_prod_precio_compra` DECIMAL(8,2), IN `_prod_precio_venta` DECIMAL(8,2), IN `_prod_stock` DECIMAL(8,0), IN `_prod_stock_min` INT(11), IN `_prod_stock_reponer` DECIMAL(8,0), IN `_uni_codigo` INT(11), IN `_alm_codigo` INT(11), OUT `_prod_cod` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_producto_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_list` (IN `_buscar` VARCHAR(50))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_producto_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_listCbo` (IN `_prod_cod` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_producto_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_producto_update` (IN `_prod_cod` INT(11), IN `_prov_cod` INT(11), IN `_cat_codigo` INT(11), IN `_mar_codigo` INT(11), IN `_prod_nombre_comercial` VARCHAR(150), IN `_prod_precio_compra` DECIMAL(8,2), IN `_prod_precio_venta` DECIMAL(8,2), IN `_prod_stock` DECIMAL(8,0), IN `_prod_stock_min` INT(11), IN `_uni_codigo` INT(11), IN `_alm_codigo` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `PA_producto_x_Cod`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_producto_x_Cod` (IN `p_prod_cod` INT(11))  BEGIN
    SELECT
        `prod_cod`,
        `prod_nombre_comercial`,
        `prod_precio_compra`,
        `prod_precio_venta`,
        prod_stock,
        `mar_codigo`,
        `cat_codigo`,
        `uni_codigo`,
        `alm_codigo`,
        `prov_cod`
    FROM `producto`
    WHERE `prod_cod` = p_prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_activate` (IN `_prov_cod` INT(11))  BEGIN
	UPDATE proveedor
	SET prov_estado = 1
	WHERE prov_cod = _prov_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_deactivate` (IN `_prov_cod` INT(11))  BEGIN
	UPDATE proveedor
	SET prov_estado = 2
	WHERE prov_cod = _prov_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_delete` (IN `_prov_cod` INT(11))  BEGIN
	UPDATE proveedor
	SET prov_estado = 0
	WHERE prov_cod = _prov_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_getByID` (IN `_prov_cod` INT(11))  BEGIN
	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE prov.prov_cod = _prov_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_getRow` (IN `_prov_cod` INT(11))  BEGIN
	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE prov.prov_cod = _prov_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_insert` (IN `_prov_razon_social` CHAR(100), IN `_prov_ruc` CHAR(11), IN `_prov_email` CHAR(50), IN `_prov_telefono` CHAR(9), IN `_prov_direccion` VARCHAR(50), OUT `_prov_cod` INT(11))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_list` (IN `_buscar` VARCHAR(50), IN `_prov_estado` TINYINT UNSIGNED)  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE (prov.prov_razon_social LIKE _buscar)
		AND prov.prov_estado = _prov_estado;
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_listCbo` (IN `_prov_cod` INT(11))  BEGIN
	SELECT prov_cod, prov_razon_social, prov_ruc, prov_email, prov_telefono, prov_direccion,
		   prov_estado
	FROM proveedor prov
	WHERE prov.prov_estado = 1 OR (prov.prov_cod = _prov_cod);
END$$

DROP PROCEDURE IF EXISTS `pa_proveedor_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proveedor_update` (IN `_prov_cod` INT(11), IN `_prov_razon_social` CHAR(100), IN `_prov_ruc` CHAR(11), IN `_prov_email` CHAR(50), IN `_prov_telefono` CHAR(9), IN `_prov_direccion` VARCHAR(50))  BEGIN
	UPDATE proveedor
	SET prov_razon_social = _prov_razon_social,
		prov_ruc = _prov_ruc,
		prov_email = _prov_email,
		prov_telefono = _prov_telefono,
		prov_direccion = _prov_direccion
	WHERE prov_cod = _prov_cod;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_conformidad` (IN `p_conf_fecha_inicio` DATE, IN `p_conf_fecha_fin` DATE, IN `p_conf_estado` CHAR(3), IN `p_conf_act_conformidad` INT(11) UNSIGNED, IN `p_pres_cod` INT(11))  BEGIN
INSERT INTO `conformidad`(`conf_fecha_inicio`, `conf_fecha_fin`, `conf_estado`, 
`conf_act_conformidad`, `pres_cod`) 
VALUES (p_conf_fecha_inicio, p_conf_fecha_fin, p_conf_estado, 
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_Registrar_orden_ejecucion` (IN `p_ord_num_orden` INT(11) UNSIGNED, IN `p_ord_fecha` DATE, IN `p_ord_odm` INT(11) UNSIGNED, IN `p_ord_emisor` CHAR(100), IN `p_pres_cod` INT(11), IN `p_ord_estado` CHAR(3))  BEGIN
INSERT INTO `orden_ejecucion`(`ord_num_orden`, `ord_fecha`, `ord_odm`, 
`ord_emisor`, `pres_cod`, `ord_estado`) 
VALUES ( p_ord_num_orden, p_ord_fecha, p_ord_odm, 
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
    INSERT INTO `producto` (`prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, prod_stock,
    `mar_codigo`, `cat_codigo`, `uni_codigo`, `alm_codigo`, `prov_cod`)
        VALUES (p_prod_nombre_comercial, p_prod_precio_compra, p_prod_precio_venta, p_prod_cant, p_mar_codigo, p_cat_codigo, p_uni_codigo, p_alm_codigo, p_prov_codigo);
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
    INSERT INTO `producto` (`prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, prod_stock,
    `mar_codigo`, `cat_codigo`, `uni_codigo`, `alm_codigo`, `prov_cod`)
        VALUES (p_prod_nombre_comercial, p_prod_precio_compra, p_prod_precio_venta, p_prod_cant, p_mar_codigo, p_cat_codigo, p_uni_codigo, p_alm_codigo, p_prov_codigo);
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
CREATE TABLE IF NOT EXISTS `actividad` (
  `act_cod` int(11) NOT NULL AUTO_INCREMENT,
  `pres_cod` int(11) NOT NULL,
  `act_descripcion` varchar(100) NOT NULL,
  `act_fecha_inicio` datetime DEFAULT NULL,
  `act_fecha_fin` datetime DEFAULT NULL,
  `act_costo_total` decimal(8,2) NOT NULL,
  `act_estado` char(1) NOT NULL,
  PRIMARY KEY (`act_cod`),
  KEY `FK_actividad_presupuesto` (`pres_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`act_cod`, `pres_cod`, `act_descripcion`, `act_fecha_inicio`, `act_fecha_fin`, `act_costo_total`, `act_estado`) VALUES
(1, 1, 'Mano de obra', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.00', ''),
(2, 16, 'actividades', NULL, NULL, '200.00', '1'),
(3, 16, 'actividades', NULL, NULL, '200.00', '1'),
(4, 19, 'Mano de obra', NULL, NULL, '25.00', '1'),
(5, 20, 'Mano de obra', NULL, NULL, '36.00', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_empleado`
--

DROP TABLE IF EXISTS `actividad_empleado`;
CREATE TABLE IF NOT EXISTS `actividad_empleado` (
  `aemp_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `act_cod` int(11) NOT NULL,
  `emp_cod` int(11) NOT NULL,
  `aemp_pago_dia` decimal(8,2) UNSIGNED NOT NULL,
  `aemp_cantidad_dias` tinyint(3) UNSIGNED NOT NULL,
  `aemp_total` decimal(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`aemp_codigo`),
  KEY `act_cod_idx` (`act_cod`),
  KEY `emp_cod_idx` (`emp_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad_empleado`
--

INSERT INTO `actividad_empleado` (`aemp_codigo`, `act_cod`, `emp_cod`, `aemp_pago_dia`, `aemp_cantidad_dias`, `aemp_total`) VALUES
(1, 5, 3, '6.00', 6, '36.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_productos`
--

DROP TABLE IF EXISTS `actividad_productos`;
CREATE TABLE IF NOT EXISTS `actividad_productos` (
  `actpro_cod` int(11) NOT NULL AUTO_INCREMENT,
  `act_cod` int(11) NOT NULL,
  `prod_cod` int(11) NOT NULL,
  `actpro_precio` decimal(8,2) UNSIGNED NOT NULL,
  `actpro_cantidad` int(11) UNSIGNED NOT NULL,
  `actpro_total` decimal(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`actpro_cod`),
  KEY `FK_actividad_productos_actividad` (`act_cod`),
  KEY `FK_actividad_productos_producto` (`prod_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE IF NOT EXISTS `almacen` (
  `alm_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `alm_nombre` varchar(45) NOT NULL,
  `alm_direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`alm_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`alm_codigo`, `alm_nombre`, `alm_direccion`) VALUES
(6, 'ALMACEN1', 'Villa Victoria mz r lt 4'),
(7, 'ALMACEN2', 'VILLA MARIA R 6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `cat_cod` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nombre` char(10) NOT NULL,
  `cat_estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_cod`),
  UNIQUE KEY `cat_nombre_UQ` (`cat_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cat_cod`, `cat_nombre`, `cat_estado`) VALUES
(1, 'SERVICIO', 1),
(2, 'VARIOS', 1),
(11, 'VALVULAS', 1),
(12, 'PERNOS', 1),
(13, 'TUERCAS', 1),
(14, 'ANILLOS', 1),
(15, 'TUBOS', 1),
(16, 'CODOS', 1),
(17, 'BRIDAS', 1),
(18, 'ANGULO', 1),
(19, 'PLANCHAS', 1),
(20, 'NIPLES', 1),
(21, 'UNION', 1),
(22, 'UBOLT', 1),
(23, 'BARRAS F', 1),
(24, 'COPLAS', 1),
(25, 'TEE', 1),
(26, 'ABRAZADERA', 1),
(27, 'REDUCCION', 1),
(28, 'DISCO ESME', 1),
(29, 'SOLDADURA', 1),
(30, 'PLATINAS', 1),
(31, 'COMBUSTIBL', 1),
(32, 'PVC', 1),
(33, 'ETERNIT', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cli_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cli_razon_social` varchar(45) NOT NULL,
  `cli_ruc` varchar(45) NOT NULL,
  `cli_direccion` varchar(45) NOT NULL,
  `cli_telefono` char(9) NOT NULL,
  `cli_email` varchar(100) NOT NULL,
  `cli_estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cli_codigo`),
  UNIQUE KEY `cli_email_UQ` (`cli_email`),
  UNIQUE KEY `cli_ruc_UQ` (`cli_ruc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cli_codigo`, `cli_razon_social`, `cli_ruc`, `cli_direccion`, `cli_telefono`, `cli_email`, `cli_estado`) VALUES
(1, 'COPEINCA SAC', '20224748711', 'CAL.FRANCISCO GRAÑA NRO. 155 URB. SANTA CATAL', '-', 'cope@hotmail.com', '1'),
(2, 'CFG INVESTMENT SAC', '20512868046', 'CAL.FRANCISCO GRAÑA NRO. 155 URB. SANTA CATAL', '-', 'cfg@gmail.com', '1'),
(3, 'Pesquera Tambo S.R.L', '20324519778', 'CAL.TUPAC AMARU NRO. 194 DPTO. 2 (CERCA PARAD', '945859698', 'tambo@hotmail.com', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `comp_cod` int(11) NOT NULL AUTO_INCREMENT,
  `prov_cod` int(11) NOT NULL,
  `comp_fecha` date NOT NULL,
  `comp_costo_total` double(8,2) UNSIGNED NOT NULL,
  `comp_estado` char(12) NOT NULL,
  PRIMARY KEY (`comp_cod`),
  KEY `prov_cod_idx` (`prov_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

DROP TABLE IF EXISTS `compra_detalle`;
CREATE TABLE IF NOT EXISTS `compra_detalle` (
  `comp_cod` int(11) NOT NULL,
  `prod_cod` int(11) NOT NULL,
  `cdet_cantidad` int(11) UNSIGNED NOT NULL,
  `cdet_total` double(8,2) UNSIGNED NOT NULL,
  `cdet_importe` double(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`comp_cod`,`prod_cod`),
  KEY `comp_cod_idx` (`comp_cod`),
  KEY `prod_cod_idx` (`prod_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conformidad`
--

DROP TABLE IF EXISTS `conformidad`;
CREATE TABLE IF NOT EXISTS `conformidad` (
  `conf_cod` int(11) NOT NULL AUTO_INCREMENT,
  `pres_cod` int(11) NOT NULL,
  `conf_fecha_inicio` date NOT NULL,
  `conf_fecha_fin` date NOT NULL,
  `conf_act_conformidad` int(11) UNSIGNED NOT NULL,
  `conf_estado` char(3) NOT NULL,
  PRIMARY KEY (`conf_cod`),
  UNIQUE KEY `conf_act_conformidad_UQ` (`conf_act_conformidad`),
  KEY `FK_conformidad_presupuesto` (`pres_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presupuesto`
--

DROP TABLE IF EXISTS `detalle_presupuesto`;
CREATE TABLE IF NOT EXISTS `detalle_presupuesto` (
  `pre_cod` int(11) NOT NULL,
  `pro_cod` int(11) NOT NULL,
  `dpre_cantidad` decimal(8,2) UNSIGNED NOT NULL,
  `dpre_precio` decimal(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`pre_cod`,`pro_cod`),
  KEY `FK_detalle_presupuesto_producto` (`pro_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_presupuesto`
--

INSERT INTO `detalle_presupuesto` (`pre_cod`, `pro_cod`, `dpre_cantidad`, `dpre_precio`) VALUES
(1, 1, '1.00', '153.40'),
(1, 2, '2.00', '20.30'),
(16, 3, '5.00', '101.24'),
(17, 1, '5.00', '153.40'),
(18, 1, '5.00', '153.40'),
(19, 1, '5.00', '153.40'),
(20, 3, '52.00', '101.24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `emp_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nombre` varchar(45) NOT NULL,
  `emp_ape_pat` varchar(45) NOT NULL,
  `emp_ape_mat` varchar(45) NOT NULL,
  `emp_sexo` tinyint(1) NOT NULL,
  `tdoc_cod` int(11) NOT NULL,
  `emp_numero_doc` char(12) NOT NULL,
  `emp_correo` varchar(50) NOT NULL,
  `emp_telefono` char(9) NOT NULL,
  `emp_direccion` varchar(45) NOT NULL,
  `emp_fecha_inicio_trabajo` date NOT NULL,
  `emp_fecha_fin_trabajo` date NOT NULL,
  `emp_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`emp_codigo`),
  UNIQUE KEY `emp_dni_UQ` (`emp_numero_doc`),
  UNIQUE KEY `emp_telefono_UQ` (`emp_telefono`),
  KEY `tdoc_cod_idx` (`tdoc_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`emp_codigo`, `emp_nombre`, `emp_ape_pat`, `emp_ape_mat`, `emp_sexo`, `tdoc_cod`, `emp_numero_doc`, `emp_correo`, `emp_telefono`, `emp_direccion`, `emp_fecha_inicio_trabajo`, `emp_fecha_fin_trabajo`, `emp_estado`) VALUES
(1, 'Eduardo', 'Cruz', 'Montenegro', 1, 1, '47121523', 'thewil_ed@hotmail.com', '955748771', 'Nvo. Chimbote', '2019-05-01', '0000-00-00', 1),
(2, 'Yhoni', 'Pulido', 'Vasquez', 0, 1, '54654654', 'yhon@hotmail.com', '042585698', 'Chimbote', '2019-05-01', '2019-08-22', 1),
(3, 'Ingrid', 'Principe', 'Guerra', 1, 1, '54545466', 'ingrid@hotmail.com', '045859698', 'Nvo.Chimbote', '2018-08-02', '2019-06-21', 1),
(4, 'Luisa', 'Gonzales', 'Ponce', 0, 1, '87465465', 'luisa@gmail.com', '94585984', '21 de Abril', '2019-06-27', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `mar_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `mar_nombre` varchar(45) NOT NULL,
  `mar_estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`mar_codigo`),
  UNIQUE KEY `mar_nombre_UQ` (`mar_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`mar_codigo`, `mar_nombre`, `mar_estado`) VALUES
(7, 'ETERNIT', 1),
(8, 'NINGUNO', 1),
(9, 'AGA', 1),
(10, 'MODENTIC', 1),
(11, 'CRANE', 1),
(12, 'GMEC ', 1),
(13, 'SUN', 1),
(14, 'GENEBRE', 1),
(15, 'CIM', 1),
(16, 'LUKENHEIMER', 1),
(17, 'REX', 1),
(18, 'GIACOMINI', 1),
(19, 'YUDI', 1),
(20, 'TIANYAN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_ejecucion`
--

DROP TABLE IF EXISTS `orden_ejecucion`;
CREATE TABLE IF NOT EXISTS `orden_ejecucion` (
  `ord_cod` int(11) NOT NULL AUTO_INCREMENT,
  `ord_num_orden` int(11) UNSIGNED NOT NULL,
  `ord_fecha` date NOT NULL,
  `ord_odm` int(11) UNSIGNED NOT NULL,
  `ord_emisor` char(100) NOT NULL,
  `pres_cod` int(11) NOT NULL,
  `ord_estado` char(1) NOT NULL,
  PRIMARY KEY (`ord_cod`),
  UNIQUE KEY `ord_num_orden_UNIQUE` (`ord_num_orden`),
  UNIQUE KEY `ord_odm_UNIQUE` (`ord_odm`),
  KEY `pres_cod_idx` (`pres_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `pres_cod` int(11) NOT NULL AUTO_INCREMENT,
  `cli_codigo` int(11) NOT NULL,
  `pres_lugar_trabajo` varchar(45) NOT NULL,
  `pres_fecha_emision` datetime NOT NULL,
  `pres_hash_emision` varchar(40) NOT NULL,
  `pres_fecha_recepcion` datetime DEFAULT NULL,
  `pres_costo_mano_obra` decimal(8,2) UNSIGNED NOT NULL,
  `pres_costo_materiales` decimal(8,2) UNSIGNED NOT NULL,
  `pres_costo_total` decimal(8,2) UNSIGNED NOT NULL,
  `pres_forma_pago` char(30) NOT NULL,
  `pres_encargado` varchar(100) NOT NULL,
  `pres_situacion` char(1) NOT NULL DEFAULT '1',
  `pres_estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pres_cod`),
  KEY `FK_presupuesto_cliente` (`cli_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presupuesto`
--

INSERT INTO `presupuesto` (`pres_cod`, `cli_codigo`, `pres_lugar_trabajo`, `pres_fecha_emision`, `pres_hash_emision`, `pres_fecha_recepcion`, `pres_costo_mano_obra`, `pres_costo_materiales`, `pres_costo_total`, `pres_forma_pago`, `pres_encargado`, `pres_situacion`, `pres_estado`) VALUES
(1, 1, '', '2019-07-07 00:00:00', '', '0000-00-00 00:00:00', '0.00', '194.00', '194.00', 'contado', 'REQUELME RUBIO', '1', '1'),
(2, 2, 'Coischo', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '20.00', '3068.00', '3088.00', 'contado', 'Chavez', '1', '1'),
(3, 2, 'Santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '25.00', '101.50', '126.50', 'contado', 'chavez', '1', '1'),
(4, 2, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '64.00', '162.40', '226.40', 'contado', 'chavez', '1', '1'),
(5, 2, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '64.00', '162.40', '226.40', 'contado', 'chavez', '1', '1'),
(6, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '48.00', '101.50', '149.50', 'cuotas', 'chavez', '1', '1'),
(7, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '48.00', '101.50', '149.50', 'cuotas', 'chavez', '1', '1'),
(8, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '48.00', '101.50', '149.50', 'cuotas', 'chavez', '1', '1'),
(9, 3, 'rtret', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '25.00', '506.20', '531.20', 'contado', '', '1', '1'),
(10, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0.00', '506.20', '506.20', 'contado', '', '1', '1'),
(11, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0.00', '506.20', '506.20', 'contado', '', '1', '1'),
(12, 1, 'santa', '2019-07-10 00:00:00', '', NULL, '0.00', '202.48', '202.48', 'contado', 'asa', '1', '1'),
(14, 1, '', '2019-07-10 23:52:30', '', NULL, '64.00', '101.50', '165.50', 'contado', '', '1', '1'),
(15, 1, '', '2019-07-10 23:52:31', '', NULL, '64.00', '101.50', '165.50', 'contado', '', '1', '1'),
(16, 1, 'santa', '2019-07-10 23:54:46', '', NULL, '25.00', '506.20', '531.20', 'contado', 'asa', '1', '1'),
(17, 1, 'santa', '2019-07-11 00:00:02', '', NULL, '25.00', '767.00', '792.00', 'contado', 'sas', '1', '1'),
(18, 1, 'santa', '2019-07-11 00:00:06', '', NULL, '25.00', '767.00', '792.00', 'contado', 'sas', '1', '1'),
(19, 1, 'santa', '2019-07-11 00:01:28', '', NULL, '25.00', '767.00', '792.00', 'contado', 'sas', '1', '1'),
(20, 1, 'santa', '2019-07-11 00:01:53', '', NULL, '36.00', '5264.48', '5300.48', 'contado', 'ddas', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `prod_cod` int(11) NOT NULL AUTO_INCREMENT,
  `prov_cod` int(11) NOT NULL,
  `cat_codigo` int(11) NOT NULL,
  `mar_codigo` int(11) NOT NULL,
  `prod_nombre_comercial` varchar(150) NOT NULL,
  `prod_precio_compra` decimal(8,2) UNSIGNED NOT NULL,
  `prod_precio_venta` decimal(8,2) UNSIGNED NOT NULL,
  `prod_stock` decimal(8,0) UNSIGNED NOT NULL,
  `prod_stock_min` int(11) UNSIGNED NOT NULL,
  `prod_stock_reponer` decimal(8,0) UNSIGNED NOT NULL,
  `uni_codigo` int(11) NOT NULL,
  `alm_codigo` int(11) NOT NULL,
  `prod_estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`prod_cod`),
  KEY `alm_codigo_idx` (`alm_codigo`),
  KEY `cat_codigo_idx` (`cat_codigo`),
  KEY `mar_codigo_idx` (`mar_codigo`),
  KEY `prov_codigo_idx` (`prov_cod`),
  KEY `uni_codigo_idx` (`uni_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`prod_cod`, `prov_cod`, `cat_codigo`, `mar_codigo`, `prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, `prod_stock`, `prod_stock_min`, `prod_stock_reponer`, `uni_codigo`, `alm_codigo`, `prod_estado`) VALUES
(1, 1, 11, 10, 'VALVULA COMPUERTA DE 3\" FE.FDO A/BRONCE C-125', '118.00', '153.40', '0', 0, '5', 7, 6, '1'),
(2, 1, 11, 11, 'VALVULA COMPUERTA 3\" FE.FDO. V/A BRD. 150 PSI DIN', '20.30', '20.30', '8', 0, '0', 7, 6, '1'),
(3, 1, 11, 10, 'VALVULA COMPUERTA DE 2\" FE.FDO. A/BRONCE C/BRIDA C-125', '77.88', '101.24', '0', 0, '52', 7, 6, '1'),
(4, 2, 11, 12, 'VALVULA COMPUERTA DE 2\" FE.FDO. C/BRIDA 125PSI ', '47.63', '61.92', '10', 0, '0', 11, 6, '1'),
(5, 2, 11, 12, 'VALVULA CHECK SWING INOX DE 1\" C-316 C/R 200 WOG', '12.92', '16.80', '10', 0, '0', 7, 6, '1'),
(6, 0, 11, 0, 'VALVULA CHECK SWING DE 1\" C/R', '11.59', '15.07', '10', 0, '0', 7, 6, '1'),
(7, 0, 11, 0, 'VALVULA CHECK SWING DE 1\" BCE', '17.80', '23.14', '10', 0, '0', 7, 6, '1'),
(8, 0, 11, 0, 'VALVULA CHECK SWING INOX DE 1.1/2\" C-316 C/R 200 WOG', '25.10', '32.63', '0', 0, '0', 0, 0, '1'),
(9, 0, 11, 0, 'VALVULA CHECK SWING DE 1.1/2\" C/R', '20.88', '27.14', '0', 0, '0', 0, 0, '1'),
(10, 3, 11, 15, 'VALVULA CHECK SWING DE 1.1/2\" BCE', '36.19', '47.05', '0', 0, '0', 0, 0, '1'),
(11, 0, 0, 0, 'VALVULA CHEK SWING DE 3\" FE.FDO.BCE. C/BRIDA ', '155.76', '202.49', '0', 0, '0', 0, 0, '1'),
(12, 1, 11, 10, 'VALVULA CHEK SWING DE 3\" FE.FDO.BCE.', '92.00', '119.60', '10', 0, '0', 7, 6, '1'),
(13, 3, 11, 17, 'VALVULA CHEK SWING DE 3\" FE.FDO.BCE.', '98.93', '128.61', '0', 0, '0', 0, 0, '1'),
(14, 0, 0, 0, 'VALVULA CHEK SWING DE 4\" FE.FDO.BCE.', '130.84', '170.09', '0', 0, '0', 0, 0, '1'),
(15, 0, 0, 0, 'VÁLVULA CHEK SWING 5\" FE. FDO.', '232.50', '302.25', '0', 0, '0', 0, 0, '1'),
(16, 0, 0, 0, 'VALVULA CHECK SWING INOX DE 3/4\" C-316 C/R 200 WOG', '9.97', '12.96', '0', 0, '0', 0, 0, '1'),
(17, 0, 0, 0, 'VALVULA CHECK SWING DE 3/4\" C/R ', '7.24', '9.41', '0', 0, '0', 0, 0, '1'),
(18, 3, 11, 15, 'VALVULA CHECK SWING DE 3/4\" C/R BCE', '12.11', '15.74', '10', 0, '0', 7, 6, '1'),
(19, 5, 11, 17, 'VALVULA COMPUERTA DE 3\" FE. C/B', '130.84', '170.09', '0', 0, '0', 7, 6, '1'),
(20, 0, 0, 0, 'VALVULA CHEK SWING DE 2\" FE. FDO.BRONCE C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(21, 0, 0, 0, 'VALVULAS COMPUERTA DE 2\" FE.FDO. BRONCE  C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(22, 0, 0, 0, 'VALVULAS COMPUERTA DE 2\" FE.FDO. BRONCE  C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(23, 0, 0, 0, 'VALVULAS COMPUERTA DE 2\" FE.FDO. BRONCE  C/BRIDA ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(24, 0, 0, 0, 'VALVULAS DE COMPUERTA DE 2 1/2\" BRONCE C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(25, 0, 0, 0, 'VALVULAS DE COMPUERTA DE 2 1/2\" FE C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(26, 0, 0, 0, 'VALVULAS DE COMPUERTA DE 4\" FE C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(27, 0, 0, 0, 'VALVULA  COMPUERTA 2.1/2\" BRONCE EUROVOL.', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(28, 0, 0, 0, 'VALVULA CHECK DE 1.1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(29, 0, 0, 0, 'VALVULA CHECK CANASTILLA DE 1\"  BCE', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(30, 0, 0, 0, 'VALVULA CHECK DE PIE TIPO CANASTILLA DE 1.1/2\" C/R BCE.', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(31, 0, 0, 0, 'VALVULA CHECK DE PIE TIPO CANASTILLA DE 1.1/2\" C/R ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(32, 0, 0, 0, 'VALVULA CHECK DE PIE CANASTILLA DE 1.1/2\" C/R BCE', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(33, 0, 0, 0, 'VALVULA CIERRE RAPIDO 1.1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(34, 0, 0, 0, 'VALV ANGULAR DE 1.1/2\" BCE. C/R P/GRIFO CONTRAINCENDIO', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(35, 0, 0, 0, 'VALV ANGULAR DE 1.1/2\" BCE. C/R P/GRIFO CONTRAINCENDIO ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(36, 0, 0, 0, 'VALVULA ANGULAR 1.1/2\" FM X 300 PSI', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(37, 0, 0, 0, 'VALVULA ANGULAR 2.1/2\" FM X 300 PSI ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(38, 0, 0, 0, 'ACOPLE DE BCE. D1 NST PL A70', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(39, 0, 0, 0, 'VALVULA CHECK C/B LENGÜETA ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(40, 0, 0, 0, 'VALVULA CHECK C/B 2\" F.FUND', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(41, 0, 0, 0, 'VALVULAS CHEK SWING FE. C/B DE 4\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(42, 0, 0, 0, 'VALVULA BOLA DE 1/2\" GALV. COPLAS ROSCABLE 1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(43, 0, 0, 0, 'VALVULA BOLA 1\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(44, 0, 0, 0, 'VALVULAS DE BOLA DE 1. 1/4\" BRONCE C/ROSCA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(45, 0, 0, 0, 'VALVULA C/R DE 1.1/4\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(46, 0, 0, 0, 'VALVULA BOLA INOX DE 1\"  C-316 x 1000 WOG', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(47, 0, 0, 0, 'VALVULA BOLA BCE. DE 1\"  P/TOTAL PN 25', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(48, 0, 0, 0, 'VALVULA BOLA BCE. DE 1\"  P/TOTAL', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(49, 0, 0, 0, 'VALVULAS CHEK DE 2 1/2\" BRONCE C/BRIDA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(50, 0, 0, 0, 'VALVULA BOLA INOX DE 1/4\" C-316 x 1000 WOG ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(51, 0, 0, 0, 'VALVULA BOLA BCE. DE 1/4\"  P/TOTAL PN 25', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(52, 0, 0, 0, 'VALVULA BOLA BCE. DE 1/4\"  P/TOTAL ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(53, 0, 0, 0, 'VALVULA DE BOLA C/R 1\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(54, 0, 0, 0, 'VALVULA DE BOLA C/R 1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(55, 0, 0, 0, 'VALVULA BOLA INOX DE 1/2\" C-316 x 1000 WOG', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(56, 0, 0, 0, 'VALVULA BOLA BCE. DE 1/2\"  P/TOTAL PN 25', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(57, 0, 0, 0, 'VALVULA BOLA BCE. DE 1/2\"  P/TOTAL ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(58, 0, 0, 0, 'VALVULA DE BOLA C/R 1.1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(59, 0, 0, 0, 'VALVULA BOLA C.R. 1.1/2\" ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(60, 0, 0, 0, 'VALVULA BOLA C.R. 1.1/2\" BRONCE', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(61, 0, 0, 0, 'VALVULA BOLA INOX DE 1.1/2\" C-316 x 1000 WOG -', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(62, 0, 0, 0, 'VALVULA BOLA BCE. DE 1.1/2\"  P/TOTAL PN 25', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(63, 0, 0, 0, 'VALVULA BOLA BCE. DE 1.1/2\"  P/TOTAL ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(64, 0, 0, 0, 'VALVULA COMPUERTA DE 1\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(65, 0, 0, 0, 'VALVULA COMPUERTA DE 1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(66, 0, 0, 0, 'VALVULA DE 1/2\" C.R.', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(67, 0, 0, 0, 'VALVULA C/R 2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(68, 0, 0, 0, 'VALVULA BOLA 1/2\" C/R ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(69, 0, 0, 0, 'VALVULA COMPUERTA 1.1/2\" C/R', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(70, 0, 0, 0, 'VALVULA COMPUERTA DE 5\" FE C/B x 125 LBS', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(71, 0, 0, 0, 'VALVULA CHECK SWING DE 5\" FE. FDO. BRIDADA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(72, 0, 0, 0, 'VALVULA CHECK SWING DE 5\" FE. FDO. BRIDADA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(73, 0, 0, 0, 'VALVULA CHECK SWING 5\" FE. FDO. 216 ANSI', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(74, 0, 0, 0, 'VALVULA ANGULAR 4\" STOP CHECK BRIDADA DIAM.100 DIN MATERIAL DUCTIL IRON - TOMA DE FONDO PN16', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(75, 0, 0, 0, 'VALVULA ANGULAR 5\" C/Acero WCB A-216 Int. De 125 mm.PN16-Norma DIN', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(76, 0, 0, 0, 'VALVULA ANGULAR 5\" STOP CHECK BRIDADA DIAM.125 DIN MATERIAL DUCTIL IRON - TOMA DE FONDO PN16', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(77, 0, 0, 0, 'VALVULA COMPUERTA 5\" FE. BRIDADA ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(78, 0, 0, 0, 'VALVULA GLOBO ANGULAR DE 6\" CLASE 150 ACERO', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(79, 0, 0, 0, 'VALVULA GLOBO ANGULAR DE 6\" ACERO CARBONO BRIDADA 150 LB.', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(80, 0, 0, 0, 'VALVULA ANGULAR 6\" C/Acero WCB A-216 Int. Ac.Inox.De 150 mm.PN16-Norma DIN', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(81, 0, 0, 0, 'VALVULA GLOBO 5\" FE. BRIDADA V/A A/BCE. 125 LBS', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(82, 0, 0, 0, 'VALVULA MARIPOSA 5\" WAFER FE. DISCO C-316 A/EPDM C/.', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(83, 0, 0, 0, 'VALVULA MARIPOSA PVC 6\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(84, 0, 0, 0, 'VALVULA MARIPOSA 6\" ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(85, 0, 0, 0, 'VALVULA MARIPOSA 6\" FE. C/PALANCA', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(86, 0, 0, 0, 'VALVULA MARIPOSA 3\" PVC', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(87, 0, 0, 0, 'VALVULA MARIPOSA 3\" PVC', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(88, 0, 0, 0, 'VALVULA MARIPOSA 5\" PVC', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(89, 0, 0, 0, 'VÁLVULA MARIPOSA 5\" WAFER.FE. DISCO', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(90, 0, 0, 0, 'VÁLVULA MARIPOSA 5\" ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(91, 0, 0, 0, 'VALVULA 1/4\" - C/R ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(92, 0, 0, 0, 'VALVULA BOLA 3/4\" C/R', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(93, 0, 0, 0, 'VALVULA BOLA  2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(94, 0, 0, 0, 'VALVULA BOLA  1/2\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(95, 0, 0, 0, 'VALVULA MARIPOSA 3/8\"', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(96, 0, 0, 0, 'VALVULA COMPUERTA 3\" C/R ', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(97, 0, 0, 0, 'VALVULA  DE 3/4\" C/R', '0.00', '0.00', '0', 0, '0', 0, 0, '1'),
(98, 1, 11, 8, 'VALVULA #1', '16.00', '20.00', '3', 0, '0', 8, 6, '1'),
(99, 2, 12, 10, 'PERNO #20', '2.00', '100.00', '100', 0, '0', 8, 6, '1'),
(100, 4, 12, 10, 'PERNO #2', '2.00', '100.00', '120', 5, '0', 8, 6, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `prov_cod` int(11) NOT NULL AUTO_INCREMENT,
  `prov_razon_social` char(100) NOT NULL,
  `prov_ruc` char(11) NOT NULL,
  `prov_email` char(50) NOT NULL,
  `prov_telefono` char(9) NOT NULL,
  `prov_direccion` varchar(50) NOT NULL,
  `prov_estado` char(1) NOT NULL,
  PRIMARY KEY (`prov_cod`),
  UNIQUE KEY `proveedor_UQ` (`prov_telefono`,`prov_ruc`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`prov_cod`, `prov_razon_social`, `prov_ruc`, `prov_email`, `prov_telefono`, `prov_direccion`, `prov_estado`) VALUES
(1, 'PROIINSA C.G.SRL-PISFIL&PARODI C.A.SRL', '20445035069', '-', '-', 'JR. LADISLAO ESPINAR NRO. 405 INT. 304 CASCO URBAN', '1'),
(2, 'VANECO E.I.R.LTDA.', '20122913881', '-', '-', 'AV. GRAL ANDRES RAZURI NRO. 207 URB. MARANGA (ALT ', '1'),
(3, 'REPRESENTAC.COMERCIALES FIORELLA EIRLTDA', '20309339151', '-', '-', 'AV. MADRE DE DIOS NRO. 723 CERCADO MADRE DE DIOS -', '1'),
(4, 'IMPORTADORA Y DISTRIBUIDORA SHARON E.I.R.L.', '20557155644', '-', '-', 'AV. MICAELA BASTIDAS NRO. 601 URB. SAN AGUSTIN LIM', '1'),
(5, 'SAS IMPORT S.A.C', '20543483983', '-', '-', 'CAL.VULCANO LOTE. 01 URB. SAN ROQUE (ESQ CA VULCAN', '1'),
(6, 'ENESA S.R.L.', '20114200523', '-', '-', 'AV. JOSE PARDO NRO. 2368 A.H. MIRAFLORES 1 ZONA AN', '1'),
(7, 'AMSEQ S.A.', '20600853318', '-', '-', 'CAL.SANTA TERESA DE JESUS NRO. 139 URB. LA MERCED ', '1'),
(8, 'JAHESA S.A.', '20101392369', '-', '-', 'CAL.LAMBDA NRO. 180 URB. PARQUE INTERN. IND. Y COM', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_cod` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) NOT NULL,
  `rol_fecha_reg` datetime NOT NULL,
  `rol_estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`rol_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

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
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `tdoc_cod` int(11) NOT NULL AUTO_INCREMENT,
  `tdoc_nombre` char(50) NOT NULL,
  `tdoc_estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`tdoc_cod`),
  UNIQUE KEY `tdoc_nombre_UNIQUE` (`tdoc_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tdoc_cod`, `tdoc_nombre`, `tdoc_estado`) VALUES
(1, 'DOCUMENTO NACIONAL DE IDENTIDAD (DNI)', 1),
(2, 'REGISTRO ÚNICO DE CONTRIBUYENTES', 1),
(6, 'PASAPORTE', 1),
(9, 'CARNET DE EXTRANJERIA', 1),
(10, 'CÉDULA DIPLOMÁTICA DE IDENTIDAD', 1),
(11, 'OTROS TIPOS DE DOCUMENTOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `uni_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `uni_descripcion` varchar(45) NOT NULL,
  `uni_estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`uni_codigo`),
  UNIQUE KEY `descripcion_UQ` (`uni_descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`uni_codigo`, `uni_descripcion`, `uni_estado`) VALUES
(1, 'BOBINAS                                      ', 1),
(2, 'DOCENA', 1),
(3, 'HOJA', 1),
(4, 'JUEGO  ', 1),
(5, 'KILOGRAMO  ', 1),
(6, 'TUBOS', 1),
(7, 'UNIDAD (SERVICIOS)', 1),
(8, 'UNIDAD (BIENES)', 1),
(9, 'PULGADAS', 1),
(10, 'PLACAS', 1),
(11, 'PIEZAS', 1),
(12, 'PAQUETE ', 1),
(13, 'CAJA', 1),
(14, 'KIT', 1),
(16, 'METRO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usu_cod` int(11) NOT NULL AUTO_INCREMENT,
  `emp_codigo` int(11) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_clave` varchar(50) NOT NULL,
  `rol_cod` int(11) NOT NULL,
  `usu_ultimo_acceso` datetime DEFAULT NULL,
  `usu_fecha_reg` datetime NOT NULL,
  `usu_situacion` char(1) NOT NULL,
  `usu_estado` char(1) NOT NULL,
  PRIMARY KEY (`usu_cod`),
  UNIQUE KEY `Índice 1` (`usu_nombre`),
  KEY `FK_usuario_empleado_emp_codigo` (`emp_codigo`),
  KEY `FK_usuario_rol_rol_cod` (`rol_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_cod`, `emp_codigo`, `usu_nombre`, `usu_clave`, `rol_cod`, `usu_ultimo_acceso`, `usu_fecha_reg`, `usu_situacion`, `usu_estado`) VALUES
(1, 1, 'admin', '202cb962ac59075b964b07152d234b70', 2, '2019-05-30 00:49:18', '2019-05-30 00:49:25', '1', '1'),
(3, 2, 'compras', '55f584bac6a0782b4d032b4ddc18ed57', 3, NULL, '2019-05-30 13:01:32', '1', '1'),
(5, 3, 'gerente', '5c515b74ab026af01b196f3d044f744c', 16, NULL, '2019-05-30 13:02:58', '1', '1'),
(6, 1, 'thewil', '2895db886ca73a30ba7437e3cdee5b8e', 16, NULL, '2019-06-26 04:43:19', '1', '1');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
