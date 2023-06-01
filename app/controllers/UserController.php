<?php
class UserController{
    private $conn;
    private $examinee;
    private $user;
    private $exams;
    private $auth;
    public function __construct(){
        $conn = new DBConnection();
        $this->conn = $conn->conn();
        $this->examinee = new Examinee();
        $this->user = new Users();
        $this->exams = new Exams();
    }

    public function login($email,$password){
        $isExist = $this->user->where("username = '$email' and password = '$password'");
        $success = false;
        if(mysqli_num_rows($isExist) != 0){
            $this->auth = 'logged in';
            $success = true;
        }
        echo json_encode(['auth'=>$this->auth, 'success'=>$success]);
    }

    public function register($fname,$mname,$lname,$email,$password,$usertype){
        $success = false;
        $icon = 'error';
        $msg = "Sorry $email is already exist";
        $title = "Error";
        $_SESSION['email'] = $email;
        $mail = new Mailer();
        $isExist = $this->user->where("username = '$email'");
        if(mysqli_num_rows($isExist) == 0){
            if($this->user->insert("username,password,usertype","'$email','$password','$usertype'")){
                if($usertype == 'examinee'){
                    $icon = 'success';
                    $success = true;
                    $msg = 'Verify your account';
                    $title = "Success";
                }
                $mail->mail($email);
            }
        }
        echo json_encode(['icon'=>$icon,'msg'=>$msg, 'title'=>$title, 'success'=>$success, 'usertype'=>$usertype, 'swal'=>'input']);
    }

    public function verify($code,$email){
        $scode = $_SESSION['code'];
        $success = false;
        if($code == $scode){
            $this->user->update("verified = '1'","username = '$email'");
            $success = true;
        }
        echo json_encode(['success'=>$success]);
    }

    public function getGrades(){
        $getData = $this->exams->all();
        $data = array();
        while($get = $getData->fetch_assoc()){
            array_push($data,$get['exam_type']);
        }
        echo json_encode(['data'=>$data, 'auth'=>$this->auth]);
    }
}