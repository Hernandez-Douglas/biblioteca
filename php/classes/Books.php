<?php
class Books extends Crud
{

    function Select($sql)
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    function Add($array)
    {
        $sql = "INSERT INTO `libro` (`isbn`, `titulo`, `copias`, `idAutor`, `tipoLibro`, `codigoBbliotecario`, `image`) VALUES ('$array[0]','$array[1]','$array[2]','$array[3]','$array[4]','$array[5]','$array[6]');";
        $query = $this->pdo()->prepare($sql);
        return ($query->execute() ? true : false);
        //print_r($array);
    }
    function Delete($id)
    {
    }
    function Update($array)
    {
        $sql = "UPDATE `libro` SET `isbn` = '$array[0]', `titulo` = '$array[1]', `copias` = '$array[2]', `idAutor` = '$array[3]', `tipoLibro` = '$array[4]', `image` = '$array[5]' WHERE id =$array[6];";
        $query = $this->pdo()->prepare($sql);
        return ($query->execute() ? true : false);
        //print_r($array);
    }
    function getAutores()
    {
        $sql = "SELECT `idAutor`,`nombre` FROM `autor`;";
        $autores = new Autores();
        return $autores->Select($sql);
    }
    function getTipoLibros()
    {
        $sql = "SELECT * FROM `tipos-de-libros`;";
        $tipos_de_libros = new TiposDeLibros();
        return $tipos_de_libros->Select($sql);
    }
}

$book = new Books();
