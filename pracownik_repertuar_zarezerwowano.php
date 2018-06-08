<?php
	session_start();
	$con=mysqli_connect("localhost","root", "", "kino");
	if (!isset($_SESSION['udanarejestracja']))
	{
		header('Location: repertuar_pracownik.php');
		exit();
	}
	else
	{
		unset($_SESSION['udanarejestracja']);
	}
	
			/*			
		$normalny = $_POST['normalne'];
		$ulgowy = $_POST['ulgowy'];
		$student = $_POST['student'];
		$senior = $_POST['senior'];
		$wybrane = $_POST['wybrane'];
		$seans	= $_POST['seans'];*/
	
	
?>


<!DOCTYPE html>
<html>
<head>
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
		min-height: 300px;
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
		font-size: 25px;
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
		margin: 13px;
		background-color: #3F306D;}
		
	
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
		text-align: center;}	
		
	.film img
	{
		display: block; 
		margin: 0 auto;
		width: 170px;
		height: 240px;
		-webkit-transition: all 1s ease; -moz-transition: all 1s ease; -o-transition: all 1s ease;}
	
	.film img:hover 
	{
		-o-transition: all 0.6s;
		-moz-transition: all 0.6s;
		-webkit-transition: all 0.6s;
		-moz-transform: scale(1.1);
		-o-transform: scale(1.1);
		-webkit-transform: scale(1.1);
		-webkit-filter: brightness(115%);
		filter: brightness(115%);
		cursor: pointer;}
		
	.logowanie {
		align: center;
		margin: 20px;
		}
		
	label {
		<!--display: block;-->
		padding: 10px 20px;
		font-size: 20px;}

	input {
		width: 300px;
		height: 30px;
		font-size: 16px;
		font-family: Century Gothic;}
		#content {
		margin-left: 150px;
		margin-top: 50px;
		font-size: 20px;}
		
	#main {
		float:left;
		max-width: 350px;}
		
	#side {
		float: center;
		margin-right: 50px;
		margin-top: 20px;
		text-align: center;
		font-size: 24px;}
</style>

</head>
<body>
	<div id="login">
		<a href="wyloguj.php"><b>wyloguj się</b></a>
	</div>
	<div id="container">
		<div id="logo">
			<a href="#"><img src="logo1.png"  height="90px" alt="Tu podaj tekst alternatywny" /></a>
		</div>
		
		<div id="nav">
			<hr color="#ffffff", width="800px">
			<ul>
				<li><a href="repertuar_pracownik.php">nowy bilet</a></li>
				<li><a href="baza_biletow.php">bilet-klient</a></li>
				<li><a href="bilety_sprzedane.php">bilet-pracownik</a></li></br>
				<li><a href="dodanie_filmu.php">dodaj film</a></li>
				<li><a href="dodanie_seansu.php">dodaj seans</a></li>
				<li><a href="admin_dodanie_pracownika.php">dodaj pracownika</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>

		
			<center>ŻYCZ UDANEGO SEANSU ☻☺♥</center></br></br>
	
	

</div>

	</div>
		
	<div id="footer">
		 Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>