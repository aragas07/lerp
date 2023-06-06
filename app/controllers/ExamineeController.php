<?php
class ExamineeController{
    private $examinee;
    private $user;
    private $exams;
    private $subject;
    function __construct(){
        $this->examinee = new Examinee();
        $this->user = new Users();
        $this->exams = new Exams();
        $this->subject = new Subject();
    }
    
    public function getSubject(){
        $data = $this->subject->all();
        $tbody = "";
        while($d = $data->fetch_assoc()){
            $tbody .="<tr>
                <td>".$d['subject_name']."</td>
                <td>".$d['description']."</td>
            </tr>";
        }
        echo json_encode(['tbody'=>$tbody]);
    }

    public function getGrades($id){
        $getData = $this->exams->where("examinee_id = $id");
        $details = "";
        while($get = $getData->fetch_assoc()){
            $details=$get;
        }
        echo json_encode($details);
    }

    public function updateExaminee($fname,$mname,$lname,$birth,$lrn,$birthplace,$religion,$nationality,$gender,$status,$contact,$email,$home,$schoollastattend,$year,$address,$foption,$soption,$toption,$image,$id){
        $data = "";
        if($this->user->update("first_name = '$fname', middle_name = '$mname', last_name = '$lname'","id = $id")){
            $update = $this->examinee->update("birth='$birth', birthplace='$birthplace', gender='$gender', civil_status='$status', contact='$contact', home_address='$home', first_option='$foption', lrn='$lrn', nationality='$nationality',
            profile='$image', year='$year',religion='$religion', school_address='$address', school_last_attended='$schoollastattend', second_option='$soption', third_option='$toption'",
        "users_id = $id");
            $getUser = $this->user->where("id = '$id'");
            while($get = $getUser->fetch_assoc()){
                $data = $this->user->login($get['username'],$get['password']);
            }
        }
        echo $data;
    }
}