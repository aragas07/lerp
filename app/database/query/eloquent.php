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

    public function query($query){
        return $this->conn->query($query);
    }

    public function insertfile($name){
        $this->conn->query("INSERT INTO files (filename) VALUES('$name')");
        return $this->conn->query("SELECT id FROM files ORDER BY id DESC LIMIT 1");
    }

    public function join($table){
        $this->table = "$this->table INNER JOIN $table ON $this->table.id = $table.$this->table"."_id";
        return $this;
    }

    public function truncate(){
        return $this->conn->query("TRUNCATE $this->table");
    }

    public function insert($column,$data){
        return $this->conn->query("INSERT INTO $this->table ($column) VALUES($data)");
    }

    public function update($query, $id){
        return $this->conn->query("UPDATE $this->table SET $query WHERE $id");
    }

    public function delete($id){
        return $this->conn->query("DELETE FROM $this->table WHERE id = $id");
    }

    public function login($email,$password){
        $getUser = $this->conn->query("SELECT * FROM $this->table WHERE username = '$email' AND password = '$password' AND verified = 1");
        $login = array();
        $user = array();
        $success = false;
        $type = "";
        while($get = $getUser->fetch_assoc()){
            $success = true;
            $login = $get;
            $type = $get['usertype'];
            $_SESSION['id'] = $get['id'];
            $getUser = $this->conn->query("SELECT * FROM $type WHERE users_id = ".$get['id']);
            while($getuser = $getUser->fetch_assoc()){
                $user = $getuser;
            }
        }
        return json_encode(['success'=>$success,'login'=>$login, 'user'=>$user, 'auth'=>$type]);
    }
}