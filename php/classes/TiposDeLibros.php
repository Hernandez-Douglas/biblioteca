<?php
class TiposDeLibros implements ISelect
{
    use Database;
    function Select($sql): array
    {
        return $this->ejecutar($sql)->fetchAll(PDO::FETCH_OBJ);
    }
}
