<?php
	$con=mysqli_connect("localhost","root", "", "kino");
	session_start();
	mysqli_query($con, 'SET NAMES utf8');
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: logowanie.php');
		exit();
	}
	

		if (isset($_POST['seans']))
		{
			
			echo $seans;

			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
			
			
			$normalny = $_POST['normalne'];
			$ulgowy = $_POST['ulgowy'];
			$student = $_POST['student'];
			$senior = $_POST['senior'];
			$wybrane = $_POST['wybrane'];
			$seans	= $_POST['seans'];
			$user = $_SESSION['IdPracownik'];
		
			

			
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
					
							
						
							//dodanie biletow do bazy
							//$polaczenie->query("INSERT INTO bilet VALUE (NULL, '$imie', '$nazwisko', '$email', '$tel')");
							foreach ($wybrane as $miejsce){
							
								if($normalny != 0) {
									$rodzaj = 2;
									//$rodzaj = mysqli_fetch_array(mysqli_query($con, 'SELECT `IdRodzajBiletu` FROM `rodzaj_biletu` WHERE IdRodzajBiletu="2"'));
									$normalny--;
								}
								else if($senior != 0) {
									$rodzaj = 5;
									//$rodzaj = mysqli_fetch_array(mysqli_fetch_array(mysqli_query($con, 'SELECT `IdRodzajBiletu` FROM `rodzaj_biletu` WHERE IdRodzajBiletu="5"'));
									$senior--;
								}
								else if($ulgowy != 0) {
									$rodzaj = 3;
									//$rodzaj = mysqli_fetch_array(mysqli_query($con, 'SELECT `IdRodzajBiletu` FROM `rodzaj_biletu` WHERE IdRodzajBiletu="3"'));
									$ulgowy--;
								}
								else if($student != 0) {
									$rodzaj = 4;
									//$rodzaj = mysqli_fetch_array(mysqli_query($con, 'SELECT `IdRodzajBiletu` FROM `rodzaj_biletu` WHERE IdRodzajBiletu="4"'));
									$student--;
								}
								//$idseans = mysqli_fetch_array(mysqli_query($con, 'SELECT `IdSeans` FROM `seans` WHERE IdSeans=$seans'));
								//$idmiejsce = mysqli_fetch_array(mysqli_query($con, 'SELECT `IdMiejsce` FROM `miejsce` WHERE IdMiejsce=$miejsce'));
								//$klient = $idklient['IdKlient'];
								
								$polaczenie->query("INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES (NULL, NULL, '$seans', '$rodzaj', '$user', '$miejsce')");
								
							}
							
							//$polaczenie->query("INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES (NULL, '$klient', '$seans', '2', NULL, '3')");
							//$polaczenie->query("INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES (NULL, '1', '5', '5', '6', '4')");
							$_SESSION['udanarejestracja']=true;
			
							
							header('Location: pracownik_repertuar_zarezerwowano.php?id='.$_POST['seans'].'');
							
					
				}
			}
			catch(Exception $e)
			{
				echo '<span style="color: red">Błąd serwera! Przepraszamy za niedogodności i prosimy o rezerwację/kupno bieltu w innym terminie.</span>';
			}
			
			if ($wszystko_OK==true)
			{
				
				//Wszystkie testy zaliczone, dodanie danych klienta do bazy
				echo "Udało się!"; exit();
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
		min-height: 1020px;
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
				<li><a href="#">nowy bilet</a></li>
				<li><a href="baza_biletow.php">baza biletów</a></li>
				<li><a href="dodanie_filmu.php">dodaj film</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		
		<div id="content">
			
				
				
				
				<form method="post">
					
					
					<?php
					foreach ($wybrane as $miejsce){
						echo '<input type="hidden" name="wybrane[]" value='.$miejsce.'>';
					}
					?>
					<input type="hidden" name="seans" value=" <?php echo $seans; ?> "/>
					<input type="hidden" name="normalne" value=" <?php echo $normalny; ?> "/>
					<input type="hidden" name="ulgowy" value=" <?php echo $ulgowy; ?> "/>
					<input type="hidden" name="student" value=" <?php echo $student; ?> "/>
					<input type="hidden" name="senior" value=" <?php echo $senior; ?> "/>
				
					<input type="submit" value="Potwierdź" style="margin-left: 75px; width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;"/>
					</form>
		
		</div>
				
 HELLO DOBRZE POSZŁO :D
				
		

	</div>

		
	<div id="footer">
		 Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>