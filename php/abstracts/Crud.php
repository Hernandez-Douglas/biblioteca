<?php
abstract class Crud {
    use Database;
    abstract function Select($query);
    abstract function Add($array);
    abstract function Delete($id);
    abstract function Update($id);
}
