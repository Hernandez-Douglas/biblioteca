<?php
class Lectores implements ISelect
{
    use Database;
    function Select($sql)
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    function consultarEstado($consulta)
    {
        $estado = new Prestamos();
        return $estado->Select($consulta);
    }
    function prestarLibro($consulta)
    {
        $prestamo = new Prestamos();
        //$prestamo->Add($consulta);
        return $prestamo->Add($consulta);
    }
    function devolverLibro($consulta)
    {
        $devolucion = new Devoluciones();
        return $devolucion->Add($consulta);
    }
}

$lector = new Lectores();
