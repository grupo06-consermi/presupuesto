var Compra = function () {

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

    var comp_prod_list = [];
    var comp_prod_actual;
    var options        = {};
    var defaults       = {
        modal_productos: '#modal_productos',
        tbl_productos  : '#tbl_productos'
    };
    var _tbl_productos;
    var _modal_productos;

    var init = function (opts) {
        options          = $.extend(true, {}, defaults, opts);
        _modal_productos = $(options.modal_productos);
        _tbl_productos   = $(options.tbl_productos);
    };

    var loadProductos = function (dpre_prod_list) {
        comp_prod_list = dpre_prod_list;
    };

    var reset_producto = function () {
        comp_prod_actual = {
            index: comp_prod_list.length,
        };

        var form     = _modal_productos.find('form');
        var producto = $('#cod_prod', form);
        var precio   = $('#precio', form);
        var cantidad = $('#cantidad', form);
        var action   = $('#action');

        producto.val('0').trigger('change');
        precio.val('');
        cantidad.val('');
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
                comp_prod_actual = {
                    index   : comp_prod_list.length,
                    id      : id.val(),
                    codigo  : producto.val(),
                    precio  : precio.val(),
                    cantidad: cantidad.val(),
                    total   : parseFloat(precio.val()) * parseFloat(cantidad.val()),
                };

                comp_prod_list.push(comp_prod_actual);

                trElement = $('<tr>');
                trElement.attr('data-index', comp_prod_actual.index);
                var tdProducto = $('<td>', {text: producto.find('option:selected').text()});
                var tdPrecio   = $('<td>', {text: precio.val()});
                var tdCantidad = $('<td>', {text: cantidad.val()});
                var tdImporte  = $('<td>', {text: importe});
                var btnEdit    = '<button type="button" class="btn btn-sm btn-primary" onclick="Compra.edit_producto(' + comp_prod_actual.index + ')"><i class="fa fa-edit"></i></button>';
                var btnDelete  = '<button type="button" class="btn btn-sm btn-danger" onclick="Compra.remove_producto(' + comp_prod_actual.index + ')"><i class="fa fa-close"></i></button>';
                var tdAcciones = $('<td>' + btnEdit + btnDelete + '</td>');

                trElement.append(tdProducto);
                trElement.append(tdPrecio);
                trElement.append(tdCantidad);
                trElement.append(tdImporte);
                trElement.append(tdAcciones);
                _tbl_productos.find('tbody').append(trElement);

            } else {
                var temp                   = comp_prod_actual;
                comp_prod_actual           = {
                    index   : temp.index,
                    id      : id.val(),
                    codigo  : producto.val(),
                    precio  : precio.val(),
                    cantidad: cantidad.val(),
                    total   : parseFloat(precio.val()) * parseFloat(cantidad.val()),
                };
                comp_prod_list[temp.index] = comp_prod_actual;

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
        }
        calcularTotal();
    };

    var remove_producto = function (index) {
        comp_prod_list.splice(index, 1);
        $('tr[data-index="' + index + '"]', _tbl_productos).remove();
    };

    var calcularTotal = function () {
        var costo_total = 0;
        for (var i = 0; i < comp_prod_list.length; i++) {
            costo_total += comp_prod_list[i].total;
        }
        $('#comp_costo_total').val(costo_total.toFixed(2))
    };

    var edit_producto = function (index) {
        _modal_productos.modal('show');
        index = toInteger(index);

        comp_prod_actual = comp_prod_list[index];

        var form     = _modal_productos.find('form');
        var producto = $('#cod_prod', form);
        var precio   = $('#precio', form);
        var cantidad = $('#cantidad', form);

        producto.val(comp_prod_actual.codigo).trigger('change');
        precio.val(comp_prod_actual.precio);
        cantidad.val(comp_prod_actual.cantidad);

        $('#action', form).val('edit');
    };

    var save_compra = function (url) {

        var form_data = new FormData();
        form_data.append('comp_cod', $('#comp_cod').val());
        form_data.append('prov_cod', $('#prov_cod').val());
        form_data.append('comp_fecha', $('#comp_fecha').val());
        form_data.append('comp_costo_total', $('#comp_costo_total').val());
        form_data.append('prod_list', JSON.stringify(comp_prod_list));

        console.log(comp_prod_list);


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

            console.log(data);
            if (data > 0) {
                alert('Guardado correcto');
                if ($('#comp_cod').val() > 0) {
                    window.location.href = '../listar';
                } else {
                    window.location.href = 'listar';
                }
            } else {
                alert('Error al registrar' + data);
                console.log('Error al registrar' + data);
            }
        });
    };

    return {
        init           : init,
        add_producto   : add_producto,
        edit_producto  : edit_producto,
        reset_producto : reset_producto,
        save_compra    : save_compra,
        calcularTotal  : calcularTotal,
        loadProductos  : loadProductos,
        remove_producto: remove_producto,
        pres_prod_list : comp_prod_list
    };
}();
