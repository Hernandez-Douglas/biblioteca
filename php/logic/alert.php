<?php
# Leer datos del formulario Libro
function leerdatos($opcion)
{
    $id = intval($_POST['idEditarLibro']);
    $isbn = $_POST['isbn'];
    $titulo = $_POST['titulo'];
    @$copias = $_POST['copias'];
    $autor = intval($_POST['autor']);
    $tipo_libro = intval($_POST['tipo-libro']);
    $bibliotecario = intval($_POST['bibliotecario']);
    $marcadeTiempo = new DateTime();
    $imagen = $marcadeTiempo->format('Y-m-d-H-i-s') . '-' . str_replace(' ', '-', $_FILES['imagen']['name']);
    $ruta = $_FILES['imagen']['tmp_name'];
    if ($ruta) {
        $destino = STORAGE_BOOKS . $imagen;
        moverImagen($ruta, $destino);
    } else {
        $imagen = $_POST['imagen_db'];
    }
    if ($opcion == 'editar') {
        $array = array($isbn, $titulo, $autor, $tipo_libro, $imagen, $id);
        return $array;
    }
    if ($opcion == 'registrar') {
        $array = array($isbn, $titulo, $copias, $autor, $tipo_libro, $bibliotecario, $imagen);
        return $array;
    }
}
function moverImagen($ruta, $destino)
{
    move_uploaded_file($ruta, $destino);
}
# Crear alertas de informacion al usuario
function crearAlert($tipo, $mensaje)
{
?>
    <div class="alert fade alert-<?php echo $tipo; ?> alert-fixed show" id="offset-alert" role="alert" data-mdb-offset="100" data-mdb-autohide="true" data-mdb-delay="5000" data-mdb-position="top-right" data-mdb-width="250px" data-mdb-hidden="true" data-mdb-append-to-body="true" data-mdb-color="primary" style="display: block; width: 250px; top: 100px; right: 100px; bottom: unset; left: unset; transform: unset;">
        <i class="fas fa-info-circle me-3"></i><?php echo $mensaje; ?>
    </div>
<?php
    eliminarArlert();
}
# Eliminar Alerta despues de 4s
function eliminarArlert()
{
?>
    <script>
        let eliminarAlert = () => document.getElementById("offset-alert").remove();
        setTimeout(eliminarAlert, 4000);
    </script>
<?php
}
# Valores por defecto en la creacion de Alertas
$tipo = 'warning';
$mensaje = 'Error, no se registro | posible duplicado contacte al administrador.';

# Si el Bibliotecario esta registrando un nuevo Libro
if (isset($_POST['register'])) {
    $array = leerdatos('registrar');
    if ($book->Add($array) == true) {
        $tipo = 'info';
        $mensaje = 'Registrado en la base de datos.';
    }
    crearAlert($tipo, $mensaje);
}
# Si el Bibliotecario esta editando un Libro
if (isset($_POST['editar'])) {
    $array = leerdatos('editar');
    if ($book->Update($array) == true) {
        $tipo = 'info';
        $mensaje = 'Actualizado en la base de datos.';
    }
    crearAlert($tipo, $mensaje);
}


# limpiar campos
$id = 0;
$isbn = '';
$tituloLibro = '';
$copias = 1;
$idAutor = 1;
$autor = 'Selecciona Autor';
$idTipoLibro = 1;
$tipoLibro = 'Que tipo de libro es?';
$imagen_db = NULL;
# configuaracion del boton GUARDAR | EDITAR
$btnNombre = 'register';
?>