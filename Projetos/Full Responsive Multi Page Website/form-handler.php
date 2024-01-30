<?php
$name = $_POST['name'];
$visitor_email = $_POST['email'];
$subject = $_POST['subject'];
$message = $_POST['message'];

$email_from = 'unifesp@gmail.com';

$email_subject = 'New Form Submission';

$email_body = "User Name: $name.\n".
              "User Email: $visitor_email.\n".
              "Subject: $subject.\n".
              "Usar Message: $message .\n";

$to = 'diego.araujodhs@hotmail.com';

$hearders = "From: $email_from \r\n";

$hearders .= "Reply-to: $visitor_email \r\n";

mail($to,$email_subject,$email_body,$hearders);

header("Location: contact.html");
?>