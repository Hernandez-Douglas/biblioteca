<?php
include_once "php/traits/Database.php";
//include_once "php/abstracts/Crud.php";
include_once "php/interfaces/ICrud.php";
include_once "php/classes/Copias.php";
include_once "php/classes/Books.php";
include_once "php/classes/Autor.php";
include_once "php/classes/TiposDeLibros.php";
# Variable global para almacenar las imagenes de libros.
define('STORAGE_BOOKS', __DIR__.'/public/images/books/');