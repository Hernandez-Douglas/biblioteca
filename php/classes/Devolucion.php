<?php
class Devoluciones implements IAdd
{
    use Database;
    function Add($sql)
    {
        $query = $this->pdo()->prepare($sql);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
        //return $sql;
    }
}

