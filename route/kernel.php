<?php
    $url = explode("/",$_SERVER['REQUEST_URI']);
    $user = new UserController();

    switch($url[2]){
        case "login": $user->login($_POST['email'],md5($_POST['password'])); break;
        case "register": $user->register($_POST['fname'],$_POST['mname'],$_POST['lname'],$_POST['email'],md5($_POST['password']),$_POST['usertype']); break;
        case "verify": $user->verify($_POST['code'],$_SESSION['email']); break;
        case "getGrades": $user->getGrades(); break;

    }