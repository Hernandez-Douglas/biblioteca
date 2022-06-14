<?php
class Autores implements ISelect
{
    use Database;
    function Select($sql): array
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }
}
