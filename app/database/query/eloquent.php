<?php

class Eloquent{
    public $conn;
    public function __construct(){
        $conn = new DBConnection();
        $this->conn = $conn->conn();
    }
    public function all(){
        return $this->conn->query("SELECT * FROM $this->table");
    }

    public function where($query){
        return $this->conn->query("SELECT * FROM $this->table WHERE $query");
    }

    public function insert($column,$data){
        return $this->conn->query("INSERT INTO $this->table ($column) VALUES($data)");
    }

    public function update($query, $id){
        return $this->conn->query("UPDATE $this->table SET $query WHERE $id");
    }
}