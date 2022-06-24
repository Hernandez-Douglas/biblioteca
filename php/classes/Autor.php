<?php
class Autor implements ISelect
{
    use Database;
    function Select($sql): array
    {
        return $this->ejecutar($sql)->fetchAll(PDO::FETCH_OBJ);
    }
}
