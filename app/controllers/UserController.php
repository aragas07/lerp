<?php
class UserController{
    private $examinee;
    private $user;
    private $exams;
    public function __construct(){
        $this->examinee = new Examinee();
        $this->user = new Users();
        $this->exams = new Exams();
    }

    public function login($email,$password){
        echo $this->user->login($email,$password);
    }

    public function register($fname,$mname,$lname,$email,$password,$usertype,$idnumber){
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
                if($usertype == 'examinee'){
                    $icon = 'success';
                    $success = true;
                    $msg = 'Verify your account';
                    $title = "Success";
                }
                $mail->mail($email);
                $getId = $this->user->where("username = '$email'");
                while($get = $getId->fetch_assoc()){
                    $this->examinee->insert("users_id,register_date,idnumber",$get['id'].",now(),'$idnumber'");
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

}