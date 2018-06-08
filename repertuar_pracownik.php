<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: logowanie.php');
		exit();
	}
	$con=mysqli_connect("localhost","root", "", "kino");
	mysqli_query($con, 'SET NAMES utf8');
	

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
		text-align: center;}
		
	h1 {
		text-align: center;}	
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
				<li><a href="#" style="color: green">nowy bilet</a></li>
				<li><a href="baza_biletow.php">bilet-klient</a></li>
				<li><a href="bilety_sprzedane.php">bilet-pracownik</a></li></br>
				<li><a href="dodanie_filmu.php">dodaj film</a></li>
				<li><a href="dodanie_seansu.php">dodaj seans</a></li>
				<li><a href="admin_dodanie_pracownika.php">dodaj pracownika</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		
		<!-- REPERTUAR Z BAZY DANYCH 
		
		
		Widok Seanse-->
	<center>	
<form method="GET"> 

<?php
			echo "<p>Witaj ".$_SESSION['user']."!</p>";
			echo "Twoje ID to: ".$_SESSION['IdPracownik']."";
		?>
				<table width="600px" border = "1" cellpadding ="1" cellspacing = "1">
					<tr><td><b>Tytuł</b></td><td><b>Ograniczenie wiekowe</b></td><td><b>Gatunek</b></td></tr>
					<?php	
					$seanse = mysqli_query($con, 'SELECT * FROM `film`'); //zrobić tutaj + godzina i przy godzinie typ (dub, PL, ENG)
					while ($rec = mysqli_fetch_array($seanse))
					{
						
					 echo '<tr>
					 
					 <td><a href="pracownik_repertuar_wybor_daty.php?n1='.$rec['tytul'].'">'.$rec['tytul'].'</a></td>
					
					 <td>'.$rec['wiek'].'</td>
					 <td>'.$rec['rodzaj'].'</td>
					
					 </tr>';
					}
					?>
				</table>
		</form>
		</center>
	</div>


		
	<div id="footer">
		 </br>Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>