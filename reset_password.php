<?php
if (isset($_GET['reset_token'])){
	if (isset($_GET['reset'])){
		include('swatchity_config.php');
		include('swatchity_db_connect.php');
		include('swatchity_functions.php');
?>


<!DOCTYPE html>
<html class="" lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href='http://fonts.googleapis.com/css?family=Bubbler+One' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
		<link rel='stylesheet' href='/swatchity.css' type='text/css' media='all' />
		<title>Swatchity | Reset Password</title>
	</head>
	<body>
			<div class="casual_header">
				<a href="http://www.swatchity.com"><img src="images/swtchity_logo_100.png" alt="logo" style="margin-top:20px;"></a>
			</div>
			<div style="font-weight:bold;font-size:20px;text-align:center;">
<?php
		$reset_token=mysqli_real_escape_string($db,$_GET['reset_token']);
		$reset_email=mysqli_real_escape_string($db,$_GET['reset']);
		$reset_id=decode_reset_token($reset_token);

		$q="select * from users where user_email like '$reset_email' and user_id='$reset_id'";
		$result=mysqli_query($db,$q);
		if ($row=mysqli_fetch_assoc($result)){
			$new_pw=makePW();
			$pw_enc=cryptStr($new_pw);

			$to=$reset_email;
			$subject="Swatchity Password Has Been Reset";
			$body=$row['user_name'].", your new Swatchity.com password is '$new_pw' ";
			$headers = 'From: Swatchity <noreply@swatchity.com>' . PHP_EOL .
					'Reply-To: Swatchity <noreply@swatchity.com>' . PHP_EOL .
					'X-Mailer: PHP/' . phpversion();

			if (mail($to,$suvbject,$body,$headers)){
				echo "Your password has been reset and the email has been sent.";
				$q="UPDATE users set user_password='$pw_enc' where user_id='$reset_id'";
				mysqli_query($db,$q);
			} else {
				echo "There was an error. Please try again later.";
			}
		} else {
			echo "The email address or reset token is not valid. Please try again later.";
		}
		mysqli_free_result($result);
		mysqli_close($db);
?>
			</div>
		</body>
	</html>

<?php
	}
}

?>