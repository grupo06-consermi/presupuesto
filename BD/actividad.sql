DELIMITER $$
-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_getRow;

CREATE PROCEDURE pa_actividad_getRow(
    IN _act_cod int(11)
)
BEGIN
    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE act.act_cod = _act_cod;
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_getByID;

CREATE PROCEDURE pa_actividad_getByID(
    IN _act_cod int(11)
)
BEGIN
    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE act.act_cod = _act_cod;
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_listCbo;

CREATE PROCEDURE pa_actividad_listCbo(
    IN _act_cod int(11)
)
BEGIN
    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE act.act_estado = 1 OR (act.act_cod = _act_cod);
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_list;

CREATE PROCEDURE pa_actividad_list(
    IN _buscar varchar(50),
    IN _act_estado tinyint unsigned
)
BEGIN
    SET @aux = _buscar;
    SET _buscar = IF(_buscar <> '', concat('%', replace(_buscar, ' ', '%'), '%'), '%');

    SELECT act_cod, pre.pres_cod, act_descripcion, act_fecha_inicio, act_fecha_fin, act_costo_total,
           act_estado
    FROM actividad act
             INNER JOIN presupuesto pre ON act.pres_cod = pre.pres_cod
    WHERE (act.act_descripcion LIKE _buscar)
      AND act.act_estado = _act_estado;
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_insert;

CREATE PROCEDURE pa_actividad_insert(
    IN _pres_cod int(11),
    IN _act_descripcion varchar(100),
    IN _act_fecha_inicio datetime,
    IN _act_fecha_fin datetime,
    IN _act_costo_total decimal(8, 2),
    OUT _act_cod int(11)
)
BEGIN
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
END $$


call pa_actividad_insert (16, 'actividades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 200, @act_cod);

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_update;

CREATE PROCEDURE pa_actividad_update(
    IN _act_cod int(11),
    IN _pres_cod int(11),
    IN _act_descripcion varchar(100),
    IN _act_fecha_inicio datetime,
    IN _act_fecha_fin datetime,
    IN _act_costo_total decimal(8, 2)
)
BEGIN
    UPDATE actividad
    SET pres_cod = _pres_cod,
        act_descripcion = _act_descripcion,
        act_fecha_inicio = _act_fecha_inicio,
        act_fecha_fin = _act_fecha_fin,
        act_costo_total = _act_costo_total
    WHERE act_cod = _act_cod;
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_activate;

CREATE PROCEDURE pa_actividad_activate(
    IN _act_cod int(11)
)
BEGIN
    UPDATE actividad
    SET act_estado = 1
    WHERE act_cod = _act_cod;
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_deactivate;

CREATE PROCEDURE pa_actividad_deactivate(
    IN _act_cod int(11)
)
BEGIN
    UPDATE actividad
    SET act_estado = 2
    WHERE act_cod = _act_cod;
END $$

-- Tabla: actividad
DROP PROCEDURE IF EXISTS pa_actividad_delete;

CREATE PROCEDURE pa_actividad_delete(
    IN _act_cod int(11)
)
BEGIN
    UPDATE actividad
    SET act_estado = 0
    WHERE act_cod = _act_cod;
END $$

