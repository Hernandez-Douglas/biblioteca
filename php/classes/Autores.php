<?php
class Autores extends Crud
{
    function Select($sql): array
    {
        //$sql = "SELECT `idAutor`,`nombre` FROM `autor`;";
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }
    function Add($array)
    {
    }
    function Update($id)
    {
    }
    function Delete($id)
    {
    }
}
//$autor = new Autores();
