<?php
$encabezado = 'Formulario registro de libros';
# Editar o registrar
if (isset($_GET['id'])) {
    $encabezado = 'Editar registro de libros';
    $btnNombre = 'editar';
    $id = intval($_GET['id']);
    $sqlLibro = "SELECT * FROM `v_editar_libro` WHERE ideditar = $id;";
    $tblLibro = $book->Select($sqlLibro);

    $isbn = $tblLibro[0]->isbn;
    $tituloLibro = $tblLibro[0]->titulo;
    $idAutor = $tblLibro[0]->{'id autor'};
    $autor = $tblLibro[0]->{'nombre autor'};
    $idTipoLibro = $tblLibro[0]->{'id tipo libro'};
    $tipoLibro = $tblLibro[0]->{'tipo de libro'};
    $imagen_db = $tblLibro[0]->{'imagen'};
}
?>