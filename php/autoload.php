<?php
include_once "php/traits/Database.php";
include_once "php/abstracts/Crud.php";
//include_once "php/interfaces/Authentification.php";
include_once "php/classes/Books.php";
include_once "php/classes/Autores.php";
include_once "php/classes/TiposDeLibros.php";
# Variable global para almacenar las imagenes de libros.
define('STORAGE_BOOKS', __DIR__.'/public/images/books/');