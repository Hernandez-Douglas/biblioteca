<?php
class Prestamos implements ISelect {
    use Database;
    function Select($sql)
    {
        $query = $this->pdo()->prepare($sql);
        //echo $sql;
        @$query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}