<?php

declare(strict_types=1);

namespace php\classes\Book;

use php\interfaces\IAdd as InterfacesIAdd;
use php\Database\Database;

final class GenerateBook extends Database implements InterfacesIAdd
{
    public function __construct(private string $isbn, private int $copias)
    {
    }

    public function Add(): bool
    {
        $sql = "CALL insertarCopias('$this->isbn', $this->copias);";
        return  $this->ejecutar($sql);
    }
}
