var Presupuesto = function () {

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

    var detalles = [];
    var currentElement;
    var options  = {};
    var defaults = {
        modal: '#modal-presupuesto',
        table: '#tb-details'
    };
    var _table;
    var _modal;

    var init = function (opts) {
        options = $.extend(true, {}, defaults, opts);
        _modal  = $(options.modal);
        _table  = $(options.table);
    };

    var resetItem = function () {
        currentElement = {
            index: detalles.length,
        };

        var form     = _modal.find('form');
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

    var add = function () {
        var form     = _modal.find('form');
        var id       = $('#id_detalle', form);
        var producto = $('#cod_prod', form);
        var precio   = $('#precio', form);
        var cantidad = $('#cantidad', form);
        var importe  = toFloat(precio.val()) * toFloat(cantidad.val());
        var action   = $('#action');

        if (form.validate().errorList.length === 0) {
            var trElement;
            if (action.val() === 'new') {
                currentElement = {
                    index   : detalles.length,
                    id      : id.val(),
                    codigo  : producto.val(),
                    precio  : precio.val(),
                    cantidad: cantidad.val(),
                    total   : parseFloat(precio.val()) * parseFloat(cantidad.val()),
                };

                detalles.push(currentElement);

                trElement = $('<tr>');
                trElement.attr('data-index', currentElement.index);
                var tdProducto = $('<td>', {text: producto.find('option:selected').text()});
                var tdPrecio   = $('<td>', {text: precio.val()});
                var tdCantidad = $('<td>', {text: cantidad.val()});
                var tdImporte  = $('<td>', {text: importe});
                var tdAcciones = $('<td><button type="button" class="btn btn-sm btn-primary" onclick="Presupuesto.edit(' + currentElement.index + ')"><i class="fa fa-edit"></i></button><td>');

                trElement.append(tdProducto);
                trElement.append(tdPrecio);
                trElement.append(tdCantidad);
                trElement.append(tdImporte);
                trElement.append(tdAcciones);

                _table.find('tbody').append(trElement);

            } else {
                var temp             = currentElement;
                currentElement       = {
                    index   : temp.index,
                    id      : id.val(),
                    codigo  : producto.val(),
                    precio  : precio.val(),
                    cantidad: cantidad.val(),
                    total   : parseFloat(precio.val()) * parseFloat(cantidad.val()),
                };
                detalles[temp.index] = currentElement;

                trElement = $('tr[data-index="' + temp.index + '"]', _table);
                $('td:nth-child(1)', trElement).text(producto.find('option:selected').text());
                $('td:nth-child(2)', trElement).text(precio.val());
                $('td:nth-child(3)', trElement).text(cantidad.val());
            }

            producto.val('0').trigger('change');
            precio.val('');
            cantidad.val('');
            id.val(0);
            action.val('new');
            _modal.modal('hide');
        }

        calcularTotal();
    };

    var calcularTotal = function () {
        var costo_materiales = 0;
        var costo_mano_obra, costo_total;

        for (var i = 0; i < detalles.length; i++) {
            costo_materiales += detalles[i].total;
        }

        costo_mano_obra = toFloat($('#costo_mano_obra').val(), 0);
        costo_total     = costo_mano_obra + costo_materiales;

        $('#costo_materiales').val(costo_materiales.toFixed(2));
        $('#costo_total').val(costo_total.toFixed(2))
    };

    var edit = function (index) {
        _modal.modal('show');

        currentElement = detalles[index];
        var form       = _modal.find('form');
        var id         = $('#id_detalle', form);
        var producto   = $('#cod_prod', form);
        var precio     = $('#precio', form);
        var cantidad   = $('#cantidad', form);

        id.val(currentElement.id);
        producto.val(currentElement.codigo).trigger('change');
        precio.val(currentElement.precio);
        cantidad.val(currentElement.cantidad);

        $('#action').val('edit');
    };

    var save = function (url) {

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
        form_data.append('detalles', JSON.stringify(detalles));

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
        init         : init,
        add          : add,
        edit         : edit,
        reset        : resetItem,
        save         : save,
        calcularTotal: calcularTotal
    };

}();

function toFloat(valor, def) {
    def = (def != null) ? def : 0;
    return $.isNumeric(valor) ? parseFloat(valor) : def;
}
