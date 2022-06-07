<?php
interface ICrud
{
    use Database;
}

interface ISelect extends ICrud
{
    function Select($query);
}
interface IAdd extends ICrud
{
    function Add($array);
}
interface IUpdate extends ICrud
{

    function Update($id);
}
interface IDelete extends ICrud
{
    function Delete($id);
}
