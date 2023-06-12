<?php
    $url = explode("/",$_SERVER['REQUEST_URI']);
    $user = new UserController();
    $examinee = new ExamineeController();
    $admin = new AdminController();
    switch($url[2]){
        case "login": $user->login($_POST['email'],md5($_POST['password'])); break;
        case "register": $user->register(ucfirst($_POST['fname']),ucfirst($_POST['mname']),ucfirst($_POST['lname']),$_POST['email'],md5($_POST['password']),$_POST['usertype'],$_POST['idnumber']); break;
        case "verify": $user->verify($_POST['code'],$_SESSION['email'],$_SESSION['password']); break;
        case "getGrades": $examinee->getGrades($_POST['id']); break;
        case "getSubject": $admin->getSubject(); break;
        case "addSubject": $admin->addSubject($_POST['name'],$_POST['description']); break;
        case "updateSubject": $admin->updateSubject($_POST['name'],$_POST['description'],$_POST['id']); break;
        case "deleteSubject": $admin->deleteSubject($_POST['id']); break;
        case "updateexaminee": $examinee->updateExaminee( ucfirst($_POST['fname']), ucfirst($_POST['mname']), ucfirst($_POST['lname']), $_POST['birth'], $_POST['birthplace'], $_POST['religion'], $_POST['nationality'], $_POST['gender'], $_POST['status'], $_POST['contact'], $_POST['email'], $_POST['home'], $_POST['schoollastattend'], $_POST['year'], $_POST['address'], $_POST['foption'], $_POST['soption'], $_POST['toption'], $_POST['image'], $_POST['userid']); break;
        case "updateadmin": $admin->updateAdmin(ucfirst($_POST['fname']),ucfirst($_POST['mname']),ucfirst($_POST['lname']),$_POST['adminbirth'],$_POST['position'],$_POST['image'],$_POST['userid']); break;
        case "getUsers": $admin->getUsers($_POST['type'],$_POST['search'],$_POST['year']); break;
        case "getPersonInfo": $admin->getPersonInfo($_POST['id']); break;
        case "isLock": $admin->isLock($_POST['id']); break;
        case "submitGrade": $admin->submitGrade($_POST['gwa'],$_POST['entrance'],$_POST['entrancetotal'],$_POST['mock'],$_POST['mocktotal'],$_POST['userid']); break;
        case "lock": $admin->lock($_POST['lock'],$_POST['id']); break;
        case "adminDashboard": $admin->dashboard(); break;
        case "subjectList": $examinee->getSubject(); break;
        case "importFile": $admin->importFile($_FILES["file"]); break;
    }