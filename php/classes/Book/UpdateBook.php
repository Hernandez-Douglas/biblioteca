<?php

declare(strict_types=1);

namespace php\classes\Book;

use php\Database\Database;
use php\interfaces\IUpdate;

final class UpdateBook extends Database implements IUpdate
{
    public function __construct(private array $array)
    {
    }
    public function Update(): bool
    {
        $sql = "UPDATE `libro` SET `isbn` = '$this->array[0]', `titulo` = '$this->array[1]', `idAutor` = '$this->array[2]', `tipoLibro` = '$this->array[3]', `image` = '$this->array[4]' WHERE id =$this->array[5];";
        return ($this->ejecutar($sql) ? true : false);
    }
}
