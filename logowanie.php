<?php
$con=mysqli_connect("localhost","root", "", "kino");
mysqli_query($con, 'SET NAMES utf8');
?>

<?php

	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location: repertuar_pracownik.php');
		exit();
	}

?>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
<title>mem kino</title>


<style type = "text/css">
	
	body {
		color: #ffffff;
		background-color: #222222;
		font-family: Century Gothic;}
	
	#container {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
		min-height: 500px;
		}

	a:link {
		color: white;
		text-decoration: none;}

	/* visited link */
	a:visited {
		color: white;
		text-decoration: none;}

	/* mouse over link */
	a:hover {
		color: red;
		text-decoration: none;}

	/* selected link */
	a:active {
		color: white;
		text-decoration: none;}
	
	#login {
		text-align: right;
		padding-top: 5px;
		padding-right: 15px;}
		
	#logo {
	text-align: center;}
	
	#nav {
		clear: both;
		color: #ffffff;
		text-align: center;
		font-size: 32px;
	}

	#wiersz {
	padding: 10px;
	text-align: center;
	display:inline-block;
	align: center;}

	.film
	{
		min-height: 240px;
		width: 170px;
		float: left;
		margin: 13px;
		background-color: #3F306D;
		align: center;
	}
	
	li {
		display: inline;
		margin-right: 30px;
		margin-bottom: 20px;
		margin-top: 20px;}
	
	li1 {
		display: inline;
		margin-left: 80px;
		margin-right: 80px;}
	
	#dol {
		text-align: center;
		font-size: 20px;
		margin: 0px;}
		
	#footer {
		clear: both;
		text-align: center;
		float: bottom;}	
		
	.logowanie {
		align: center;
		margin: 20px;}
		
	input {
		width: 300px;
		height: 30px;
		font-size: 16px;
		font-family: Century Gothic;}
	
	#content {
		margin-left: 150px;
		margin-top: 50px;
		font-size: 20px;}

</style>

</head>
<body>

	<div id="container">
		<div id="login">
			<a href="mem.php">Powrót do strony głównej</a>
		</div>
		<div id="logo">
			<a href="#"><img src="logo1.png"  height="90px" alt="Tu podaj tekst alternatywny" /></a>
		</div>
		
		<div id="content">
		
		Witaj! Zaloguj się:</br></br>

			<form action="zaloguj.php" method="post" >		
	
				Login:</br><input type="text" name="login" required="required"/></br></br>
			
				Hasło:</br><input type="password" name="haslo" required="required"/></br></br>
		
				<input type="submit" value="Zaloguj się" style="margin-left: 75px; width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;"/>

			</form>
		<?php
			if(isset($_SESSION['blad']))	echo $_SESSION['blad'];
		?>
		</div>
		
	</div>
	<div id="footer">
		 Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>