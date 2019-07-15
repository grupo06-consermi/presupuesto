function toFloat(valor, def) {
    def = (def != null) ? def : 0;
    return $.isNumeric(valor) ? parseFloat(valor) : def;
}

// Convierte a entero si "valor" es numérico, sino retorna "def"
function toInteger(valor, def) {
    def = (typeof def !== 'undefined') ? def : 0;
    return $.isNumeric(valor) ? parseInt(valor) : def;
}


function jsonParse(str) {
    try {
        if (str !== 'null') {
            return JSON.parse(str);
        } else {
            return '';
        }
    } catch (e) {
        return '';
    }
}
