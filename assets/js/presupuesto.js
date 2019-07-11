var Presupuesto = function () {

    /* validacion */

    $.extend($.validator.defaults, {
        errorElement  : 'span',
        errorPlacement: function (error, element) {
            var parentInput = element.closest('.input-group');
            error.css({color: '#dd4b39'});
            if (parentInput.length > 0) {
                error.insertAfter(parentInput);
            } else {
                error.insertAfter(element);
            }
        },
        highlight     : function (element, errorClass, validClass) {
            $(element)
                .closest(".form-group")
                .addClass("has-error");
        },
        unhighlight   : function (element, errorClass, validClass) {
            $(element)
                .closest(".form-group")
                .removeClass("has-error");
        }
    });

    $('[role="submit"]').on('click', function () {
        var form     = $(this).data('target');
        var callback = $(this).data('callback');
        if ($(form).valid()) {
            eval(callback);
        }
    });

    $('#cod_prod').on('change', function () {
        var data   = $(this).data();
        var option = $(this).find('option:selected');
        if (!$.isEmptyObject(data)) {
            $(data.target).val(option.attr(data.attr));
        }
    });

    var prod_list = [];
    var prod_actual;
    var emp_list  = [];
    var emp_actual;
    var options   = {};
    var defaults  = {
        modal_productos: '#modal_productos',
        modal_empleados: '#modal_empleados',
        tbl_productos  : '#tbl_productos',
        tbl_empleados  : '#tbl_empleados'

    };
    var _tbl_productos;
    var _modal_productos;
    var _modal_empleados;
    var _tbl_empleados;

    var init = function (opts) {
        options          = $.extend(true, {}, defaults, opts);
        _modal_productos = $(options.modal_productos);
        _tbl_productos   = $(options.tbl_productos);
        _modal_empleados = $(options.modal_empleados);
        _tbl_empleados   = $(options.tbl_empleados);
    };

    var reset_producto = function () {
        prod_actual = {
            index: prod_list.length,
        };

        var form     = _modal_productos.find('form');
        var id       = $('#id_detalle', form);
        var producto = $('#cod_prod', form);
        var precio   = $('#precio', form);
        var cantidad = $('#cantidad', form);
        var action   = $('#action');

        producto.val('0').trigger('change');
        precio.val('');
        cantidad.val('');
        id.val(0);
        action.val('new');
    };

    var add_producto = function () {
        var form     = _modal_productos.find('form');
        var id       = $('#id_detalle', form);
        var producto = $('#cod_prod', form);
        var precio   = $('#precio', form);
        var cantidad = $('#cantidad', form);
        var importe  = toFloat(precio.val()) * toFloat(cantidad.val());
        var action   = $('#action');

        if (form.validate().errorList.length === 0) {
            var trElement;
            if (action.val() === 'new') {
                prod_actual = {
                    index   : prod_list.length,
                    id      : id.val(),
                    codigo  : producto.val(),
                    precio  : precio.val(),
                    cantidad: cantidad.val(),
                    total   : parseFloat(precio.val()) * parseFloat(cantidad.val()),
                };

                prod_list.push(prod_actual);

                trElement = $('<tr>');
                trElement.attr('data-index', prod_actual.index);
                var tdProducto = $('<td>', {text: producto.find('option:selected').text()});
                var tdPrecio   = $('<td>', {text: precio.val()});
                var tdCantidad = $('<td>', {text: cantidad.val()});
                var tdImporte  = $('<td>', {text: importe});
                var tdAcciones = $('<td><button type="button" class="btn btn-sm btn-primary" onclick="Presupuesto.edit_producto(' + prod_actual.index + ')"><i class="fa fa-edit_producto"></i></button><td>');

                trElement.append(tdProducto);
                trElement.append(tdPrecio);
                trElement.append(tdCantidad);
                trElement.append(tdImporte);
                trElement.append(tdAcciones);

                _tbl_productos.find('tbody').append(trElement);

            } else {
                var temp              = prod_actual;
                prod_actual           = {
                    index   : temp.index,
                    id      : id.val(),
                    codigo  : producto.val(),
                    precio  : precio.val(),
                    cantidad: cantidad.val(),
                    total   : parseFloat(precio.val()) * parseFloat(cantidad.val()),
                };
                prod_list[temp.index] = prod_actual;

                trElement = $('tr[data-index="' + temp.index + '"]', _tbl_productos);
                $('td:nth-child(1)', trElement).text(producto.find('option:selected').text());
                $('td:nth-child(2)', trElement).text(precio.val());
                $('td:nth-child(3)', trElement).text(cantidad.val());
            }

            producto.val('0').trigger('change');
            precio.val('');
            cantidad.val('');
            cantidad.focus();
            id.val(0);
            action.val('new');
            // _modal_productos.modal('hide');
        }

        calcularTotal();
    };

    var add_empleado = function () {
        var form       = _modal_empleados.find('form');
        var emp_codigo = $('#emp_codigo', form);
        var pago_dia   = $('#aemp_pago_dia', form);
        var tiempo     = $('#aemp_cantidad_dias', form);
        var importe    = toFloat(pago_dia.val()) * toFloat(tiempo.val());
        var action     = $('#action', form);

        if (form.validate().errorList.length === 0) {
            var trElement;
            if (action.val() === 'new') {
                emp_actual = {
                    index     : emp_list.length,
                    emp_codigo: emp_codigo.val(),
                    pago_dia  : pago_dia.val(),
                    tiempo    : tiempo.val(),
                    importe   : importe
                };

                emp_list.push(emp_actual);

                trElement = $('<tr>');
                trElement.attr('data-index', emp_actual.index);
                var tdEmpleado = $('<td>', {text: emp_codigo.find('option:selected').text()});
                var tdPagoDia  = $('<td>', {text: pago_dia.val()});
                var tdTiempo   = $('<td>', {text: tiempo.val()});
                var tdUnidad   = $('<td>', {text: 'días'});
                var tdImporte  = $('<td>', {text: importe});
                var tdAcciones = $('<td><button type="button" class="btn btn-sm btn-primary" onclick="Presupuesto.edit_empleado(' + emp_actual.index + ')"><i class="fa fa-edit_producto"></i></button><td>');

                trElement.append(tdEmpleado);
                trElement.append(tdPagoDia);
                trElement.append(tdTiempo);
                trElement.append(tdUnidad);
                trElement.append(tdImporte);
                trElement.append(tdAcciones);

                _tbl_empleados.find('tbody').append(trElement);

            } else {
                var temp             = emp_actual;
                emp_actual           = {
                    index     : emp_list.length,
                    emp_codigo: emp_codigo.val(),
                    pago_dia  : pago_dia.val(),
                    tiempo    : tiempo.val(),
                    importe   : importe
                };
                emp_list[temp.index] = emp_actual;

                trElement = $('tr[data-index="' + temp.index + '"]', _tbl_empleados);

                $('td:nth-child(1)', trElement).text(emp_codigo.find('option:selected').text());
                $('td:nth-child(2)', trElement).text(pago_dia.val());
                $('td:nth-child(3)', trElement).text(tiempo.val());
                $('td:nth-child(4)', trElement).text('días');
                $('td:nth-child(5)', trElement).text(importe);
            }

            emp_codigo.val('0');
            pago_dia.val('');
            tiempo.val('');
            tiempo.focus();
            action.val('new');
        }

        calcularTotal();
    };

    var calcularTotal = function () {
        var costo_materiales = 0;
        var costo_total;
        var costo_mano_obra  = 0;

        for (var i = 0; i < emp_list.length; i++) {
            costo_mano_obra += toFloat(emp_list[i].importe);
        }

        for (var i = 0; i < prod_list.length; i++) {
            costo_materiales += prod_list[i].total;
        }

        costo_total = costo_mano_obra + costo_materiales;

        $('#costo_materiales').val(costo_materiales.toFixed(2));
        $('#costo_mano_obra').val(costo_mano_obra.toFixed(2));
        $('#costo_total').val(costo_total.toFixed(2))
    };

    var edit_producto = function (index) {
        _modal_productos.modal('show');

        prod_actual  = prod_list[index];
        var form     = _modal_productos.find('form');
        var id       = $('#id_detalle', form);
        var producto = $('#cod_prod', form);
        var precio   = $('#precio', form);
        var cantidad = $('#cantidad', form);

        id.val(prod_actual.id);
        producto.val(prod_actual.codigo).trigger('change');
        precio.val(prod_actual.precio);
        cantidad.val(prod_actual.cantidad);

        $('#action', form).val('edit');
    };

    var edit_empleado = function (index) {
        _modal_empleados.modal('show');
        emp_actual     = emp_list[index];
        var form       = _modal_empleados.find('form');
        var emp_codigo = $('#emp_codigo', form);
        var pago_dia   = $('#aemp_pago_dia', form);
        var tiempo     = $('#aemp_cantidad_dias', form);
        var action     = $('#action', form);

        emp_codigo.val(emp_actual.emp_codigo);
        pago_dia.val(emp_actual.pago_dia);
        tiempo.val(emp_actual.tiempo);

        $('#action', form).val('edit');
    };

    var save_presupuesto = function (url) {

        var form_data = new FormData();
        form_data.append('cli_codigo', $('#cbo_clientes').val());
        form_data.append('fechaEmision', $('#fecha_emision').val());
        form_data.append('fechaRecepcion', $('#fecha_recepcion').val());
        form_data.append('formaPago', $('#forma_pago').val());
        form_data.append('lugarTrabajo', $('#lugar_trabajo').val());
        form_data.append('estado', $('#estado').val());
        form_data.append('costoManoObra', $('#costo_mano_obra').val());
        form_data.append('costoMateriales', $('#costo_materiales').val());
        form_data.append('costoTotal', $('#costo_total').val());
        form_data.append('encargado', $('#encargado').val());
        form_data.append('prod_list', JSON.stringify(prod_list));
        form_data.append('emp_list', JSON.stringify(emp_list));

        $.ajax({
            url        : url,
            type       : 'POST',
            contentType: false,
            data       : form_data,
            processData: false,
            error      : function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Error: " + XMLHttpRequest + ' ' + textStatus + ' ' + errorThrown);
            }
        }).done(function (data) {
            if (data > 0) {
                alert('Registro correcto');
                window.location.href = 'index';
            } else {
                alert('Error al registrar');
            }
        });
    };

    return {
        init            : init,
        add_producto    : add_producto,
        add_empleado    : add_empleado,
        edit_producto   : edit_producto,
        edit_empleado   : edit_empleado,
        reset_producto  : reset_producto,
        save_presupuesto: save_presupuesto,
        calcularTotal   : calcularTotal
    };

}();

function toFloat(valor, def) {
    def = (def != null) ? def : 0;
    return $.isNumeric(valor) ? parseFloat(valor) : def;
}
