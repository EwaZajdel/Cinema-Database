<?php
//	mysqli_query($con, 'SET NAMES utf8');
	session_start();
	
	$con=mysqli_connect("localhost","root", "", "kino");
	mysqli_query($con, 'SET NAMES utf8');
	
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: logowanie.php');
		exit();
	}

		if (isset($_POST['tytul']))
		{
			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
			
			$tytul = $_POST['tytul'];
			$rezyser =$_POST['rezyser'];
			$rok_wydania = $_POST['rok_wydania'];
			$rodzaj =$_POST['rodzaj'];
			$wiek =$_POST['wiek'];
			$opis =$_POST['opis'];
			$linki =$_POST['linki'];
			
			//Sprawdzenie długości tytulu, rezysera, rodzaju i opisu
			if ((strlen($tytul)<1) || (strlen($tytul)>100))
			{
				$wszystko_OK=false;
				$_SESSION['e_tytul']="Od 1 do 100 znaków!";
			}
			
			if ((strlen($rezyser)<2) || (strlen($rezyser)>50))
			{
				$wszystko_OK=false;
				$_SESSION['e_rezyser']="Od 2 do 50 znaków!";
			}
			
			if ((strlen($rodzaj)<2) || (strlen($rodzaj)>50))
			{
				$wszystko_OK=false;
				$_SESSION['e_rodzaj']="Od 2 do 50 znaków!";
			}
					
			/*if ((strlen($opis)<2) || (strlen($opis)>255))
			{
				$wszystko_OK=false;
				$_SESSION['e_opis']="Od 2 do 255 znaków!";
			}*/
			
			//Sprawdzenie poprawnosci tytul, rezyser
			if (!preg_match('/^[-0-9a-ząćęłńóśźż\- @s]+$/ui', $tytul))
			{
				$wszystko_OK=false;
				$_SESSION['e_tytul']="Zawiera niedozwolone znaki";
			}
			
			if (!preg_match('/^[a-ząćęłńóśźż\-  @s]+$/ui', $rezyser))
			{
				$wszystko_OK=false;
				$_SESSION['e_rezyser']="Zawiera niedozwolone znaki";
			}
			
			//Sprawdzenie numeru telefonu i wikeu
			if (strlen($rok_wydania)!=4)
			{
				$wszystko_OK=false;
				$_SESSION['e_rok_wydania']="Podaj 4 cyfry";
			}
			if (!preg_match('/^[0-9]+$/', $rok_wydania))
			{
				$wszystko_OK=false;
				$_SESSION['e_rok_wydania']="Zawiera niedozwolone znaki";
			}
		
		
			if (!preg_match('/^[0-9]+$/', $wiek))
			{
				$wszystko_OK=false;
				$_SESSION['e_wiek']="Zawiera niedozwolone znaki";
			}
	
			
			require_once "connect.php";
			mysqli_report(MYSQLI_REPORT_STRICT);
			
			try
			{
				$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
				if ($polaczenie->connect_errno!=0)
				{
					throw new Exception(mysqli_connect_errno());
				}
				else
				{
					if ($wszystko_OK==true)
					{
						//Wszystkie testy zaliczone, dodanie danych klienta do bazy
						if ($polaczenie->query("INSERT INTO film VALUE (NULL, '$tytul','$rezyser', '$rok_wydania', '$rodzaj', '$wiek', '$opis', '$linki')"))
						{
							$_SESSION['udanarejestracja1']=true;
							header('Location: film_dodany.php');
						}
						else
						{
							throw new Exception ($polaczenie->error);
						}
					}
					$polaczenie->close();
				}
			}
			catch(Exception $e)
			{
				echo '<span style="color: red">Błąd serwera! Przepraszamy za niedogodności i proszimy o dodanie filmu w późniejszym czasie.</span>';
				echo $e;
			}
			
			if ($wszystko_OK==true)
			{
				//Wszystkie testy zaliczone, dodanie danych klienta do bazy
				//echo "Udało się!"; exit();
			}
		}

?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
		min-height: 1150px;
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
		max-width: 300px;}
		
	#side {
		float: center;
		margin-right: 50px;
		margin-top: 20px;
		text-align: center;
		font-size: 24px;}
		
	.error{
		color: red;
		margin-top: 10px;
		margin-bottom: 10px;
		font-size: 15px;
	}
</style>

<script src='https://www.google.com/recaptcha/api.js'></script>
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
				<li><a href="#" style="color: green">dodaj film</a></li>
				<li><a href="dodanie_seansu.php">dodaj seans</a></li>
				<li><a href="admin_dodanie_pracownika.php">dodaj pracownika</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		<div id="content">
			<div id="main">
				<form method="post">
					Uzupełnij dane filmu: 
					<div class="logowanie">
						*Tytuł:</br>
						<input type="text" name="tytul" /></br>
						<?php
						if (isset($_SESSION['e_tytul']))
						{
							echo '<div class="error">'.$_SESSION['e_tytul'].'</div>';
							unset($_SESSION['e_tytul']);
						}
						?>
					</div>
					
					<div class="logowanie">
						Reżyser:</br>
						<input type="text" name="rezyser" /></br>
						<?php
						if (isset($_SESSION['rezyser']))
						{
							echo '<div class="error">'.$_SESSION['e_rezyser'].'</div>';
							unset($_SESSION['e_rezyser']);
						}
						?>
					</div>
					
					<div class="logowanie">
						*Rok Wydania:</br>
						<input type="text" name="rok_wydania" /></br></br>
						<?php
						if (isset($_SESSION['e_rok_wydania']))
						{
							echo '<div class="error">'.$_SESSION['e_rok_wydania'].'</div>';
							unset($_SESSION['e_rok_wydania']);
						}
						?>
						
					</div>
											
											
					<div class="logowanie">
						*Rodzaj:</br>
						<input type="text" name="rodzaj" /></br></br>
						<?php
						if (isset($_SESSION['e_rodzaj']))
						{
							echo '<div class="error">'.$_SESSION['e_rodzaj'].'</div>';
							unset($_SESSION['e_rodzaj']);
						}
						?>
					</div>
											
											
					<div class="logowanie">
						*Wiek:</br>
						<input type="text" name="wiek" /></br></br>
						<?php
						if (isset($_SESSION['e_wiek']))
						{
							echo '<div class="error">'.$_SESSION['e_wiek'].'</div>';
							unset($_SESSION['e_wiek']);
						}
						?>
						
					</div>
											
											
					<div class="logowanie">
						Opis:</br>
						<input type="text" name="opis" /></br></br>
						<?php
						if (isset($_SESSION['e_opis']))
						{
							echo '<div class="error">'.$_SESSION['e_opis'].'</div>';
							unset($_SESSION['e_opis']);
						}
						?>
						</div>
						
					<div class="logowanie">
						Linki:</br>
						<input type="text" name="linki" /></br></br>
						<?php
						if (isset($_SESSION['e_linki']))
						{
							echo '<div class="error">'.$_SESSION['e_linki'].'</div>';
							unset($_SESSION['e_linki']);
						}
						?>
					</div>
					<div class="logowanie">
						<input type="submit" value="Potwierdź" style="margin-left: 75px; width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;"/>
					</div>
					

				</form>
			</div>
		</div>
</div>

		
	<div id="footer">
		 Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>