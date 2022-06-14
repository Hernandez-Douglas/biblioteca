<?php
class Books implements IAdd, ISelect, IUpdate
{
    use Database;
    public function Select($sql)
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function Add($array)
    {
        $sql = "INSERT INTO `libro` (`isbn`, `titulo`, `idAutor`, `tipoLibro`, `codigoBbliotecario`, `image`) VALUES ('$array[0]','$array[1]','$array[3]','$array[4]','$array[5]', '$array[6]');";
        $query = $this->pdo()->prepare($sql);
        @$insertarLibro = $query->execute();
        if ($insertarLibro) {
            $this->generarCopias($array[0], $array[2]);
        }
        return ($insertarLibro ? true : false);
    }

    public function Update($array)
    {
        $sql = "UPDATE `libro` SET `isbn` = '$array[0]', `titulo` = '$array[1]', `idAutor` = '$array[2]', `tipoLibro` = '$array[3]', `image` = '$array[4]' WHERE id =$array[5];";
        $query = $this->pdo()->prepare($sql);
        return ($query->execute() ? true : false);
        //print_r($sql);
    }

    public function getAutores()
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
    function generarCopias($isbn, $copias)
    {
        $sql = "CALL insertarCopias('$isbn', $copias);";
        //print_r($sql);
        $insertar = new Copias();
        $insertar->Add($sql);
    }
}

$book = new Books();
