<?php
class Devoluciones implements IAdd
{
    use Database;
    function Add($sql)
    {
        return $this->ejecutar($sql)->fetchAll(PDO::FETCH_OBJ);
    }
}

