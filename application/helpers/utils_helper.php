<?php
    // Desde el servidor:

    define('PAGO_CONTADO', 1);
    define('PAGO_CUOTAS', 2);

    function getFormaPago() {
        $pagos                 = [];
        $pagos  [PAGO_CONTADO] = 'Contado';
        $pagos  [PAGO_CUOTAS]  = 'Cuotas';
        return $pagos;
    }

    // Desde el servidor:

    define('PRES_NUEVO', 0);
    define('PRES_ENVIADO', 1);
    define('PRES_ACEPTADO', 2);
    define('PRES_EN_EJECUCION', 3);
    define('PRES_TERMINADO', 4);
    define('PRES_ANULADO', 5);

    function getSituacionPresupuesto() {
        $situacion                      = [];
        $situacion  [PRES_NUEVO]        = 'Nuevo';
        $situacion  [PRES_ENVIADO]      = 'Enviado';
        $situacion  [PRES_ACEPTADO]     = 'Aceptado';
        $situacion  [PRES_EN_EJECUCION] = 'En ejecucion';
        $situacion  [PRES_TERMINADO]    = 'Terminado';
        $situacion  [PRES_ANULADO]      = 'Anulado';
        return $situacion;
    }

    // Entrada: [Y-m-d H:i:s] | Salida: [int]
    function NroMesesEntre($fecha1, $fecha2, $truncate = true) {
        $nro_meses = 0;
        if ($fecha1 && $fecha2) {
            if ($truncate) {
                $f1 = explode('-', $fecha1);
                $f2 = explode('-', $fecha2);
                // truncate to first day of month
                $fecha1 = new DateTime("$f1[0]-$f1[1]-01");
                $fecha2 = new DateTime("$f2[0]-$f2[1]-01");
            } else {
                try {
                    $fecha1 = new DateTime($fecha1);
                    $fecha2 = new DateTime($fecha2);
                } catch (Exception $e) {
                }
            }
            $diff      = date_diff($fecha1, $fecha2);
            $nro_meses = ($diff->y * 12) + $diff->m;
        }
        return $nro_meses;
    }

    function Moneda($abrev) {
        if ($abrev == 'PEN') {
            return 'S/';
        } elseif ($abrev == 'USD') {
            return '$';
        }
        return '';
    }

    //--------------------------------------------------

    function SetCurrentPage($pagina) {
        $_SESSION["pagina"] = $pagina;
        return $pagina;
    }

    function ReceiveParent($action, $default) {
        $sname = "$action.parent";

        if (isset($_GET['parent'])) {
            $pagina = $_GET['parent'];
            if ($pagina != 'default') {
                $_SESSION["$sname"] = $pagina;
            } else {
                $_SESSION["$sname"] = $pagina = $default;
            }
        } elseif (isset($_SESSION["$sname"])) {
            $pagina = $_SESSION["$sname"];
        } else {
            $_SESSION["$sname"] = $pagina = $default;
        }
        return $pagina;
    }

    function IssetPost($valores) {
        $valores = is_array($valores) ? $valores : [$valores];
        foreach ($valores as $v) {
            if (!isset($_POST[$v])) {
                return false;
            }
        }
        return true;
    }

    function IssetOr(&$campo, $def) {
        return isset($campo) ? $campo : $def;
    }

    // Funciones "Param" para la capa de VISTAS:
    // (Parametros recibidos por GET)

    function IssetGetParam($var_name) {
        return isset($_GET["$var_name"]);
    }

    function GetNumericParam($var_name, $default = 0) {
        return isset($_GET["$var_name"]) && is_numeric($_GET["$var_name"]) ? $_GET["$var_name"] : $default;
    }

    function GetStringParam($var_name, $default = '') {
        return isset($_GET["$var_name"]) ? $_GET["$var_name"] : $default;
    }

    // Login Access

    function CheckLoginAccess() {
        if (!isset($_SESSION["auth.usu_id"])) {
            echo "<script>window.location='login.php';</script>";
            exit();
        }
    }

    function GetAuthVar($var_name) {
        if (isset($_SESSION["auth.$var_name"])) {
            return $_SESSION["auth.$var_name"];
        }
        return null;
    }

    function dateTransform($value, $format1, $format2) {
        $date = DateTime::createFromFormat($format1, $value);
        return $date->format($format2);
    }

    function getShortMeses() {
        $meses     = array();
        $meses[1]  = 'Ene';
        $meses[2]  = 'Feb';
        $meses[3]  = 'Mar';
        $meses[4]  = 'Abr';
        $meses[5]  = 'May';
        $meses[6]  = 'Jun';
        $meses[7]  = 'Jul';
        $meses[8]  = 'Ago';
        $meses[9]  = 'Set';
        $meses[10] = 'Oct';
        $meses[11] = 'Nov';
        $meses[12] = 'Dic';
        return $meses;
    }

    function getMeses() {
        $meses     = array();
        $meses[1]  = 'Enero';
        $meses[2]  = 'Febrero';
        $meses[3]  = 'Marzo';
        $meses[4]  = 'Abril';
        $meses[5]  = 'Mayo';
        $meses[6]  = 'Junio';
        $meses[7]  = 'Julio';
        $meses[8]  = 'Agosto';
        $meses[9]  = 'Setiembre';
        $meses[10] = 'Octubre';
        $meses[11] = 'Noviembre';
        $meses[12] = 'Diciembre';
        return $meses;
    }

    function getDias() {
        $dias    = array();
        $dias[1] = 'Domingo';
        $dias[2] = 'Lunes';
        $dias[3] = 'Martes';
        $dias[4] = 'Miercoles';
        $dias[5] = 'Jueves';
        $dias[6] = 'Viernes';
        $dias[7] = 'Sabado';
        return $dias;
    }

    function getShortDias() {
        $dias    = array();
        $dias[1] = 'Dom';
        $dias[2] = 'Lun';
        $dias[3] = 'Mar';
        $dias[4] = 'Mie';
        $dias[5] = 'Jue';
        $dias[6] = 'Vie';
        $dias[7] = 'Sab';
        return $dias;
    }

    function convertToDays($days_number) {
        $m    = [];
        $days = getShortDias();
        foreach ($days_number as $n) {
            $m [] = IssetOr($days[$n], '');
        }
        return $m;
    }

    function dropAtEnd(&$cadena, $char) {
        $cadena = rtrim($cadena, $char);
    }

    function isBetween($valor, $ini, $fin) {
        return (isset($valor) && (($valor >= $ini && $valor < $fin) || ($ini > $fin && $valor >= $ini || $valor < $fin)));
    }

    function isBetweenArray($valor, $array, $col_ini, $col_fin, $col_return) {
        foreach ($array as $row) {
            $ini = $row[$col_ini];
            $fin = $row[$col_fin];
            if (isset($valor) && (($valor >= $ini && $valor < $fin) || ($ini > $fin && $valor >= $ini || $valor < $fin))) {
                return $row[$col_return];
            }
        }
        return "";
    }

    // PRONOSTICOS: -----------------------------------------
    define('PRS_AUTOMATICO', 1);
    define('PRS_MOVIL', 2);
    define('PRS_MOVIL_PONDERADO', 3);
    define('PRS_ESTACIONAL', 4);

    // TIEMPO : ---------------------------------------------
    define('TIEMPO_MINUTOS', 1);
    define('TIEMPO_HORAS', 2);
    define('TIEMPO_DIAS', 3);
    define('TIEMPO_SEMANAS', 4);
    define('TIEMPO_MESES', 5);
    define('TIEMPO_ANIOS', 6);

    function getTimePart() {
        $tiempo                 = [];
        $tiempo[TIEMPO_MINUTOS] = 'Minutos';
        $tiempo[TIEMPO_HORAS]   = 'Horas';
        $tiempo[TIEMPO_DIAS]    = 'Días';
        // $tiempo[TIEMPO_SEMANAS] = 'Semanas';
        $tiempo[TIEMPO_MESES] = 'Meses';
        $tiempo[TIEMPO_ANIOS] = 'Años';
        return $tiempo;
    }

    // Entrada: [Y-m-d] | Salida: el número del día de la semana, [dom: 0] a [sab: 6]
    function NroDiaSemana($date) {
        $newdate = new DateTime($date);
        return date_format($newdate, 'w');
    }

    // Entrada [nro_dia: 0 a 6]
    function DayName($nro_dia) {
        $dayNames = array("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado");
        return ($nro_dia >= 0 && $nro_dia <= 6) ? $dayNames[$nro_dia] : '';
    }

    // Entrada [nro_dia: 0 a 6]
    function DayShortName($nro_dia) {
        $dayNames = array("Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab");
        return ($nro_dia >= 0 && $nro_dia <= 6) ? $dayNames[$nro_dia] : '';
    }

    // Funciones de fecha
    function formatDate($date) {
        if ($date != '0000-00-00 00:00:00' && $date != null) {
            $newdate = new DateTime($date);

            return date_format($newdate, 'd/m/Y');
        } else {
            return '';
        }
    }

    function formatDateDMY_Name($date) {
        if ($date != '0000-00-00 00:00:00' && $date != null) {
            $newdate = new DateTime($date);

            return date_format($newdate, 'd M Y');
        } else {
            return '';
        }
    }

    function formatDateAM($date) {
        if ($date != '0000-00-00 00:00:00' && $date != null) {
            $newdate = new DateTime($date);

            return date_format($newdate, 'd/m/Y h:i a');
        } else {
            return '';
        }
    }

    function getHourFromDate($date) {
        if ($date != '0000-00-00 00:00:00' && $date != null) {
            $newdate = new DateTime($date);

            return date_format($newdate, 'h:i a');
        } else {
            return '';
        }
    }

    function getYear($date) {
        if ($date != '0000-00-00 00:00:00') {
            $newdate = new DateTime($date);

            return date_format($newdate, 'Y');
        } else {
            return '';
        }
    }

    function sumaFecha($date, $suma) {
        if ($date != '0000-00-00 00:00:00' && $date != null) {
            $nuevaFecha = strtotime($suma, strtotime($date));
            $nuevaFecha = date('Y-m-d', $nuevaFecha);
            return $nuevaFecha;
        } else {
            return '';
        }
    }

    function sumaFechaHora($date, $suma) {
        if ($date != '0000-00-00 00:00:00' && $date != null) {
            $nuevaFecha = strtotime($suma, strtotime($date));
            $nuevaFecha = date('Y-m-d H:i:s', $nuevaFecha);
            return $nuevaFecha;
        } else {
            return '';
        }
    }

    function horasDiff($fecha_fin, $fecha_ini) {
        $ini  = new DateTime($fecha_ini);
        $fin  = new DateTime($fecha_fin);
        $diff = $fin->diff($ini);
        $sign = ($ini <= $fin) ? 1 : -1;
        return $sign * ($diff->days * 24 + $diff->h);
    }

    function diasDiff($fecha_fin, $fecha_ini) {
        $ini  = new DateTime($fecha_ini);
        $fin  = new DateTime($fecha_fin);
        $diff = $fin->diff($ini);
        $sign = ($ini <= $fin) ? 1 : -1;
        return $sign * $diff->days;
    }

    function toDate($fecha) {
        if ($fecha != '0000-00-00 00:00:00' && $fecha != null) {
            $newDate = date($fecha);
            return $newDate;
        } else {
            return '';
        }
    }

    function dmyToYMD24H($cadena) {
        $new_time = DateTime::createFromFormat('d/m/Y h:i A', $cadena);
        $time_24  = $new_time->format('Y-m-d H:i:s');
        return $time_24;
    }

    function esMayorIgual($fecha1, $fecha2) {
        $a = toDate($fecha1);
        $b = toDate($fecha2);

        return ($a >= $b) ? 1 : 0;
    }

    // Funciones de texto
    function PadZero($val, $n = 3) {
        return str_pad($val, $n, '0', STR_PAD_LEFT);
    }

    function strtolower_utf8($string) {
        return mb_strtolower($string, 'UTF-8');
    }

    function strtoupper_utf8($string) {
        return mb_strtoupper($string, 'UTF-8');
    }

    // Funciones numericas
    function nformat($value, $d = 0) {
        return number_format($value, $d, '.', '');
    }

    function nformatEmpty($value, $d = 0) {
        return isset($value) ? number_format($value, $d, '.', '') : '';
    }

    function nformatNull($value, $d = 0) {
        return isset($value) ? number_format($value, $d, '.', '') : null;
    }

    function intformat($value) {
        if ($value > intval($value) || $value < intval($value)) {
            return $value;
        } else {
            return intval($value);
        }
    }

    function int_nformat($value, $d = 0) {
        if ($value > intval($value) || $value < intval($value)) {
            return number_format($value, $d, '.', '');
        } else {
            return intval($value);
        }
    }

    function int_vformat($value) {
        if ($value > intval($value) || $value < intval($value)) {
            $aux1 = number_format($value, 1, '.', '');
            $aux2 = number_format($value, 2, '.', '');

            return ($value == $aux1) ? $aux1 : $aux2;
        } else {
            return intval($value);
        }
    }

    function EmptyZero($val) {
        return ($val != 0) ? $val : '';
    }

    function GuionZero($val) {
        return ($val != 0) ? $val : '-';
    }

    function GetArrayByColumns($array, $col_names) {
        $vector    = array();
        $col_names = is_array($col_names) ? $col_names : [$col_names];

        foreach ($array as $key => $item) {
            foreach ($col_names as $col_name) {
                $vector[$key][$col_name] = $item[$col_name];
            }
        }
        return $vector;
    }

    function GetArrayByColumn($array, $col_name) {
        $vector = array();
        foreach ($array as $key => $item) {
            $vector[$key] = $item[$col_name];
        }
        return $vector;
    }

    function GetVectorByColumn($array, $col_name) {
        $vector = [];
        foreach ($array as $item) {
            $vector[] = $item[$col_name];
        }
        return $vector;
    }

    function GetVector($array) {
        $vector = array();
        foreach ($array as $key => $item) {
            $vector[] = $item;
        }
        return $vector;
    }

    // algoritmo quicksort
    function ordenar($vector, &$nros) {
        $len   = count($vector);
        $mitad = $len / 2;

        for ($i = 0; $i < $len; $i++) {
            $nros[$i] = $i;
        }

        for ($salto = $mitad; $salto != 0; $salto = intval($salto / 2)) {

            $cambios = true;
            while ($cambios) { // Mientras se intercambie algún elemento
                $cambios = false;
                for ($i = $salto; $i < $len; $i++) // se da una pasada
                {
                    if ($vector[$i - $salto] > $vector[$i]) { // y si están desordenados
                        $aux                 = $vector[$i]; // se reordenan
                        $vector[$i]          = $vector[$i - $salto];
                        $vector[$i - $salto] = $aux;

                        $x                 = $nros[$i]; // se reordenan
                        $nros[$i]          = $nros[$i - $salto];
                        $nros[$i - $salto] = $x;

                        $cambios = true; // y se marca como cambio.
                    }
                }
            }
        }
    }

    function print_value($value) {
        echo "<pre>$value</pre>";
    }

    function print_array($value) {
        echo "<pre>";
        $value = is_array($value) ? $value : [$value];
        print_r($value);
        echo "</pre>";
    }

    function exists_in($dato, $arreglo) {
        foreach ($arreglo as $item) {
            if ($dato == $item) {
                return $item;
            }
        }
        return null;
    }

    function SiNo($valor) {
        if ($valor == 1) {
            return 'Sí';
        } elseif ($valor == 0) {
            return 'No';
        }
        return '';
    }

    function save_file($ruta, $archivo, $contenido) {
        $archivo = fopen("$ruta/$archivo", "a+");
        fwrite($archivo, $contenido."\n");
        fclose($archivo);
    }

    function GetParam($key, $default = '') {
        return isset($_GET["$key"]) ? $_GET["$key"] : $default;
    }

    function PostParam($key, $default = '') {
        return isset($_POST["$key"]) ? $_POST["$key"] : $default;
    }

    // Entrada: [año][mes][dia][hora][min][seg]
    // ej. 20180101050010 -> 2018-01-01 05:00:10
    function convertToDate($date) {
        $anio = substr($date, 0, 4);
        $mes  = substr($date, 4, 2);
        $dia  = substr($date, 6, 2);
        $hora = substr($date, 8, 2);
        $min  = substr($date, 10, 2);
        $seg  = substr($date, 12, 2);
        return "$anio-$mes-$dia $hora:$min:$seg";
    }

    define('INACTIVO', 0);

    define('ACTIVO', 1);
    define('DESACTIVADO', 2);

    function getEstados() {
        $estados[INACTIVO]    = 'Inactivo';
        $estados[ACTIVO]      = 'Activo';
        $estados[DESACTIVADO] = 'Desactivado';
        return $estados;
    }

    define('EMPTY_STR', '');

    function selectIf($condition) {
        return ($condition == true) ? 'selected' : EMPTY_STR;
    }

    // Codifica los caracteres especiales para mostrar en los input text
    function htmlspecial($string) {
        // ENT_QUOTES: Codifica comillas simples y dobles
        return htmlspecialchars($string, ENT_QUOTES);
    }

    function verificarLogin() {
        if (!isset($_SESSION['auth.usu_cod'])) {
            redirect('inicio/login');
        }
    }

    function TipoRUC($tipo) {
        switch ($tipo) {
            case "empresa":
                return 20;
            case "natural":
                return 10;
            case "extranjero":
                return 17;
            default:
                return 0;
        }
    }

    // validaciones globales
    function ValidaRucPeru($ruc, $tipo) {

        $ruc    = trim($ruc);
        $factor = "5432765432";
        $dig11  = substr($ruc, 10, 1);

        // validaciones:

        if (!is_numeric($ruc) || strlen($ruc) != 11) {
            return false;
        }

        $valid_ini = array("10", "20", "17", "15");
        $dig_ini   = substr($ruc, 0, 2);

        if (!in_array($dig_ini, $valid_ini, true)) {
            return false;
        }

        if ($dig_ini != TipoRUC($tipo)) {
            return false;
        }

        // algoritmo:

        $producto = array();
        for ($i = 0; $i < 10; $i++) {
            $producto[] = substr($ruc, $i, 1) * substr($factor, $i, 1);
        }

        $suma = 0;
        foreach ($producto as $p) {
            $suma += $p;
        }

        $residuo = $suma % 11;
        $resta   = 11 - $residuo;
        $chk_dig = substr($resta, -1);

        if ($chk_dig == $dig11) {
            return true;
        } else {
            return false;
        }
    }

