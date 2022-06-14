<?php

interface ISelect
{
    function Select($sql);
}
interface IAdd
{
    function Add($sql);
}
interface IUpdate
{

    function Update($array);
}
interface IDelete
{
    function Delete($id);
}
