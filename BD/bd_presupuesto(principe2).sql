-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2019 a las 17:36:19
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
    -- actividad_empleado no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_deactivate` (IN `_aemp_codigo` INT(11))  BEGIN
    -- actividad_empleado no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_empleado_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_empleado_delete` (IN `_aemp_codigo` INT(11))  BEGIN
    -- actividad_empleado no tiene columna estado
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
    -- actividad_productos no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_deactivate` (IN `_actpro_cod` INT(11))  BEGIN
    -- actividad_productos no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_delete` (IN `_actpro_cod` INT(11))  BEGIN
    -- actividad_productos no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_getByID` (IN `_actpro_cod` INT(11))  BEGIN
    SELECT actpro_cod, act.act_cod, act_descripcion, prod.prod_cod, actpro_precio, actpro_cant_presup,
           actpro_cant_usado, actpro_total
    FROM actividad_productos actpro
             INNER JOIN actividad act ON actpro.act_cod = act.act_cod
             INNER JOIN producto prod ON actpro.prod_cod = prod.prod_cod
    WHERE actpro.actpro_cod = _actpro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_getRow` (IN `_actpro_cod` INT(11))  BEGIN
    SELECT actpro_cod, act.act_cod, act_descripcion, prod.prod_cod, actpro_precio, actpro_cant_presup,
           actpro_cant_usado, actpro_total
    FROM actividad_productos actpro
             INNER JOIN actividad act ON actpro.act_cod = act.act_cod
             INNER JOIN producto prod ON actpro.prod_cod = prod.prod_cod
    WHERE actpro.actpro_cod = _actpro_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_insert` (IN `_act_cod` INT(11), IN `_prod_cod` INT(11), IN `_actpro_precio` DECIMAL(8,2), IN `_actpro_cant_presup` INT(11), IN `_actpro_cant_usado` INT(11), IN `_actpro_total` DECIMAL(8,2), OUT `_actpro_cod` INT(11))  BEGIN
    INSERT INTO actividad_productos (
        act_cod,
        prod_cod,
        actpro_precio,
        actpro_cant_presup,
        actpro_cant_usado,
        actpro_total
    )
    VALUES (
               _act_cod,
               _prod_cod,
               _actpro_precio,
               _actpro_cant_presup,
               _actpro_cant_usado,
               _actpro_total
           );
    SET _actpro_cod = LAST_INSERT_ID();
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_list` (IN `_buscar` VARCHAR(50))  BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT actpro_cod, act.act_cod, act_descripcion, prod.prod_cod, actpro_precio, actpro_cant_presup,
           actpro_cant_usado, actpro_total
    FROM actividad_productos actpro
             INNER JOIN actividad act ON actpro.act_cod = act.act_cod
             INNER JOIN producto prod ON actpro.prod_cod = prod.prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_listCbo` (IN `_actpro_cod` INT(11))  BEGIN
    SELECT actpro_cod, act.act_cod, act_descripcion, prod.prod_cod, actpro_precio, actpro_cant_presup,
           actpro_cant_usado, actpro_total
    FROM actividad_productos actpro
             INNER JOIN actividad act ON actpro.act_cod = act.act_cod
             INNER JOIN producto prod ON actpro.prod_cod = prod.prod_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_actividad_productos_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actividad_productos_update` (IN `_actpro_cod` INT(11), IN `_act_cod` INT(11), IN `_prod_cod` INT(11), IN `_actpro_precio` DECIMAL(8,2), IN `_actpro_cant_presup` INT(11), IN `_actpro_cant_usado` INT(11), IN `_actpro_total` DECIMAL(8,2))  BEGIN
    UPDATE actividad_productos
    SET act_cod = _act_cod,
        prod_cod = _prod_cod,
        actpro_precio = _actpro_precio,
        actpro_cant_presup = _actpro_cant_presup,
        actpro_cant_usado = _actpro_cant_usado,
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
	-- detalle_presupuesto no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_deactivate` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	-- detalle_presupuesto no tiene columna estado
END$$

DROP PROCEDURE IF EXISTS `pa_detalle_presupuesto_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_presupuesto_delete` (IN `_pre_cod` INT(11), IN `_pro_cod` INT(11))  BEGIN
	-- detalle_presupuesto no tiene columna estado
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

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_activate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_activate` (IN `_ord_cod` INT(11))  BEGIN
	UPDATE orden_ejecucion
	SET ord_estado = 1
	WHERE ord_cod = _ord_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_deactivate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_deactivate` (IN `_ord_cod` INT(11))  BEGIN
	UPDATE orden_ejecucion
	SET ord_estado = 2
	WHERE ord_cod = _ord_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_delete` (IN `_ord_cod` INT(11))  BEGIN
	UPDATE orden_ejecucion
	SET ord_estado = 0
	WHERE ord_cod = _ord_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_getByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_getByID` (IN `_ord_cod` INT(11))  BEGIN
	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_cod = _ord_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_getRow`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_getRow` (IN `_ord_cod` INT(11))  BEGIN
	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_cod = _ord_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_insert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_insert` (IN `_ord_num_orden` INT(11), IN `_ord_fecha` DATE, IN `_ord_odm` INT(11), IN `_ord_emisor` CHAR(100), IN `_pres_cod` INT(11), OUT `_ord_cod` INT(11))  BEGIN
    SET _ord_fecha = if(_ord_fecha <> '0000-00-00 00:00:00', _ord_fecha, now());

	INSERT INTO orden_ejecucion (
		ord_num_orden,
		ord_fecha,
		ord_odm,
		ord_emisor,
		pres_cod,
		ord_estado
	)
	VALUES (
		_ord_num_orden,
		_ord_fecha,
		_ord_odm,
		_ord_emisor,
		_pres_cod,
		1
	);
	SET _ord_cod = LAST_INSERT_ID();
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_list` (IN `_buscar` VARCHAR(50), IN `_ord_estado` TINYINT UNSIGNED)  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_estado = _ord_estado;
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_listCbo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_listCbo` (IN `_ord_cod` INT(11))  BEGIN
	SELECT ord_cod, ord_num_orden, ord_fecha, ord_odm, ord_emisor, pres.pres_cod, ord_estado
	FROM orden_ejecucion ord
		INNER JOIN presupuesto pres ON ord.pres_cod = pres.pres_cod
	WHERE ord.ord_estado = 1 OR (ord.ord_cod = _ord_cod);
END$$

DROP PROCEDURE IF EXISTS `pa_orden_ejecucion_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_orden_ejecucion_update` (IN `_ord_cod` INT(11), IN `_ord_num_orden` INT(11), IN `_ord_fecha` DATE, IN `_ord_odm` INT(11), IN `_ord_emisor` CHAR(100), IN `_pres_cod` INT(11))  BEGIN
	UPDATE orden_ejecucion
	SET ord_num_orden = _ord_num_orden,
		ord_fecha = _ord_fecha,
		ord_odm = _ord_odm,
		ord_emisor = _ord_emisor,
		pres_cod = _pres_cod
	WHERE ord_cod = _ord_cod;
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

DROP PROCEDURE IF EXISTS `pa_presupuesto_getDetalles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_getDetalles` (IN `_pres_cod` INT(11))  BEGIN
    SELECT pres_cod, prod_cod, prod_nombre_comercial, prod_stock,
           dpre_cantidad, dpre_precio
    FROM detalle_presupuesto presdet
             INNER JOIN presupuesto pres ON presdet.pre_cod = pres.pres_cod
             INNER JOIN producto prod ON presdet.pro_cod = prod.prod_cod
    WHERE pres.pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_getManoObra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_getManoObra` (IN `_pres_cod` INT(11))  BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
             INNER JOIN presupuesto p ON act.pres_cod = p.pres_cod
    WHERE p.pres_cod = _pres_cod;
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_getManoObra2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_getManoObra2` (IN `_pres_cod` INT(11))  BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
             INNER JOIN presupuesto p ON act.pres_cod = p.pres_cod
    WHERE p.pres_cod = _pres_cod;
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
END$$

DROP PROCEDURE IF EXISTS `pa_presupuesto_list`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_list` (IN `_buscar` VARCHAR(50), IN `_pres_estado` TINYINT UNSIGNED)  BEGIN
	SET @aux = _buscar;
	SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

	SELECT pres_cod, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
		   pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
		   pres_costo_total, cli.cli_codigo, cli_razon_social, pres_encargado, pres_situacion
	FROM presupuesto pre
		INNER JOIN cliente cli ON pre.cli_codigo = cli.cli_codigo
	WHERE pre.pres_estado = _pres_estado
	ORDER BY pres_cod DESC;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_presupuesto_update` (IN `_pres_cod` INT(11), IN `_pres_forma_pago` CHAR(30), IN `_pres_lugar_trabajo` VARCHAR(45), IN `_pres_costo_mano_obra` DECIMAL(8,2), IN `_pres_costo_materiales` DECIMAL(8,2), IN `_pres_costo_total` DECIMAL(8,2), IN `_cli_codigo` INT(11), IN `_pres_encargado` VARCHAR(100))  BEGIN
	UPDATE presupuesto
	SET pres_forma_pago = _pres_forma_pago,
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
    INSERT INTO `actividad_productos` (`actpro_cod`, `act_cod`, `prod_cod`, `actpro_precio`,
    actpro_cant_presup, `actpro_total`)
        VALUES (p_actpro_cod, p_act_cod, p_prod_cod, p_actpro_precio, p_actpro_cantidad, p_actpro_total);
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
CREATE TABLE `actividad` (
  `act_cod` int(11) NOT NULL,
  `pres_cod` int(11) NOT NULL,
  `act_descripcion` varchar(100) NOT NULL,
  `act_fecha_inicio` datetime DEFAULT NULL,
  `act_fecha_fin` datetime DEFAULT NULL,
  `act_costo_total` decimal(8,2) NOT NULL,
  `act_estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`act_cod`, `pres_cod`, `act_descripcion`, `act_fecha_inicio`, `act_fecha_fin`, `act_costo_total`, `act_estado`) VALUES
(1, 1, 'Mano de obra', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.00', ''),
(2, 16, 'actividades', NULL, NULL, '200.00', '1'),
(3, 16, 'actividades', NULL, NULL, '200.00', '1'),
(4, 19, 'Mano de obra', NULL, NULL, '25.00', '1'),
(5, 20, 'Mano de obra', NULL, NULL, '36.00', '1'),
(6, 22, 'Mano de obra', NULL, NULL, '30.00', '1'),
(7, 23, 'Mano de obra', NULL, NULL, '25.00', '1'),
(8, 24, 'Mano de obra', NULL, NULL, '25.00', '1'),
(9, 25, 'Mano de obra', NULL, NULL, '64.00', '1'),
(10, 26, 'Mano de obra', NULL, NULL, '64.00', '1'),
(11, 27, 'Mano de obra', NULL, NULL, '4.00', '1'),
(12, 28, 'Mano de obra', NULL, NULL, '0.00', '1'),
(13, 29, 'Mano de obra', NULL, NULL, '0.00', '1'),
(14, 30, 'Mano de obra', NULL, NULL, '0.00', '1'),
(15, 31, 'Mano de obra', NULL, NULL, '0.00', '1'),
(16, 32, 'Mano de obra', NULL, NULL, '0.00', '1'),
(17, 33, 'Mano de obra', NULL, NULL, '0.00', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_empleado`
--

DROP TABLE IF EXISTS `actividad_empleado`;
CREATE TABLE `actividad_empleado` (
  `aemp_codigo` int(11) NOT NULL,
  `act_cod` int(11) NOT NULL,
  `emp_cod` int(11) NOT NULL,
  `aemp_pago_dia` decimal(8,2) UNSIGNED NOT NULL,
  `aemp_cantidad_dias` tinyint(3) UNSIGNED NOT NULL,
  `aemp_total` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad_empleado`
--

INSERT INTO `actividad_empleado` (`aemp_codigo`, `act_cod`, `emp_cod`, `aemp_pago_dia`, `aemp_cantidad_dias`, `aemp_total`) VALUES
(1, 5, 3, '6.00', 6, '36.00'),
(2, 6, 2, '5.00', 6, '30.00'),
(3, 7, 4, '5.00', 5, '25.00'),
(4, 8, 4, '5.00', 5, '25.00'),
(5, 9, 4, '8.00', 8, '64.00'),
(6, 10, 2, '8.00', 8, '64.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_productos`
--

DROP TABLE IF EXISTS `actividad_productos`;
CREATE TABLE `actividad_productos` (
  `actpro_cod` int(11) NOT NULL,
  `act_cod` int(11) NOT NULL,
  `prod_cod` int(11) NOT NULL,
  `actpro_precio` decimal(8,2) UNSIGNED NOT NULL,
  `actpro_cant_presup` int(11) UNSIGNED NOT NULL,
  `actpro_cant_usado` int(11) UNSIGNED NOT NULL,
  `actpro_total` decimal(8,2) UNSIGNED NOT NULL
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
(6, 'ALMACEN1', 'Villa Victoria mz r lt 4'),
(7, 'ALMACEN2', 'VILLA MARIA R 6'),
(9, 'ALMACEN', 'S/N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `cat_cod` int(11) NOT NULL,
  `cat_nombre` char(10) NOT NULL,
  `cat_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
CREATE TABLE `cliente` (
  `cli_codigo` int(11) NOT NULL,
  `cli_razon_social` varchar(45) NOT NULL,
  `cli_ruc` varchar(45) NOT NULL,
  `cli_direccion` varchar(45) NOT NULL,
  `cli_telefono` char(9) NOT NULL,
  `cli_email` varchar(100) NOT NULL,
  `cli_estado` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cli_codigo`, `cli_razon_social`, `cli_ruc`, `cli_direccion`, `cli_telefono`, `cli_email`, `cli_estado`) VALUES
(1, 'COPEINCA SAC', '20224748711', 'CAL.FRANCISCO GRAÃ‘A NRO. 155 URB. SANTA CATA', '-', 'cope@hotmail.com', '1'),
(2, 'CFG INVESTMENT SAC', '20512868046', 'CAL.FRANCISCO GRAÃ‘A NRO. 155 URB. SANTA CATA', '-', 'cfg@gmail.com', '1'),
(3, 'Pesquera Tambo S.R.L', '20324519778', 'CAL.TUPAC AMARU NRO. 194 DPTO. 2 (CERCA PARAD', '945859698', 'tambo@hotmail.com', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `comp_cod` int(11) NOT NULL,
  `prov_cod` int(11) NOT NULL,
  `comp_fecha` date NOT NULL,
  `comp_costo_total` double(8,2) UNSIGNED NOT NULL,
  `comp_estado` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

DROP TABLE IF EXISTS `compra_detalle`;
CREATE TABLE `compra_detalle` (
  `comp_cod` int(11) NOT NULL,
  `prod_cod` int(11) NOT NULL,
  `cdet_cantidad` int(11) UNSIGNED NOT NULL,
  `cdet_total` double(8,2) UNSIGNED NOT NULL,
  `cdet_importe` double(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conformidad`
--

DROP TABLE IF EXISTS `conformidad`;
CREATE TABLE `conformidad` (
  `conf_cod` int(11) NOT NULL,
  `pres_cod` int(11) NOT NULL,
  `conf_fecha_inicio` date NOT NULL,
  `conf_fecha_fin` date NOT NULL,
  `conf_act_conformidad` int(11) UNSIGNED NOT NULL,
  `conf_estado` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presupuesto`
--

DROP TABLE IF EXISTS `detalle_presupuesto`;
CREATE TABLE `detalle_presupuesto` (
  `pre_cod` int(11) NOT NULL,
  `pro_cod` int(11) NOT NULL,
  `dpre_cantidad` decimal(8,2) UNSIGNED NOT NULL,
  `dpre_precio` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_presupuesto`
--

INSERT INTO `detalle_presupuesto` (`pre_cod`, `pro_cod`, `dpre_cantidad`, `dpre_precio`) VALUES
(1, 1, '1.00', '153.40'),
(1, 2, '2.00', '20.30'),
(2, 2, '1.00', '20.30'),
(10, 2, '2.00', '20.30'),
(16, 3, '5.00', '101.24'),
(17, 1, '5.00', '153.40'),
(18, 1, '5.00', '153.40'),
(19, 1, '5.00', '153.40'),
(20, 3, '52.00', '101.24'),
(22, 4, '20.00', '61.92'),
(23, 98, '2.00', '20.00'),
(24, 4, '5.00', '61.92'),
(25, 4, '4.00', '61.92'),
(26, 3, '9.00', '101.24'),
(27, 3, '2.00', '101.24'),
(27, 99, '2.00', '100.00'),
(28, 3, '1.00', '101.24'),
(29, 3, '1.00', '101.24'),
(30, 1, '1.00', '153.40'),
(31, 98, '1.00', '3.12'),
(32, 2, '1.00', '20.30'),
(33, 2, '1.00', '20.30');

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
  `emp_sexo` tinyint(1) NOT NULL,
  `tdoc_cod` int(11) NOT NULL,
  `emp_numero_doc` char(12) NOT NULL,
  `emp_correo` varchar(50) NOT NULL,
  `emp_telefono` char(9) NOT NULL,
  `emp_direccion` varchar(45) NOT NULL,
  `emp_fecha_inicio_trabajo` date NOT NULL,
  `emp_fecha_fin_trabajo` date NOT NULL,
  `emp_estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
CREATE TABLE `marca` (
  `mar_codigo` int(11) NOT NULL,
  `mar_nombre` varchar(45) NOT NULL,
  `mar_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
CREATE TABLE `orden_ejecucion` (
  `ord_cod` int(11) NOT NULL,
  `ord_num_orden` int(11) UNSIGNED NOT NULL,
  `ord_fecha` date NOT NULL,
  `ord_odm` bigint(20) NOT NULL,
  `ord_emisor` char(100) NOT NULL,
  `pres_cod` int(11) NOT NULL,
  `ord_estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_ejecucion`
--

INSERT INTO `orden_ejecucion` (`ord_cod`, `ord_num_orden`, `ord_fecha`, `ord_odm`, `ord_emisor`, `pres_cod`, `ord_estado`) VALUES
(1, 4294967295, '2019-07-12', 8300004976, 'JOSE ROJAS LEON', 2, '1'),
(5, 2147483647, '2019-07-12', 2147483647, 'JOSÃ‰ CUZCO', 2, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE `presupuesto` (
  `pres_cod` int(11) NOT NULL,
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
  `pres_estado` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presupuesto`
--

INSERT INTO `presupuesto` (`pres_cod`, `cli_codigo`, `pres_lugar_trabajo`, `pres_fecha_emision`, `pres_hash_emision`, `pres_fecha_recepcion`, `pres_costo_mano_obra`, `pres_costo_materiales`, `pres_costo_total`, `pres_forma_pago`, `pres_encargado`, `pres_situacion`, `pres_estado`) VALUES
(1, 1, '', '2019-07-07 00:00:00', '', '2019-07-11 18:40:29', '0.00', '194.00', '194.00', '1', 'REQUELME RUBIO', '2', '1'),
(2, 2, 'Coischo', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0.00', '20.30', '20.30', '1', 'Chavez', '1', '1'),
(3, 2, 'Santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '25.00', '101.50', '126.50', '1', 'chavez', '1', '1'),
(4, 2, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '64.00', '162.40', '226.40', '1', 'chavez', '1', '1'),
(5, 2, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '64.00', '162.40', '226.40', '1', 'chavez', '1', '1'),
(6, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '48.00', '101.50', '149.50', '1', 'chavez', '1', '1'),
(7, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '48.00', '101.50', '149.50', '1', 'chavez', '1', '1'),
(8, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '48.00', '101.50', '149.50', '1', 'chavez', '1', '1'),
(9, 3, 'rtret', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '25.00', '506.20', '531.20', '1', 'chavez', '1', '1'),
(10, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0.00', '40.60', '40.60', '1', 'chavez', '1', '1'),
(11, 1, 'santa', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0.00', '506.20', '506.20', '1', 'chavez', '1', '1'),
(12, 1, 'santa', '2019-07-10 00:00:00', '', NULL, '0.00', '202.48', '202.48', '1', 'chavez', '1', '1'),
(14, 1, '', '2019-07-10 23:52:30', '', NULL, '64.00', '101.50', '165.50', '1', 'chavez', '1', '1'),
(15, 1, '', '2019-07-10 23:52:31', '', NULL, '64.00', '101.50', '165.50', '1', 'chavez', '1', '1'),
(16, 1, 'santa', '2019-07-10 23:54:46', '', NULL, '25.00', '506.20', '531.20', '1', 'chavez', '1', '1'),
(17, 1, 'santa', '2019-07-11 00:00:02', '', NULL, '25.00', '767.00', '792.00', '1', 'chavez', '1', '1'),
(18, 1, 'santa', '2019-07-11 00:00:06', '', NULL, '25.00', '767.00', '792.00', '1', 'chavez', '1', '1'),
(19, 1, 'santa', '2019-07-11 00:01:28', '', NULL, '25.00', '767.00', '792.00', '1', 'chavez', '1', '1'),
(20, 1, 'santa', '2019-07-11 00:01:53', '', NULL, '36.00', '5264.48', '5300.48', '1', 'chavez', '1', '1'),
(21, 1, 'santa', '2019-07-11 16:09:16', '', NULL, '100.00', '120.00', '220.00', '1', 'chavez', '1', '1'),
(22, 1, 'santa', '2019-07-11 16:09:49', 'b6d767d2f8ed5d21a44b0e5886680cb9', NULL, '30.00', '1238.40', '1268.40', '1', 'chavez', '1', '1'),
(23, 1, 'santa', '2019-07-11 16:14:37', '37693cfc748049e45d87b8c7d8b9aacd', NULL, '25.00', '40.00', '65.00', '1', 'chavez', '1', '1'),
(24, 3, 'santa', '2019-07-11 16:23:45', '1ff1de774005f8da13f42943881c655f', NULL, '25.00', '309.60', '334.60', '2', 'chavez', '1', '1'),
(25, 2, 'santa', '2019-07-11 16:24:41', '8e296a067a37563370ded05f5a3bf3ec', NULL, '64.00', '247.68', '311.68', '1', 'chavez', '1', '1'),
(26, 3, 'santa', '2019-07-11 16:43:53', '4e732ced3463d06de0ca9a15b6153677', NULL, '64.00', '911.16', '975.16', '1', 'chavez', '1', '1'),
(27, 3, 'santa', '2019-07-11 17:15:56', '02e74f10e0327ad868d138f2b4fdd6f0', NULL, '25.00', '402.48', '427.48', '1', 'chavez', '1', '1'),
(28, 1, '', '2019-07-12 02:15:16', '33e75ff09dd601bbe69f351039152189', NULL, '0.00', '101.24', '101.24', '1', '', '1', '1'),
(29, 1, '', '2019-07-12 02:15:23', '6ea9ab1baa0efb9e19094440c317e21b', NULL, '0.00', '101.24', '101.24', '1', '', '1', '1'),
(30, 1, '', '2019-07-12 02:15:45', '34173cb38f07f89ddbebc2ac9128303f', NULL, '0.00', '153.40', '153.40', '1', '', '1', '1'),
(31, 1, '', '2019-07-12 02:15:52', 'c16a5320fa475530d9583c34fd356ef5', NULL, '0.00', '3.12', '3.12', '1', '', '1', '1'),
(32, 1, '', '2019-07-12 02:17:01', '6364d3f0f495b6ab9dcf8d3b5c6e0b01', NULL, '0.00', '20.30', '20.30', '1', '', '1', '1'),
(33, 1, '', '2019-07-12 02:17:04', '182be0c5cdcd5072bb1864cdee4d3d6e', NULL, '0.00', '20.30', '20.30', '1', '', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `prod_cod` int(11) NOT NULL,
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
  `prod_estado` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`prod_cod`, `prov_cod`, `cat_codigo`, `mar_codigo`, `prod_nombre_comercial`, `prod_precio_compra`, `prod_precio_venta`, `prod_stock`, `prod_stock_min`, `prod_stock_reponer`, `uni_codigo`, `alm_codigo`, `prod_estado`) VALUES
(1, 1, 11, 10, 'VALVULA COMPUERTA DE 3\" FE.FDO A/BRONCE C-125', '118.00', '153.40', '10', 0, '5', 7, 6, '1'),
(2, 2, 11, 11, 'VALVULA COMPUERTA 3\" FE.FDO. V/A BRD. 150 PSI DIN', '229.20', '297.96', '8', 0, '0', 7, 6, '1'),
(3, 1, 11, 10, 'VALVULA COMPUERTA DE 2\" FE.FDO. A/BRONCE C/BRIDA C-125', '214.17', '101.24', '10', 0, '52', 7, 6, '1'),
(4, 2, 11, 12, 'VALVULA COMPUERTA DE 2\" FE.FDO. C/BRIDA 125PSI ', '47.63', '61.92', '10', 0, '0', 11, 6, '1'),
(5, 3, 11, 13, 'VALVULA CHECK SWING INOX DE 1\" C-316 C/R 200 WOG', '12.92', '16.80', '10', 0, '0', 7, 6, '1'),
(6, 3, 11, 14, 'VALVULA CHECK SWING DE 1\" C/R', '11.59', '15.07', '10', 0, '0', 7, 6, '1'),
(7, 3, 11, 15, 'VALVULA CHECK SWING DE 1\" BCE', '17.80', '23.14', '10', 0, '0', 7, 6, '1'),
(8, 3, 11, 13, 'VALVULA CHECK SWING INOX DE 1.1/2\" C-316 C/R 200 WOG', '25.10', '32.63', '10', 0, '0', 7, 6, '1'),
(9, 3, 11, 14, 'VALVULA CHECK SWING DE 1.1/2\" C/R', '20.88', '27.14', '10', 0, '0', 7, 6, '1'),
(10, 3, 11, 15, 'VALVULA CHECK SWING DE 1.1/2\" BCE', '36.19', '47.05', '10', 0, '0', 7, 6, '1'),
(11, 1, 11, 16, 'VALVULA CHEK SWING DE 3\" FE.FDO.BCE. C/BRIDA ', '155.76', '202.49', '10', 0, '0', 7, 6, '1'),
(12, 1, 11, 10, 'VALVULA CHEK SWING DE 3\" FE.FDO.BCE.', '92.00', '119.60', '10', 0, '0', 7, 6, '1'),
(13, 3, 11, 17, 'VALVULA CHEK SWING DE 3\" FE.FDO.BCE.', '98.93', '128.61', '10', 0, '0', 7, 6, '1'),
(14, 5, 11, 17, 'VALVULA CHEK SWING DE 4\" FE.FDO.BCE.', '130.84', '170.09', '10', 0, '0', 7, 6, '1'),
(15, 3, 11, 8, 'VÃLVULA CHEK SWING 5\" FE. FDO.', '232.50', '302.25', '10', 0, '0', 7, 6, '1'),
(16, 3, 11, 13, 'VALVULA CHECK SWING INOX DE 3/4\" C-316 C/R 200 WOG', '9.97', '12.96', '10', 0, '0', 7, 6, '1'),
(17, 3, 11, 14, 'VALVULA CHECK SWING DE 3/4\" C/R ', '7.24', '9.41', '10', 0, '0', 7, 6, '1'),
(18, 3, 11, 15, 'VALVULA CHECK SWING DE 3/4\" C/R BCE', '12.11', '15.74', '10', 0, '0', 7, 6, '1'),
(19, 3, 11, 17, 'VALVULA COMPUERTA DE 3\" FE. C/B', '102.83', '133.68', '10', 0, '0', 7, 6, '1'),
(20, 1, 11, 10, 'VALVULA CHEK SWING DE 2\" FE. FDO.BRONCE C/BRIDA', '51.90', '67.47', '10', 0, '0', 7, 6, '1'),
(21, 1, 11, 10, 'VALVULAS COMPUERTA DE 2\" FE.FDO. BRONCE  C/BRIDA', '78.00', '101.40', '10', 0, '0', 7, 6, '1'),
(22, 7, 11, 8, 'VALVULAS COMPUERTA DE 2\" FE.FDO. BRONCE  C/BRIDA', '131.45', '170.89', '10', 0, '0', 7, 6, '1'),
(23, 1, 11, 15, 'VALVULAS COMPUERTA DE 2\" FE.FDO. BRONCE  C/BRIDA ', '98.93', '128.61', '10', 0, '0', 7, 6, '1'),
(24, 6, 11, 17, 'VALVULAS DE COMPUERTA DE 2 1/2\" BRONCE C/BRIDA', '180.00', '234.00', '10', 0, '0', 7, 6, '1'),
(25, 3, 11, 17, 'VALVULAS DE COMPUERTA DE 2 1/2\" FE C/BRIDA', '103.00', '133.90', '10', 0, '0', 7, 6, '1'),
(26, 3, 11, 17, 'VALVULAS DE COMPUERTA DE 4\" FE C/BRIDA', '172.83', '224.68', '10', 0, '0', 7, 6, '1'),
(27, 4, 11, 8, 'VALVULA  COMPUERTA 2.1/2\" BRONCE EUROVOL.', '45.45', '59.09', '10', 0, '0', 7, 6, '1'),
(28, 8, 11, 8, 'VALVULA CHECK DE 1.1/2\"', '17.45', '22.69', '10', 0, '0', 7, 6, '1'),
(29, 1, 11, 15, 'VALVULA CHECK CANASTILLA DE 1\"  BCE', '15.17', '19.72', '10', 0, '0', 7, 6, '1'),
(30, 6, 11, 8, 'VALVULA CHECK DE PIE TIPO CANASTILLA DE 1.1/2\" C/R BCE.', '40.40', '52.52', '10', 0, '0', 7, 6, '1'),
(31, 6, 11, 8, 'VALVULA CHECK DE PIE TIPO CANASTILLA DE 1.1/2\" C/R ', '40.73', '52.95', '10', 0, '0', 7, 6, '1'),
(32, 3, 11, 15, 'VALVULA CHECK DE PIE CANASTILLA DE 1.1/2\" C/R BCE', '27.80', '36.14', '10', 0, '0', 7, 6, '1'),
(33, 5, 11, 8, 'VALVULA CIERRE RAPIDO 1.1/2\"', '21.82', '28.36', '10', 0, '0', 7, 6, '1'),
(34, 3, 11, 18, 'VALV ANGULAR DE 1.1/2\" BCE. C/R P/GRIFO CONTRAINCENDIO', '34.79', '45.23', '10', 0, '0', 7, 6, '1'),
(35, 1, 11, 18, 'VALV ANGULAR DE 1.1/2\" BCE. C/R P/GRIFO CONTRAINCENDIO ', '50.00', '65.00', '10', 0, '0', 7, 6, '1'),
(36, 3, 11, 8, 'VALVULA ANGULAR 1.1/2\" FM X 300 PSI', '32.80', '42.64', '10', 0, '0', 7, 6, '1'),
(37, 3, 11, 11, 'VALVULA ANGULAR 2.1/2\" FM X 300 PSI ', '71.00', '92.30', '10', 0, '0', 7, 6, '1'),
(38, 3, 11, 17, 'ACOPLE DE BCE. D1 NST PL A70', '48.80', '53.04', '10', 0, '0', 7, 6, '1'),
(39, 2, 11, 15, 'VALVULA CHECK C/B LENGÃœETA ', '45.45', '59.09', '10', 0, '0', 7, 6, '1'),
(40, 1, 11, 17, 'VALVULA CHECK C/B 2\" F.FUND', '116.36', '151.27', '10', 0, '0', 7, 6, '1'),
(41, 3, 11, 17, 'VALVULAS CHEK SWING FE. C/B DE 4\"', '129.57', '168.44', '10', 0, '0', 7, 6, '1'),
(42, 4, 11, 8, 'VALVULA BOLA DE 1/2\" GALV. COPLAS ROSCABLE 1/2\"', '4.36', '5.67', '10', 0, '0', 7, 6, '1'),
(43, 5, 11, 13, 'VALVULA BOLA 1\"', '6.97', '9.06', '10', 0, '0', 7, 6, '1'),
(44, 1, 11, 8, 'VALVULAS DE BOLA DE 1. 1/4\" BRONCE C/ROSCA', '26.00', '33.80', '10', 0, '0', 7, 6, '1'),
(45, 5, 11, 8, 'VALVULA C/R DE 1.1/4\"', '16.36', '21.27', '10', 0, '0', 11, 6, '1'),
(46, 3, 11, 13, 'VALVULA BOLA INOX DE 1\"  C-316 x 1000 WOG', '11.48', '14.92', '10', 0, '0', 7, 6, '1'),
(47, 3, 11, 14, 'VALVULA BOLA BCE. DE 1\"  P/TOTAL PN 25', '7.06', '9.18', '10', 0, '0', 7, 6, '1'),
(48, 3, 11, 15, 'VALVULA BOLA BCE. DE 1\"  P/TOTAL', '13.37', '17.38', '10', 0, '0', 7, 6, '1'),
(49, 7, 11, 8, 'VALVULAS CHEK DE 2 1/2\" BRONCE C/BRIDA', '12.58', '15.90', '10', 0, '0', 7, 6, '1'),
(50, 3, 11, 13, 'VALVULA BOLA INOX DE 1/4\" C-316 x 1000 WOG ', '5.80', '7.54', '10', 0, '0', 7, 6, '1'),
(51, 3, 11, 14, 'VALVULA BOLA BCE. DE 1/4\"  P/TOTAL PN 25', '2.36', '3.07', '10', 0, '0', 7, 6, '1'),
(52, 3, 11, 15, 'VALVULA BOLA BCE. DE 1/4\"  P/TOTAL ', '5.85', '7.61', '10', 0, '0', 7, 6, '1'),
(53, 4, 11, 10, 'VALVULA DE BOLA C/R 1\"', '7.72', '10.03', '10', 0, '0', 7, 6, '1'),
(54, 1, 11, 8, 'VALVULA DE BOLA C/R 1/2\"', '4.36', '5.67', '10', 0, '0', 7, 6, '1'),
(55, 3, 11, 13, 'VALVULA BOLA INOX DE 1/2\" C-316 x 1000 WOG', '5.55', '7.22', '10', 0, '0', 7, 6, '1'),
(56, 3, 11, 14, 'VALVULA BOLA BCE. DE 1/2\"  P/TOTAL PN 25', '2.99', '3.89', '10', 0, '0', 7, 6, '1'),
(57, 3, 11, 15, 'VALVULA BOLA BCE. DE 1/2\"  P/TOTAL ', '6.78', '8.81', '10', 0, '0', 7, 6, '1'),
(58, 8, 11, 8, 'VALVULA DE BOLA C/R 1.1/2\"', '22.18', '28.84', '10', 0, '0', 11, 6, '1'),
(59, 6, 11, 15, 'VALVULA BOLA C.R. 1.1/2\" ', '48.73', '63.35', '10', 0, '0', 7, 6, '1'),
(60, 1, 11, 8, 'VALVULA BOLA C.R. 1.1/2\" BRONCE', '40.73', '52.95', '10', 0, '0', 11, 6, '1'),
(61, 3, 11, 13, 'VALVULA BOLA INOX DE 1.1/2\" C-316 x 1000 WOG -', '24.65', '32.05', '10', 0, '0', 7, 6, '1'),
(62, 3, 11, 14, 'VALVULA BOLA BCE. DE 1.1/2\"  P/TOTAL PN 25', '15.39', '20.01', '10', 0, '0', 7, 6, '1'),
(63, 3, 11, 15, 'VALVULA BOLA BCE. DE 1.1/2\"  P/TOTAL ', '33.54', '43.60', '10', 0, '0', 7, 6, '1'),
(64, 6, 11, 8, 'VALVULA COMPUERTA DE 1\"', '8.36', '10.87', '10', 0, '0', 7, 6, '1'),
(65, 8, 11, 8, 'VALVULA COMPUERTA DE 1/2\"', '17.45', '22.69', '10', 0, '0', 7, 6, '1'),
(66, 4, 11, 8, 'VALVULA DE 1/2\" C.R.', '3.04', '3.95', '10', 0, '0', 7, 6, '1'),
(67, 4, 11, 8, 'VALVULA C/R 2\"', '24.10', '31.33', '10', 0, '0', 7, 6, '1'),
(68, 5, 11, 14, 'VALVULA BOLA 1/2\" C/R ', '7.00', '9.10', '10', 0, '0', 7, 6, '1'),
(69, 8, 11, 15, 'VALVULA COMPUERTA 1.1/2\" C/R', '22.18', '28.84', '10', 0, '0', 11, 6, '1'),
(70, 3, 11, 17, 'VALVULA COMPUERTA DE 5\" FE C/B x 125 LBS', '258.62', '336.21', '10', 0, '0', 7, 6, '1'),
(71, 1, 11, 19, 'VALVULA CHECK SWING DE 5\" FE. FDO. BRIDADA', '336.00', '436.80', '10', 0, '0', 11, 6, '1'),
(72, 3, 11, 11, 'VALVULA CHECK SWING DE 5\" FE. FDO. BRIDADA', '426.49', '554.44', '10', 0, '0', 11, 6, '1'),
(73, 5, 11, 17, 'VALVULA CHECK SWING 5\" FE. FDO. 216 ANSI', '220.31', '286.40', '10', 0, '0', 7, 6, '1'),
(74, 2, 11, 12, 'VALVULA ANGULAR 4\" STOP CHECK BRIDADA DIAM.100 DIN MATERIAL DUCTIL IRON - TOMA DE FONDO PN16', '521.94', '678.52', '10', 0, '0', 7, 6, '1'),
(75, 6, 11, 8, 'VALVULA ANGULAR 5\" C/Acero WCB A-216 Int. De 125 mm.PN16-Norma DIN', '802.00', '1042.60', '10', 0, '0', 7, 6, '1'),
(76, 6, 11, 15, 'VALVULA ANGULAR 5\" STOP CHECK BRIDADA DIAM.125 DIN MATERIAL DUCTIL IRON - TOMA DE FONDO PN16', '859.00', '1116.70', '10', 0, '0', 7, 6, '1'),
(77, 8, 11, 11, 'VALVULA COMPUERTA 5\" FE. BRIDADA ', '696.20', '905.06', '10', 0, '0', 7, 6, '1'),
(78, 3, 11, 17, 'VALVULA GLOBO ANGULAR DE 6\" CLASE 150 ACERO', '662.96', '861.85', '10', 0, '0', 7, 6, '1'),
(79, 3, 11, 14, 'VALVULA GLOBO ANGULAR DE 6\" ACERO CARBONO BRIDADA 150 LB.', '577.20', '750.36', '10', 0, '0', 7, 6, '1'),
(80, 6, 11, 11, 'VALVULA ANGULAR 6\" C/Acero WCB A-216 Int. Ac.Inox.De 150 mm.PN16-Norma DIN', '897.00', '1166.10', '10', 0, '0', 7, 6, '1'),
(81, 3, 11, 17, 'VALVULA GLOBO 5\" FE. BRIDADA V/A A/BCE. 125 LBS', '301.35', '391.76', '10', 0, '0', 7, 6, '1'),
(82, 3, 11, 8, 'VALVULA MARIPOSA 5\" WAFER FE. DISCO C-316 A/EPDM C/.', '40.20', '52.26', '10', 0, '0', 7, 6, '1'),
(83, 3, 11, 10, 'VALVULA MARIPOSA PVC 6\"', '105.00', '136.50', '10', 0, '0', 7, 6, '1'),
(84, 5, 11, 11, 'VALVULA MARIPOSA 6\" ', '97.56', '126.83', '10', 0, '0', 7, 6, '1'),
(85, 3, 11, 10, 'VALVULA MARIPOSA 6\" FE. C/PALANCA', '48.92', '63.60', '10', 0, '0', 7, 6, '1'),
(86, 3, 11, 8, 'VALVULA MARIPOSA 3\" PVC', '52.91', '68.78', '10', 0, '0', 7, 6, '1'),
(87, 5, 11, 8, 'VALVULA MARIPOSA 3\" PVC', '43.21', '56.17', '10', 0, '0', 7, 6, '1'),
(88, 8, 11, 20, 'VALVULA MARIPOSA 5\" PVC', '65.76', '85.49', '10', 0, '0', 7, 6, '1'),
(89, 1, 11, 10, 'VÃLVULA MARIPOSA 5\" WAFER.FE. DISCO', '50.00', '65.00', '10', 0, '0', 7, 6, '1'),
(90, 6, 11, 8, 'VÃLVULA MARIPOSA 5\" ', '40.63', '52.81', '10', 0, '0', 7, 6, '1'),
(91, 5, 11, 18, 'VALVULA 1/4\" - C/R ', '6.25', '8.13', '10', 0, '0', 7, 6, '1'),
(92, 4, 11, 8, 'VALVULA BOLA 3/4\" C/R', '4.32', '5.62', '10', 0, '0', 7, 6, '1'),
(93, 5, 11, 8, 'VALVULA BOLA  2\"', '8.64', '11.23', '10', 0, '0', 7, 6, '1'),
(94, 5, 11, 8, 'VALVULA BOLA  1/2\"', '3.09', '4.01', '10', 0, '0', 7, 6, '1'),
(95, 3, 11, 8, 'VALVULA MARIPOSA 3/8\"', '2.78', '3.61', '10', 0, '0', 7, 6, '1'),
(96, 4, 11, 8, 'VALVULA COMPUERTA 3\" C/R ', '57.10', '74.23', '10', 0, '0', 7, 6, '1'),
(97, 1, 11, 8, 'VALVULA  DE 3/4\" C/R', '4.63', '6.02', '10', 0, '0', 7, 6, '1'),
(98, 1, 12, 8, 'PERNOS DE 5/8\" x 2 1/2\" AC. INOX.', '2.40', '3.12', '10', 0, '0', 7, 6, '1'),
(99, 1, 13, 8, 'TUERCAS DE 5/8\'\' x 21/2\'\' AC. INOX', '2.40', '3.12', '100', 0, '0', 7, 6, '1'),
(100, 4, 12, 8, 'PERNOS DE 5/8\" x 3\" GALV.', '0.55', '0.71', '120', 0, '0', 7, 6, '1'),
(101, 5, 12, 8, 'PERNO DE 5/8\'\' x 4.1/2\'\' C/TCA. GALV', '0.62', '0.81', '100', 0, '0', 7, 6, '1'),
(102, 5, 12, 8, 'PERNOS 5/8\'\' x 3\'\'. INOX. C/TCA', '1.50', '1.94', '100', 0, '0', 7, 6, '1'),
(103, 4, 12, 8, 'PERNOS DE 5/8 x 5\'\' AC.INOX', '4.36', '5.67', '100', 0, '0', 7, 6, '1'),
(104, 6, 13, 8, 'TUERCAS DE 5/8\'\' GALV.', '0.15', '0.19', '100', 0, '0', 7, 6, '1'),
(105, 4, 12, 8, 'PERNOS DE 5/16 X 1\'\' AC.INOX', '0.16', '0.21', '100', 0, '0', 7, 6, '1'),
(106, 3, 13, 8, 'TUERCA DE 5/16 AC. INOX', '0.09', '0.11', '100', 0, '0', 7, 6, '1'),
(107, 8, 14, 8, 'ANILLO DE 5/16 AC.INOX', '0.04', '0.05', '100', 0, '0', 7, 6, '1'),
(108, 4, 12, 8, 'PERNOS DE 3/4\'\' X 21/2\'\' AC.INOX', '0.50', '0.70', '100', 0, '0', 7, 6, '1'),
(109, 1, 13, 8, 'TUERCAS 3/4\'\' X 21/2\'\' AC.INOX', '0.80', '1.20', '100', 0, '0', 7, 6, '1'),
(110, 8, 13, 8, 'TUERCAS  DE 3/4\'\' X 3\'\' C/TCA.FE.NE', '0.72', '0.93', '100', 0, '0', 7, 6, '1'),
(111, 6, 12, 8, 'PERNO 3/8\'\' X 1 INOX', '0.31', '0.40', '100', 0, '0', 7, 6, '1'),
(112, 5, 12, 8, 'PERNO 3/8\'\' X 2\'\' C/T INOX', '0.56', '0.73', '100', 0, '0', 7, 6, '1'),
(113, 3, 12, 8, 'PERNO 3/8\'\' X 1/2\'\' C/T . F.N', '15.43', '20.06', '100', 0, '0', 7, 6, '1'),
(114, 4, 12, 8, 'PERNO 3/8\'\' X 2\'\' C/T', '0.09', '0.12', '100', 0, '0', 7, 6, '1'),
(115, 1, 12, 8, 'PERNO 3/8\'\' X 1.1/4\'\' INOX.C/ANILLO PLANO Y TUERCA', '0.39', '0.50', '100', 0, '0', 7, 6, '1'),
(116, 2, 12, 8, 'PERNO HEXAG. 3/8\'\' 1.1/2\'\' INOX', '0.21', '0.27', '100', 0, '0', 7, 6, '1'),
(117, 3, 12, 8, 'PERNO 5/8\'\' 2.1/2\'\'.C/TCA.FE.NE.', '0.47', '0.61', '100', 0, '0', 7, 6, '1'),
(118, 6, 12, 8, 'PERNO 5/8\'\' X2.1/2\'\'.C/TGALV', '0.43', '0.56', '100', 0, '0', 7, 6, '1'),
(119, 2, 13, 8, 'TUERCA HEXAG 3/8\'\' INOX', '0.08', '0.10', '100', 0, '0', 7, 6, '1'),
(120, 1, 13, 8, 'TUERCAS HEXAG 2\'\' GR 8 HC', '5.13', '6.67', '100', 0, '0', 7, 6, '1'),
(121, 6, 13, 8, 'TUERCAS DE 5/8\'\' X 3\'\' AC.INOX', '3.20', '4.16', '100', 0, '0', 7, 6, '1'),
(122, 2, 13, 8, 'TUERCA DE 5/8\'\' AC.INOX', '0.67', '0.87', '100', 0, '0', 7, 6, '1'),
(123, 1, 13, 8, 'TUERCA DE 5/8\'\' GALV.', '0.15', '0.20', '100', 0, '0', 7, 6, '1'),
(124, 5, 12, 8, 'PERNO DE 5/8\'\' X 2\'\' UNC HEXAG', '1.20', '1.56', '100', 0, '0', 7, 6, '1'),
(125, 6, 13, 8, 'TUERCA DE 5/8\'\' X 3.1/2\'\'', '0.49', '0.64', '100', 0, '0', 7, 6, '1'),
(126, 1, 12, 8, 'ANILLO PLANO FE.NEGRO 5/8', '0.08', '0.11', '100', 0, '0', 7, 6, '1'),
(127, 7, 13, 8, 'TUERCA DE 2\'\' GRADO 8 FE .NE', '6.04', '7.85', '100', 0, '0', 7, 6, '1'),
(128, 5, 12, 8, 'PERNO DE 1/2\'\' X 1.1/2\'\' AC.INOX', '0.50', '0.65', '100', 0, '0', 7, 6, '1'),
(129, 3, 13, 8, 'TUERCA DE 1/2\'\' AC.INOX', '0.18', '0.23', '100', 0, '0', 7, 6, '1'),
(130, 5, 14, 8, 'ANILLO DE 1/2\'\' AC.INOX', '0.07', '0.09', '100', 0, '0', 7, 6, '1'),
(131, 5, 12, 8, 'PERNO DE 1/2 X 2\'\' C/TUERCA INOX', '1.24', '1.61', '100', 0, '0', 7, 6, '1'),
(132, 3, 12, 8, 'PERNO DE 1/2 X 2\'\'INOX', '0.76', '0.99', '100', 0, '0', 7, 6, '1'),
(133, 1, 12, 8, 'perno de 1/2 x 2\'\'inox. c/tuerca', '1.96', '2.55', '100', 0, '0', 7, 6, '1'),
(134, 8, 13, 8, 'TUERCA DE 1/2\'\'INOX', '0.29', '0.38', '100', 0, '0', 7, 6, '1'),
(135, 6, 12, 8, 'PERNO DE 1/2\'\'X2\'\'GALV', '0.21', '0.28', '100', 0, '0', 7, 6, '1'),
(136, 1, 13, 8, 'TUERCA 1/2\'\'GALV', '0.06', '0.08', '100', 0, '0', 7, 6, '1'),
(137, 2, 14, 8, 'ANILLO 1/2\'\'', '0.05', '0.06', '100', 0, '0', 7, 6, '1'),
(138, 6, 12, 8, 'PERNO DE 1/2\'\'X2.1/2\'\'(BRUÃ‘)', '0.25', '0.32', '100', 0, '0', 7, 6, '1'),
(139, 4, 13, 8, 'TUERCA DE 1/2\'\'', '0.06', '0.08', '100', 0, '0', 7, 6, '1'),
(140, 2, 12, 8, 'PERNO 1/4Â´Â´ X 1\'\'.C/TCA + ANILLLO PLANO', '0.25', '0.32', '100', 0, '0', 7, 6, '1'),
(141, 1, 12, 8, 'PERNO DE 3/4\'\' X 2.1/2\'\'INOX', '2.29', '2.98', '100', 0, '0', 7, 6, '1'),
(142, 4, 12, 8, 'PERNOS DE 3/4\'\'X4 AC.INOX', '1.60', '2.08', '100', 0, '0', 7, 6, '1'),
(143, 5, 12, 8, 'PERNOS DE 3/4\'\'X4', '1.38', '1.80', '100', 0, '0', 7, 6, '1'),
(144, 2, 12, 8, 'PERNOS DE 3/4\'\'X3\'\'AC.INOX', '0.84', '1.09', '100', 0, '0', 7, 6, '1'),
(145, 1, 12, 8, 'PERNOS DE 3/4\'\' X 3\'\'FE.NE', '1.27', '1.65', '100', 0, '0', 7, 6, '1'),
(146, 5, 12, 8, 'PERNOS 3/4\'\'', '1.00', '1.50', '100', 0, '0', 7, 6, '1'),
(147, 2, 13, 8, 'TUERCAS 3/4\'\'', '0.65', '0.85', '100', 0, '0', 7, 6, '1'),
(148, 5, 13, 8, 'TUERCAS 3/4\'\'AC.INOX', '1.09', '1.42', '100', 0, '0', 7, 6, '1'),
(149, 1, 14, 8, 'ANILLLO PLANO  INOX 3/4', '0.39', '0.51', '100', 0, '0', 7, 6, '1'),
(150, 5, 14, 8, 'ANILLLO PLANO INOX 5/8', '0.18', '0.24', '100', 0, '0', 7, 6, '1'),
(151, 2, 12, 8, 'PERNOS DE 7/8\'\'X 3.1/2\'\'', '1.64', '2.13', '100', 0, '0', 7, 6, '1'),
(152, 8, 13, 8, 'TUERCA DE7/8\'\'', '0.49', '0.64', '100', 0, '0', 7, 6, '1'),
(153, 5, 13, 8, 'TUERCA MARIPOSA 5/8\'\'INOX', '2.49', '3.24', '100', 0, '0', 7, 6, '1'),
(154, 2, 12, 8, 'PERNO DE OJO  5/8\'\'X3\'\'INOX', '4.36', '5.67', '100', 0, '0', 7, 6, '1'),
(155, 1, 12, 8, 'PERNOS 10 X 25 INNOXC/T', '0.64', '0.83', '100', 0, '0', 7, 6, '1'),
(156, 1, 23, 8, 'ESPARRAGO 1/2\'\'X2\'\'Grado5', '0.77', '1.00', '100', 0, '0', 7, 6, '1'),
(157, 2, 23, 8, 'ESPARRAGO 5/8\'\' x 1 m-INOX', '10.90', '14.17', '100', 0, '0', 7, 6, '1'),
(158, 7, 11, 8, 'VALVULA  ESFERICA 1/2  \'\' C/ROSCA', '26.00', '26.00', '34', 0, '0', 7, 6, '1'),
(159, 2, 15, 8, 'TUBO ACERO DE 3\'\' X6MT.SCH40', '74.55', '96.92', '50', 0, '0', 11, 6, '1'),
(160, 1, 15, 8, 'TUBO ACERO DE 4\'\' X 6MT', '58.13', '87.20', '50', 0, '0', 11, 6, '1'),
(161, 3, 15, 8, 'TUBO ACERO DE 3\" X 6 MT.  SCH80Â°', '120.20', '156.26', '50', 0, '0', 11, 6, '1'),
(162, 4, 15, 8, 'TUBO ACERO DE 3\" X 6 MT.  SCH80Â°', '94.86', '142.30', '50', 0, '0', 11, 6, '1'),
(163, 1, 15, 8, 'TUBO ACERO DE 2\" x 6 MT. SCH40Â°', '33.50', '43.55', '50', 0, '0', 11, 6, '1'),
(164, 8, 15, 8, 'TUBO ACERO DE 2\" x 6 MT. SCH40Â°', '30.77', '40.00', '50', 0, '0', 11, 6, '1'),
(165, 4, 15, 8, 'TUBO ASTM. S/C 2\" x 6 MTS. SCH40', '40.79', '61.18', '50', 0, '0', 11, 6, '1'),
(166, 5, 15, 8, 'TUBO ACERO DE 2\" x 6 MT. SCH40Â°', '44.75', '58.18', '50', 0, '0', 11, 6, '1'),
(167, 2, 15, 8, 'TUBO ASTM. S/C 1\" x 6 MTS. SCH40', '17.50', '24.50', '50', 0, '0', 11, 6, '1'),
(168, 4, 15, 8, 'TUBO 1\" x 6 MT. SCH40', '22.18', '28.84', '50', 0, '0', 11, 6, '1'),
(169, 3, 15, 8, 'TUBO 2.1/2\" X 6 MTS. SCH 80', '88.79', '115.42', '50', 0, '0', 11, 6, '1'),
(170, 6, 15, 8, 'TUBO 1.1/2\" X 6 MTS. SCH40', '49.09', '63.82', '50', 0, '0', 11, 6, '1'),
(171, 6, 15, 8, 'TUBO ASTM. ACERO 53 S/C 1.1/2\" x 6 MTS. SCH40', '31.25', '43.75', '50', 0, '0', 11, 6, '1'),
(172, 1, 15, 8, 'TUBO ACERO S/C 1.1/2\" x 6 MTS. SCH40', '25.67', '33.37', '50', 0, '0', 11, 6, '1'),
(173, 1, 15, 8, 'TUBO DE 1.1/4\" F.N. SCH40', '24.47', '31.81', '50', 0, '0', 11, 6, '1'),
(174, 4, 15, 8, 'TUBO DE  2\"X 1.20 MTS INOX. SCH 40', '36.97', '48.06', '50', 0, '0', 11, 6, '1'),
(175, 5, 15, 8, 'TUBO DE ACERO 2\" x 6 MTS. SCH40', '32.44', '42.17', '50', 0, '0', 11, 6, '1'),
(176, 3, 15, 8, 'TUBO DE  2\" X 6 MTS SCH 40', '49.30', '64.08', '50', 0, '0', 11, 6, '1'),
(177, 4, 15, 8, 'TUBO DE ACERO 2.1/2\" x 6 MTS. SCH40', '68.36', '88.87', '50', 0, '0', 11, 6, '1'),
(178, 6, 15, 8, 'TUBO DE ACERO 2.1/2\" x 6 MTS. SCH80', '77.88', '101.25', '50', 0, '0', 11, 6, '1'),
(179, 4, 15, 8, 'TUBO  DE 1.1/4\" X 6 MTS. SCH80', '42.17', '63.25', '50', 0, '0', 11, 6, '1'),
(180, 6, 15, 8, 'TUBO 1/4\" x 6 MTS. SCH40', '11.11', '14.44', '50', 0, '0', 11, 6, '1'),
(181, 5, 15, 8, 'TUBO 3/8\" X 6 MTS. SCH40', '15.63', '20.31', '50', 0, '0', 11, 6, '1'),
(182, 6, 15, 8, 'TUBO 3/8 X 6 MTS. SCH80', '32.81', '42.66', '50', 0, '0', 11, 6, '1'),
(183, 3, 15, 8, 'TUBO 3/8 X 6 MTS. SCH80 ', '14.40', '18.72', '50', 0, '0', 11, 6, '1'),
(184, 4, 15, 8, 'TUBO 3/8 X 6 MTS. SCH40 AC. INOX ', '37.50', '48.75', '50', 0, '0', 11, 6, '1'),
(185, 7, 15, 8, 'TUBO 3/4\" SCH40 AC. INOX. C316', '37.50', '48.75', '50', 0, '0', 11, 6, '1'),
(186, 8, 15, 8, 'TUBO 3\" X 4 MTS. SCH 40', '37.50', '48.75', '50', 0, '0', 11, 6, '1'),
(187, 6, 15, 8, 'TUBO ACERO DE 4\" x 6 MTS. SCH40', '103.01', '154.52', '50', 0, '0', 11, 6, '1'),
(188, 5, 15, 8, 'TUBO ACERO DE 4\" x 6 MTS. SCH80', '142.60', '213.90', '50', 0, '0', 11, 6, '1'),
(189, 4, 15, 8, 'TUBO ACERO 5\" x 6 mts. SCH40', '156.00', '202.80', '50', 0, '0', 11, 6, '1'),
(190, 3, 15, 8, 'TUBO ACERO 5\" x 6 mts. SCH80', '142.60', '213.90', '50', 0, '0', 11, 6, '1'),
(191, 2, 15, 8, 'TUBO ACERO 5\" x 6 mts. SCH40', '156.00', '202.80', '50', 0, '0', 11, 6, '1'),
(192, 6, 15, 8, 'TUBO ACERO 5\" x 6 mts. SCH80', '221.48', '287.92', '50', 0, '0', 11, 6, '1'),
(193, 5, 15, 8, 'TUBO ACERO DE 6\" x 6 MTS. SCH40', '189.79', '246.73', '50', 0, '0', 11, 6, '1'),
(194, 8, 15, 8, 'TUBO ACERO DE 6\" x 6 MTS. SCH80', '272.59', '354.36', '50', 0, '0', 11, 6, '1'),
(195, 6, 15, 8, 'TUBO DE 8\" X 6 MTS. SCH80', '450.70', '585.92', '50', 0, '0', 11, 6, '1'),
(196, 8, 15, 8, 'TUBO ACERO DE 10\" x 6 MTS', '882.81', '1147.65', '50', 0, '0', 11, 6, '1'),
(197, 5, 15, 8, 'TUBO ACERO DE 10\" x 6 MTS SCH80', '547.02', '711.13', '50', 0, '0', 11, 6, '1'),
(198, 7, 15, 8, 'TUBO ACERO DE 10\" x 6 MTS SCH80', '828.31', '1076.81', '50', 0, '0', 11, 6, '1'),
(199, 5, 15, 8, 'TUBO ACERO DE 10\" x 6 MTS SCH80', '547.00', '711.10', '50', 0, '0', 11, 6, '1'),
(200, 8, 15, 8, 'TUBO ACERO DE 10\" X 2.10 MTS. ', '480.14', '624.19', '50', 0, '0', 11, 6, '1'),
(201, 5, 15, 8, 'TUBO FLEXIBLE 6\" X 7.5\"', '124.61', '161.99', '50', 0, '0', 11, 6, '1'),
(202, 1, 16, 8, 'CODO ACERO DE 3\" x 90Â° SCH40 P/SOLDAR', '3.78', '4.91', '50', 0, '0', 7, 6, '1'),
(203, 1, 16, 8, 'CODO C/ROSCA GALV. DE 1\" X 90Â° ', '0.63', '0.82', '100', 0, '0', 7, 6, '1'),
(204, 4, 16, 8, 'CODO DE 3\" X 90Â° SCH40', '4.27', '5.55', '50', 0, '0', 7, 6, '1'),
(205, 3, 16, 8, 'CODO SOLDABLE DE 3\" x 90Â° SCH40', '3.36', '4.37', '50', 0, '0', 7, 6, '1'),
(206, 6, 16, 8, 'CODOS SOLDABLE DE 2 1/2\" x 90Â° SCH40', '4.36', '5.67', '50', 0, '0', 7, 6, '1'),
(207, 5, 16, 8, 'CODO SOLDABLE 2.1/2\" x 90Â° SCH40', '2.78', '3061.00', '50', 0, '0', 7, 6, '1'),
(208, 5, 16, 8, 'CODO SOLDABLE 1\" x 90Â° SCH40', '0.91', '1.18', '50', 0, '0', 11, 6, '1'),
(209, 6, 16, 8, 'CODOS  1\" X 90Â° SCH 40', '1.82', '2.36', '50', 0, '0', 7, 6, '1'),
(210, 5, 16, 8, 'CODO SOLDABLE 1.1/2\" x 90Â° SCH40', '2.11', '2.74', '50', 0, '0', 7, 6, '1'),
(211, 6, 16, 8, 'CODO SOLDABLE 1.1/2\" x 90Â° SCH40', '0.94', '1.22', '50', 0, '0', 7, 6, '1'),
(212, 1, 16, 8, 'CODO SOLDABLE 1.1/2\" x 90Â° SCH40', '1.45', '1.89', '50', 0, '0', 7, 6, '1'),
(213, 2, 16, 8, 'CODO SOLDABLE 1.1/2\" x 90Â° SCH40', '1.09', '1.42', '50', 0, '0', 7, 6, '1'),
(214, 5, 16, 8, 'CODOS DE 1/2\" x 90Â°', '0.73', '0.95', '50', 0, '0', 7, 6, '1'),
(215, 3, 16, 8, 'CODO DE 1/2\" x 90Â° C/ROSCA GALV.', '0.46', '0.60', '50', 0, '0', 7, 6, '1'),
(216, 8, 16, 8, 'CODOS DE 1\" x 90Â°', '0.73', '0.95', '50', 0, '0', 7, 6, '1'),
(217, 5, 16, 8, 'CODOS  2\"X 40 SCH 40', '1.82', '2.36', '50', 0, '0', 7, 6, '1'),
(218, 5, 16, 8, 'CODOS 2\"X 45 SCH 40', '1.64', '2.13', '50', 0, '0', 7, 6, '1'),
(219, 6, 16, 8, 'CODO SOLDABLE DE 2\" x 90Â° SCH80', '3.27', '4.25', '50', 0, '0', 7, 6, '1'),
(220, 6, 16, 8, 'CODO SOLDABLE DE 2\" x 90Â°  SCH40', '2.16', '2.81', '50', 0, '0', 7, 6, '1'),
(221, 8, 16, 8, 'CODO SOLDABLE DE 2\" x 90Â° SCH40', '1.68', '2.19', '50', 0, '0', 7, 6, '1'),
(222, 5, 16, 8, 'CODO SOLDABLE DE 2\" x 90Â° SCH40', '1.38', '1.80', '50', 0, '0', 7, 6, '1'),
(223, 2, 16, 8, 'CODO SOLDABLE DE 2\" x 45Â° SCH40', '0.80', '1.04', '50', 0, '0', 7, 6, '1'),
(224, 5, 16, 8, 'CODO SOLDABLE 2\" X90Â°', '2.36', '3.07', '50', 0, '0', 7, 6, '1'),
(225, 3, 16, 8, 'CODO ACERO DE 2\" x 90Â°SOLD. SCH40', '2.91', '3.78', '50', 0, '0', 7, 6, '1'),
(226, 1, 16, 8, 'CODO P/SOLDAR DE 2\" X90Â° SCH80', '1.74', '2.26', '50', 0, '0', 7, 6, '1'),
(227, 1, 16, 8, 'CODO P/SOLDAR DE 2\" X45Â° SCH40', '0.90', '1.17', '50', 0, '0', 7, 6, '1'),
(228, 2, 16, 8, 'CODO DE 3/4\" x 90Â° C/R FE. NE. 150 PSI', '0.63', '0.82', '50', 0, '0', 7, 6, '1'),
(229, 1, 16, 8, 'CODO P/SOLDAR DE 3\" X90Â° SCH40', '3.60', '4.68', '50', 0, '0', 7, 6, '1'),
(230, 1, 16, 8, 'CODO P/SOLDAR DE 3\" X45Â° SCH40', '2.40', '3.12', '50', 0, '0', 7, 6, '1'),
(231, 4, 16, 8, 'CODO 3\" X 45 SCH 40', '2.40', '3.12', '50', 0, '0', 7, 6, '1'),
(232, 5, 16, 8, 'CODO SOLDABLE 4\"', '10.18', '13.24', '50', 0, '0', 7, 6, '1'),
(233, 3, 16, 8, 'CODO SOLDABLE DE 4\" X 90Â° SOLDABLE', '6.22', '8.08', '50', 0, '0', 7, 6, '1'),
(234, 5, 16, 8, 'CODO SOLDABLE DE 4\" X90Â° SCH40', '6.27', '8.15', '50', 0, '0', 7, 6, '1'),
(235, 1, 16, 8, 'CODO P/SOLDAR DE 4\" X45Â° SCH40', '5.00', '6.50', '50', 0, '0', 7, 6, '1'),
(236, 5, 16, 8, 'CODO P/SOLDAR DE 4\" X90Â° SCH80', '9.78', '12.71', '50', 0, '0', 7, 6, '1'),
(237, 4, 16, 8, 'CODO P/SOLDAR DE 4\" X45Â° SCH80', '6.53', '8.49', '50', 0, '0', 7, 6, '1'),
(238, 4, 16, 8, 'CODO  5 X 90  SCH 80', '22.53', '29.29', '50', 0, '0', 7, 6, '1'),
(239, 4, 16, 8, 'CODO 1/4\" X 90Â° GALV.', '0.46', '0.60', '50', 0, '0', 7, 6, '1'),
(240, 3, 16, 8, 'CODO DE ACERO 6\" x 90Â° - SCH40', '14.85', '19.30', '50', 0, '0', 7, 6, '1'),
(241, 3, 16, 8, 'CODO SOLDABLE 6\" x 90Â° - SCH40', '19.25', '25.03', '50', 0, '0', 7, 6, '1'),
(242, 4, 16, 8, 'CODO 6\" X 90Â° SCH80', '29.79', '38.72', '50', 0, '0', 7, 6, '1'),
(243, 2, 16, 8, 'CODO ACERO SOLD. 10\" X 90Â° SCH80', '87.20', '113.36', '50', 0, '0', 7, 6, '1'),
(244, 4, 16, 8, 'CODO 3/8\" X 90Â° F.N.', '0.63', '0.81', '50', 0, '0', 7, 6, '1'),
(245, 3, 16, 8, 'CODO 3/8\" X 90Â° F.N. C/R', '0.25', '0.33', '50', 0, '0', 7, 6, '1'),
(246, 8, 16, 8, 'CODO 3/8\" X 90Â° C/R - INOX. C316', '1.20', '1.56', '50', 0, '0', 7, 6, '1'),
(247, 3, 17, 8, 'BRIDA DE 1\"', '2.93', '3.81', '50', 0, '0', 7, 6, '1'),
(248, 2, 17, 8, 'BRIDAS DE 1.1/2\" TIPO ANILLO ', '3.58', '4.66', '50', 0, '0', 7, 6, '1'),
(249, 6, 17, 8, 'BRIDA DE 1.1/2\" ESTÃNDAR', '5.45', '7.09', '50', 0, '0', 7, 6, '1'),
(250, 1, 17, 8, 'BRIDA DE 1.1/2\" ESTÃNDAR', '3.70', '4.81', '50', 0, '0', 7, 6, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `prov_cod` int(11) NOT NULL,
  `prov_razon_social` char(100) NOT NULL,
  `prov_ruc` char(11) NOT NULL,
  `prov_email` char(50) NOT NULL,
  `prov_telefono` char(9) NOT NULL,
  `prov_direccion` varchar(50) NOT NULL,
  `prov_estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `tdoc_nombre` char(50) NOT NULL,
  `tdoc_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tdoc_cod`, `tdoc_nombre`, `tdoc_estado`) VALUES
(1, 'DOCUMENTO NACIONAL DE IDENTIDAD (DNI)', 1),
(2, 'REGISTRO ÃšNICO DE CONTRIBUYENTES', 1),
(6, 'PASAPORTE', 1),
(9, 'CARNET DE EXTRANJERIA', 1),
(10, 'CÃ‰DULA DIPLOMÃTICA DE IDENTIDAD', 1),
(11, 'OTROS TIPOS DE DOCUMENTOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE `unidad_medida` (
  `uni_codigo` int(11) NOT NULL,
  `uni_descripcion` varchar(45) NOT NULL,
  `uni_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD UNIQUE KEY `cli_ruc_UQ` (`cli_ruc`);

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
  ADD PRIMARY KEY (`comp_cod`,`prod_cod`),
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
  ADD PRIMARY KEY (`pre_cod`,`pro_cod`),
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
  ADD KEY `prov_codigo_idx` (`prov_cod`),
  ADD KEY `uni_codigo_idx` (`uni_codigo`);

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
  ADD UNIQUE KEY `Ãndice 1` (`usu_nombre`),
  ADD KEY `FK_usuario_empleado_emp_codigo` (`emp_codigo`),
  ADD KEY `FK_usuario_rol_rol_cod` (`rol_cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `act_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `actividad_empleado`
--
ALTER TABLE `actividad_empleado`
  MODIFY `aemp_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `actividad_productos`
--
ALTER TABLE `actividad_productos`
  MODIFY `actpro_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `alm_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cat_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
-- AUTO_INCREMENT de la tabla `conformidad`
--
ALTER TABLE `conformidad`
  MODIFY `conf_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `emp_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `mar_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `orden_ejecucion`
--
ALTER TABLE `orden_ejecucion`
  MODIFY `ord_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  MODIFY `pres_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `prod_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `prov_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tdoc_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `uni_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
