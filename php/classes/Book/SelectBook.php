<?php

declare(strict_types=1);

namespace php\classes\Book;

use PDO;
use php\Database\Database;
use php\interfaces\ISelect;

final class SelectBook extends Database implements ISelect
{
    public function __construct(private $sql)
    {
    }
    public function Select(): array
    {
        return $this->ejecutar($this->sql)->fetchAll(PDO::FETCH_OBJ);
    }
}
