<?php
class Prestamos implements ISelect, IAdd {
    use Database;
    function Select($sql)
    {
        $query = $this->pdo()->prepare($sql);
        @$query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    function Add($sql)
    {
        $query = $this->pdo()->prepare($sql);
        @$query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
