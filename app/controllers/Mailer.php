<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require './../mailer/vendor/autoload.php';

class Mailer{
    public function mail($email){
        $mail = new PHPMailer(true);
        try {
            $mail->SMTPDebug = 0;
            $mail->isSMTP();
            $mail->Host       = 'smtp.gmail.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'emilyatuba@gmail.com';
            $mail->Password   = 'usqfqsdutkcfffad';
            $mail->SMTPSecure = 'tls';
            $mail->Port       = 587;
            
            $mail->setFrom('argieragasd8d7@gmail.com', 'LERP');
            $code = rand(10000, 99999);
            $_SESSION['code'] = $code;
            $mail->addAddress($email);
            $mail->isHTML(true);
            $mail->Subject = 'Verification code';
            $mail->Body    = '<html><body style="margin: auto; padding: 10px; width: 400px; border-radius: 4px;border: 1px solid #bdbbbb; text-align:center">
            
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi7-BdTA707IJ98LXXfcf-i7ALYDx6TVg68unp-6c&s" alt="">
                <h3>This is your verification code</h3>
                <h1>'.$code.'</h1>
                <h3>to verify your account in Licensure Examination Result Predictor for BLEPT ( LERP )</h3>
            </body></html>';
        
            $mail->send();
            $msg = 'Message has been sent';
            return true;
        } catch (Exception $e) {
            $msg = "Message could not be sent. Mailer Error";
            return false;
        }
    }
}