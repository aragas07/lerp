<?php
class UserController{
    private $examinee;
    private $user;
    private $exams;
    private $filelist;
    private $admin;
    public function __construct(){
        $this->examinee = new Examinee();
        $this->user = new Users();
        $this->exams = new Exams();
        $this->filelist = new Filelist();
        $this->admin = new Admin();
    }

    public function login($email,$password){
        echo $this->user->login($email,$password);
    }

    public function register($fname,$mname,$lname,$email,$password,$usertype){
        $success = false;
        $icon = 'error';
        $msg = "Sorry $email is already exist";
        $title = "Error";
        $_SESSION['email'] = $email;
        $_SESSION['password'] = $password;
        $mail = new Mailer();
        $isExist = $this->user->where("username = '$email'");
        if(mysqli_num_rows($isExist) == 0){
            if($this->user->insert("username,password,usertype,first_name,middle_name,last_name","'$email','$password','$usertype','$fname','$mname','$lname'")){
                if($usertype == 'admin'){
                    $icon = 'success';
                    $success = true;
                    $msg = 'Verify your account';
                    $title = "Success";
                }
                $mail->mail($email);
                $getId = $this->user->where("username = '$email'");
                while($get = $getId->fetch_assoc()){
                    $this->admin->insert("users_id","{$get['id']}");
                }
            }
        }
        echo json_encode(['icon'=>$icon,'msg'=>$msg, 'title'=>$title, 'success'=>$success, 'usertype'=>$usertype, 'swal'=>'input']);
    }

    public function verify($code,$email,$password){
        $scode = $_SESSION['code'];
        $success = false;
        if($code == $scode){
            $this->user->update("verified = '1'","username = '$email'");
            $success = true;
        }
        echo $this->user->login($email,$password);
    }

    public function paging(){
        extract($_POST);
        $result = $this->filelist->where("filename like '%$search%' limit 10");
        $tbody = '';
        while($row = $result->fetch_assoc()){
            $tbody .= "<tr>
                <td>{$row['filename']}</td>
                <td style='width: 70px; text-align: center'>
                    <i value='{$row['id']}' class='fas fa-eye'></i>
                </td>
            </tr>";
        }
        $rownum = $this->filelist->where("filename like '%$search%'");
        $pageNumber = ceil($rownum->num_rows/10);
        $paging = '<li class="page-item" value="0"><a class="page-link">«</a></li>';
        $t = 0;
        for($i = 0; $i < $pageNumber ;$i++){
            $t = $i*10;
            $paging .= '<li value="'.$t.'" class="page-item page-number ';
            if($i == 0){ $paging .= 'active';}
            $paging .= '"><a class="page-link">'.($i+1).'</a></li>';
        }
        $paging .= '<li class="page-item" value="'.$t.'"><a class="page-link">»</a></li>';
        echo json_encode(['tbody'=>$tbody,'paging'=>$paging]);
    }

    public function getpage(){
        extract($_POST);
        $result = $this->filelist->where("filename like '%$search%' limit $start,10");
        $tbody = '';
        while($row = $result->fetch_assoc()){
            $tbody .= "<tr>
                <td>{$row['filename']}</td>
                <td style='width: 70px; text-align: center'>
                    <i value='{$row['id']}' class='fas fa-eye'></i>
                </td>
            </tr>";
        }
        echo json_encode(['tbody'=>$tbody,'start'=>$start]);
    }

}