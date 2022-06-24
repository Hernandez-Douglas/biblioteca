<?php

$title = 'Formulario registro de libros';
include_once('php/autoload.php');
require_once('php/components/head.php');
require_once('php/logic/alert.php');

// Cargamos los datos de autores y tipos de libros
$datosAutor = $book->getAutores();
$datosTiposDeLibros = $book->getTipoLibros();


require_once('php/view/books/form_libro.php');
require_once('php/components/footer.php');
