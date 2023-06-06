<?php
class AdminController{
    private $subject;
    private $admin;
    private $user;
    private $examinee;
    private $exams;
    function __construct(){
        $this->subject = new Subject();
        $this->admin = new Admin();
        $this->user = new Users();
        $this->examinee = new Examinee();
        $this->exams = new Exams();
    }

    public function getSubject(){
        $data = $this->subject->all();
        $thead = "<tr><th>Subject name</th><th>Description</th><th width='50px'>Function</th></tr>";
        $tbody = "";
        while($d = $data->fetch_assoc()){
            $tbody .= "<tr>
            <td>".$d['subject_name']."</td>
            <td>".$d['description']."</td>
            <td>
                <div class='justify'>
                    <i class='fas fa-edit'></i>
                    <i id=".$d['id']." class='fas fa-trash'></i>
                </div>
            </td>
            </tr>";
        }
        echo json_encode(['thead'=>$thead,'tbody'=>$tbody]);
    }

    public function addSubject($name,$description){
        $success = false;
        $msg = "Sorry you are not able to insert a new subject";
        if($this->subject->insert('subject_name,description',"'$name','$description'")){
            $success = true;
            $msg = "Successfully to insert new subject";
        }
        echo json_encode(['success'=>$success, 'msg'=>$msg]);
    }

    public function updateSubject($name,$description,$id){
        $success = false;
        $msg = "Sorry you are not able to update the subject";
        if($this->subject->update("subject_name = '$name', description = '$description'","id = $id")){
            $success = true;
            $msg = "Successfully to update the subject";
        }
        echo json_encode(['success'=>$success, 'msg'=>$msg]);
    }

    public function deleteSubject($id){
        $title = "Error";
        $text = "Sorry we have a problem about the database connection";
        $icon = "error";
        if($this->subject->delete($id)){
            $title = "Success";
            $text = "The subject has been deleted.";
            $icon = "success";
        }
        echo json_encode(["title"=>$title, "msg"=>$text, "icon"=>$icon]);
    }

    public function updateAdmin($fname,$mname,$lname,$birth,$position,$image,$id){
        $data = "";
        if($this->user->update("first_name = '$fname', middle_name = '$mname', last_name = '$lname'","id = $id")){
            $update = $this->admin->update("position='$position', birth='$birth', profile='$image'","users_id=$id");
            $getUser = $this->user->where("id = '$id'");
            while($get = $getUser->fetch_assoc()){
                $data = $this->user->login($get['username'],$get['password']);
            }
        }
        echo $data;
    }

    public function getUsers($type,$search,$year){
        $data = $this->user->join('examinee')->where("YEAR(register_date) = '$year' and register_date is not null and (first_name like '%$search%' or middle_name like '%$search%' or last_name like '%$search%' or home_address like '%$search%' or lrn like '%$search%')");
        $tbody = "";
        while($d = $data->fetch_assoc()){
            $bday = new DateTime($d['birth']); 
            $today = new Datetime(date('m.d.y'));
            $diff = $today->diff($bday);
            $name = $d['last_name']." ".$d['first_name']." ".$d['middle_name'];
            $tbody .="<tr>
                <td>".$d['lrn']."</td>
                <td>$name</td>
                <td>$diff->y</td>
                <td>".$d['home_address']."</td>
                <td>".$d['register_date']."</td>
                <td style='text-align: center'>
                    <div class='justify'>
                    <i id='".$d['users_id']."' class='fas fa-eye'></i>
                        <i class='fas fa-edit'></i>
                    </div>
                </td>
            </tr>";
        }
        echo json_encode(['tbody'=>$tbody]);
    }

    public function getPersonInfo($id){
        $data = $this->user->join('examinee')->where("users_id=$id");
        while($d = $data->fetch_assoc()){
            echo json_encode($d);
        }
    }

    public function isLock($id){
        $data = $this->examinee->where("users_id=$id");
        $exams = "";
        $grades = array();
        $score = $this->exams->where("id is not null limit 1");
        $getScore = array();
        $userid = "";
        while($d = $data->fetch_assoc()){
            $userid = $d['id'];
            $exams = $this->exams->where("examinee_id = ".$d['id']);
            while($e = $exams->fetch_assoc()){
                array_push($grades,$e);
            }
        }
        while($s = $score->fetch_assoc()){
            array_push($getScore,$s);
        }
        echo json_encode(['grades'=>$grades, 'score'=>$getScore,'userid'=>$userid]);
    }

    public function submitGrade($gwa,$entrance,$entrancetotal,$mock,$mocktotal,$id){
        $icon="error";
        $msg="Sorry we have database connection problem";
        $entrance = $entrance == null ? 0:$entrance;
        $mock = $mock == null ? 0:$mock;
        $gwa = $gwa == null ? 0:$gwa;
        
        if(mysqli_num_rows($this->exams->where("examinee_id = $id")) == 0){
            $this->exams->insert("examinee_id,gwa,entrance_exam,entrance_total,mock_exam,mock_total,locking",
            "$id,$gwa,$entrance,$entrancetotal,$mock,$mocktotal,0");
            $icon="success";
            $msg="The grade had been submitted";
        }else{
            $icon="success";
            $msg="The grade had been updated";
            $this->exams->update("gwa=$gwa,entrance_exam=$entrance,entrance_total=$entrancetotal,mock_exam=$mock,mock_total=$mocktotal","examinee_id = $id");
        }
        echo json_encode(["icon"=>$icon,"title"=>$msg]);
    }

    public function lock($lock,$id){
        $this->exams->update("locking = $lock","examinee_id = $id");
    }

    public function dashboard(){
        $mockData = $this->examinee->join("exams")->where("lrn is not null");
        $mock = array();
        while($get = $mockData->fetch_assoc()){
            array_push($mock,$get);
        }
        echo json_encode($mock);
    }
}