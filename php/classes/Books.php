<?php

declare(strict_types=1);

class Books implements ISelect, IAdd, IUpdate
{
    use Database;

    public function Select($sql)
    {
        return $this->ejecutar($sql)->fetchAll(PDO::FETCH_OBJ);
    }

    public function Add($array): bool
    {
        $sql = "INSERT INTO `libro` (`isbn`, `titulo`, `idAutor`, `tipoLibro`, `codigoBbliotecario`, `image`) VALUES ('$array[0]','$array[1]','$array[3]','$array[4]','$array[5]', '$array[6]');";

        if ($this->ejecutar($sql)) return $this->generarCopias($array[0], $array[2]);

        return false;
    }

    public function Update($array)
    {
        $sql = "UPDATE `libro` SET `isbn` = '$array[0]', `titulo` = '$array[1]', `idAutor` = '$array[2]', `tipoLibro` = '$array[3]', `image` = '$array[4]' WHERE id =$array[5];";
        return ($this->ejecutar($sql) ? true : false);
    }

    public function getAutores()
    {
        $sql = "SELECT `idAutor`,`nombre` FROM `autor`;";

        $autor = new Autor();
        return $autor->Select($sql);
    }

    function getTipoLibros()
    {
        $sql = "SELECT * FROM `tipos-de-libros`;";

        $tipos_de_libros = new TiposDeLibros();
        return $tipos_de_libros->Select($sql);
    }
    function generarCopias($isbn, $copias): bool
    {
        $sql = "CALL insertarCopias('$isbn', $copias);";

        $copia = new Copias();
        return $copia->Add($sql) || false;
    }
}

$book = new Books();
