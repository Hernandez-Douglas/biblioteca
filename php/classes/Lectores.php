<?php 
class Lectores {
    function consultarEstado($consulta){
        $estado = new Prestamos();
        return $estado->Select($consulta);
    }
}

$lector = new Lectores();