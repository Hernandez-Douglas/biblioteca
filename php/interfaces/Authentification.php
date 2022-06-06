<?php
interface Authentification{
    function Login($username, $password);
    function Logout();
}
