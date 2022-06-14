<?php
class TiposDeLibros implements ISelect
{
    use Database;
    function Select($sql): array
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }
}
