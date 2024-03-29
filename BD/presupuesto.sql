DELIMITER $$
-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_getRow;

CREATE PROCEDURE pa_presupuesto_getRow(
    IN _pres_cod int(11)
)
BEGIN
    SELECT pres_cod, pres_descripcion, pres_numero, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
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
    SELECT pres_cod, pres_descripcion, pres_numero, pres_fecha_emision, pres_fecha_recepcion, pres_forma_pago,
        pres_lugar_trabajo, pres_estado, pres_costo_mano_obra, pres_costo_materiales,
        pres_costo_total, cli.cli_codigo, cli_razon_social, cli_email, pres_encargado, pres_situacion
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
-- DROP PROCEDURE IF EXISTS pa_presupuesto_reportbySituacion;

CREATE PROCEDURE pa_presupuesto_reportbySituacion(
    IN _anio    int,
    IN _cli_cod int
)
BEGIN
    SELECT *
    FROM (
        SELECT 0 AS sit_id, 'Nuevo' AS sit_nombre
        UNION
        SELECT 1, 'Enviado'
        UNION
        SELECT 2, 'Aceptado'
        UNION
        SELECT 3, 'En ejecucion'
        UNION
        SELECT 4, 'Terminado'
        UNION
        SELECT 5, 'Anulado'
    ) sit
         LEFT JOIN (
        SELECT pres_situacion, count(pres_cod) AS conteo
        FROM presupuesto pre
        WHERE pre.pres_estado = 1 AND year(pre.pres_fecha_emision) = _anio AND
            (_cli_cod = 0 OR pre.cli_codigo = _cli_cod)
        GROUP BY pres_situacion
    ) pres ON sit.sit_id = pres.pres_situacion;
END $$

CALL pa_presupuesto_reportbySituacion(2019, 0);

-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_CostoByMes;

CREATE PROCEDURE pa_presupuesto_CostoByMes(
    IN _anio    int,
    IN _cli_cod int
)
BEGIN
    SELECT *
    FROM (
        SELECT 1 AS mes_nro, 'Enero' AS mes_nombre
        UNION
        SELECT 2, 'Febrero'
        UNION
        SELECT 3, 'Marzo'
        UNION
        SELECT 4, 'Abril'
        UNION
        SELECT 5, 'Mayo'
        UNION
        SELECT 6, 'Junio'
        UNION
        SELECT 7, 'Julio'
        UNION
        SELECT 8, 'Agosto'
        UNION
        SELECT 9, 'Setiembre'
        UNION
        SELECT 10, 'Octubre'
        UNION
        SELECT 11, 'Noviembre'
        UNION
        SELECT 12, 'Diciembre'
    ) mes
         LEFT JOIN (
        SELECT month(pres_fecha_emision) AS mes, count(pres_cod) AS conteo,
            sum(pres_costo_mano_obra) AS pres_costo_mano_obra,
            sum(pres_costo_materiales) AS pres_costo_materiales,
            sum(pres_costo_total) AS pres_costo_total
        FROM presupuesto pre
        WHERE pre.pres_estado = 1 AND year(pre.pres_fecha_emision) = _anio AND
            (_cli_cod = 0 OR pre.cli_codigo = _cli_cod)
        GROUP BY month(pres_fecha_emision)
    ) monto ON mes.mes_nro = monto.mes;
END $$

CALL pa_presupuesto_CostoByMes(2019, 0);

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
-- DROP PROCEDURE IF EXISTS pa_presupuesto_reporte;

CREATE PROCEDURE pa_presupuesto_reporte(
    IN _buscar varchar(50)
)
BEGIN
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT pres.pres_numero, pres.pres_fecha_emision, pres.pres_fecha_recepcion,
        cli.cli_razon_social, pres.pres_costo_total, pres.pres_estado, pres.pres_encargado,
        pres.pres_lugar_trabajo, pres.pres_descripcion,
        conform.conf_fecha_inicio, conform.conf_fecha_fin, conform.conf_estado,
        conform.conf_act_conformidad
    FROM presupuesto pres
         INNER JOIN cliente cli ON pres.cli_codigo = cli.cli_codigo
         LEFT JOIN conformidad conform ON pres.pres_cod = conform.pres_cod
    WHERE pres_estado = 1 AND (cli_razon_social like _buscar OR pres_numero LIKE _buscar);
END $$

CALL pa_presupuesto_reporte('2019');


-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_list;

CREATE PROCEDURE pa_presupuesto_list(
    IN _buscar      varchar(50),
    IN _pres_estado tinyint UNSIGNED
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
-- DROP PROCEDURE IF EXISTS pa_presupuesto_list;

CREATE PROCEDURE pa_presupuesto_list(
    IN _buscar      varchar(50),
    IN _pres_estado tinyint UNSIGNED
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
    IN _cli_codigo            int(11),
    IN _pres_descripcion      varchar(255),
    IN _pres_lugar_trabajo    varchar(45),
    IN _pres_costo_mano_obra  decimal(8, 2),
    IN _pres_costo_materiales decimal(8, 2),
    IN _pres_costo_total      decimal(8, 2),
    IN _pres_forma_pago       char(30),
    IN _pres_encargado        varchar(100),
    OUT _pres_cod             int(11)
)
BEGIN
    INSERT INTO presupuesto (
        cli_codigo,
        pres_descripcion,
        pres_lugar_trabajo,
        pres_fecha_emision,
        pres_hash_emision,
        pres_fecha_recepcion,
        pres_costo_mano_obra,
        pres_costo_materiales,
        pres_costo_total,
        pres_forma_pago,
        pres_encargado,
        pres_situacion,
        pres_estado
    )
    VALUES (
        _cli_codigo,
        _pres_descripcion,
        _pres_lugar_trabajo,
        now(),
        '',
        NULL,
        _pres_costo_mano_obra,
        _pres_costo_materiales,
        _pres_costo_total,
        _pres_forma_pago,
        _pres_encargado,
        0,
        1
    );
    -- 0: situacion: nuevo
    SET _pres_cod = LAST_INSERT_ID();
    UPDATE presupuesto SET pres_hash_emision = md5(_pres_cod) WHERE pres_cod = _pres_cod;
END $$


-- Tabla: presupuesto
-- DROP PROCEDURE IF EXISTS pa_presupuesto_update;

CREATE PROCEDURE pa_presupuesto_update(
    IN _pres_cod              int(11),
    IN _cli_codigo            int(11),
    IN _pres_descripcion      varchar(255),
    IN _pres_lugar_trabajo    varchar(45),
    IN _pres_costo_mano_obra  decimal(8, 2),
    IN _pres_costo_materiales decimal(8, 2),
    IN _pres_costo_total      decimal(8, 2),
    IN _pres_forma_pago       char(30),
    IN _pres_encargado        varchar(100)
)
BEGIN
    UPDATE presupuesto
    SET cli_codigo            = _cli_codigo,
        pres_descripcion      = _pres_descripcion,
        pres_lugar_trabajo    = _pres_lugar_trabajo,
        pres_costo_mano_obra  = _pres_costo_mano_obra,
        pres_costo_materiales = _pres_costo_materiales,
        pres_costo_total      = _pres_costo_total,
        pres_forma_pago       = _pres_forma_pago,
        pres_encargado        = _pres_encargado
    WHERE pres_cod = _pres_cod;
END $$


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

