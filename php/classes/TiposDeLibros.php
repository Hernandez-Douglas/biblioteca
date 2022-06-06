<?php
class TiposDeLibros extends Crud
{
    function Select($sql): array
    {
        #$sql = "SELECT * FROM `tipos-de-libros`;";
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
