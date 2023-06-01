<?php
class DBConnection{
    public function conn(){
        return new mysqli("localhost", "root", "","lerp");
    }
}