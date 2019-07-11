DELIMITER $$
-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_getRow;

CREATE PROCEDURE pa_actividad_empleado_getRow(
    IN _aemp_codigo int(11)
)
BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
    WHERE aemp.aemp_codigo = _aemp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_getByID;

CREATE PROCEDURE pa_actividad_empleado_getByID(
    IN _aemp_codigo int(11)
)
BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo
    WHERE aemp.aemp_codigo = _aemp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_listCbo;

CREATE PROCEDURE pa_actividad_empleado_listCbo(
    IN _aemp_codigo int(11)
)
BEGIN
    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_list;

CREATE PROCEDURE pa_actividad_empleado_list(
    IN _buscar varchar(50)
)
BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT aemp_codigo, act.act_cod, act_descripcion, emp_codigo, emp_nombre, aemp_pago_dia,
           aemp_cantidad_dias, aemp_total
    FROM actividad_empleado aemp
             INNER JOIN actividad act ON aemp.act_cod = act.act_cod
             INNER JOIN empleado emp ON aemp.emp_cod = emp.emp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_insert;

CREATE PROCEDURE pa_actividad_empleado_insert(
    IN _act_cod int(11),
    IN _emp_cod int(11),
    IN _aemp_pago_dia decimal(8, 2),
    IN _aemp_cantidad_dias tinyint(4),
    IN _aemp_total decimal(8, 2),
    OUT _aemp_codigo int(11)
)
BEGIN
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
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_update;

CREATE PROCEDURE pa_actividad_empleado_update(
    IN _aemp_codigo int(11),
    IN _act_cod int(11),
    IN _emp_cod int(11),
    IN _aemp_pago_dia decimal(8, 2),
    IN _aemp_cantidad_dias tinyint(4),
    IN _aemp_total decimal(8, 2)
)
BEGIN
    UPDATE actividad_empleado
    SET act_cod = _act_cod,
        emp_cod = _emp_cod,
        aemp_pago_dia = _aemp_pago_dia,
        aemp_cantidad_dias = _aemp_cantidad_dias,
        aemp_total = _aemp_total
    WHERE aemp_codigo = _aemp_codigo;
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_activate;

CREATE PROCEDURE pa_actividad_empleado_activate(
    IN _aemp_codigo int(11)
)
BEGIN
    -- actividad_empleado no tiene columna estado
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_deactivate;

CREATE PROCEDURE pa_actividad_empleado_deactivate(
    IN _aemp_codigo int(11)
)
BEGIN
    -- actividad_empleado no tiene columna estado
END $$

-- Tabla: actividad_empleado
-- DROP PROCEDURE IF EXISTS pa_actividad_empleado_delete;

CREATE PROCEDURE pa_actividad_empleado_delete(
    IN _aemp_codigo int(11)
)
BEGIN
    -- actividad_empleado no tiene columna estado
END $$

