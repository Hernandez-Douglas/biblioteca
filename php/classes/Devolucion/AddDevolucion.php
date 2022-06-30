<?php

declare(strict_types=1);

namespace php\classes\Devolucion;

use php\Database\Database;
use php\interfaces\IAdd;

final class AddDevolicion extends Database implements IAdd
{
    public function __construct(private $sql)
    {
    }
    public function Add(): bool
    {
        return $this->ejecutar($this->sql);
    }
}
