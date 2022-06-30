<?php

declare(strict_types=1);

namespace php\Database;

use Exception;
use PDO;
use PDOException;

class Database
{

    protected function pdo()
    {
        $host = "mysql:host=localhost;dbname=bd-biblioteca";
        $username = "root";
        $password = "";
        $option = [PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING];

        try {
            $pdo = new PDO($host, $username, $password, $option);
            if ($pdo instanceof PDO) {
                return $pdo;
            } else {
                throw new Exception(message: "Database not found");
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    protected function ejecutar($sql)
    {
        $query = $this->pdo()->prepare($sql);
        if (!@$query->execute()) return false;
        return $query;
    }
}
