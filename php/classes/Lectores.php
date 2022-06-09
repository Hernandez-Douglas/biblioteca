<?php 
class Lectores {
    function consultarEstado($consulta){
        $estado = new Prestamos();
        return $estado->Select($consulta);
    }
    function prestarLibro($consulta){
        $prestamo = new Prestamos();
        //$prestamo->Add($consulta);
        return $prestamo->Add($consulta);
    }
}

$lector = new Lectores();