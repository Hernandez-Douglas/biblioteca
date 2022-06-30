<?php

declare(strict_types=1);

namespace php\classes\Book;

use php\Database\Database;
use php\interfaces\IAdd;

final class AddBook extends Database implements IAdd
{
    public function __construct(private array $value)
    {
    }

    public function Add(): bool
    {
        $sql = "INSERT INTO `libro` (`isbn`, `titulo`, `idAutor`, `tipoLibro`, `codigoBbliotecario`, `image`) VALUES ('$this->value[0]','$this->value[1]','$this->value[3]','$this->value[4]','$this->value[5]', '$this->value[6]');";

        if ($this->ejecutar($sql)) {
            $copia = new GenerateBook($this->value[0], $this->value[2]);
            return $this->$copia->generarCopias();
        }
        return false;
    }
}
