<?php
class Copias implements IAdd
{
    use Database;
    function Add($sql)
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
    }
}
