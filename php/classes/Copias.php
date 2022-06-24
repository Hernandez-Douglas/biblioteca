<?php

declare(strict_types=1);
class Copias implements IAdd
{
    use Database;

    function Add($sql)
    {
        return  $this->ejecutar($sql);
    }
}
