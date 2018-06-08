<?php
	$con=mysqli_connect("localhost","root", "", "kino");
	session_start();
	/*

	if(!isset($_POST['email']))
	{
		header('Location: mem.php');
		exit();
	}*/

		if (isset($_POST['email']))
		{
			
			//echo $seans;

			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
			
			$imie = $_POST['imie'];
			$nazwisko =$_POST['nazwisko'];
			$email = $_POST['email'];
			$tel =$_POST['tel'];
			
			$normalny = $_POST['normalne'];
			$ulgowy = $_POST['ulgowy'];
			$student = $_POST['student'];
			$senior = $_POST['senior'];
			$wybrane = $_POST['wybrane'];
			$seans	= $_POST['seans'];
			
			//echo $seans;
			
			//Sprawdzenie długości imienia i nazwiska
			if ((strlen($imie)<3) || (strlen($imie)>25))
			{
				$wszystko_OK=false;
				$_SESSION['e_imie']="Od 3 do 25 znaków!";
			}
			
			if ((strlen($nazwisko)<2) || (strlen($nazwisko)>50))
			{
				$wszystko_OK=false;
				$_SESSION['e_nazwisko']="Od 2 do 50 znaków!";
			}
			
			//Sprawdzenie poprawnosci imienia i nazwiska
			if (!preg_match('/^[a-ząćęłńóśźż]+$/ui', $imie))
			{
				$wszystko_OK=false;
				$_SESSION['e_imie']="Zawiera niedozwolone znaki";
			}
			
			if (!preg_match('/^[a-ząćęłńóśźż\-]+$/ui', $nazwisko))
			{
				$wszystko_OK=false;
				$_SESSION['e_nazwisko']="Zawiera niedozwolone znaki";
			}
			
			//Sprawdzenie numeru telefonu
			if (strlen($tel)!=9)
			{
				$wszystko_OK=false;
				$_SESSION['e_tel']="Podaj 9 cyfr bez prefiksu.";
			}
			if (!preg_match('/^[0-9]+$/', $tel))
			{
				$wszystko_OK=false;
				$_SESSION['e_tel']="Zawiera niedozwolone znaki";
			}
			
			//Sprawdzenie poprawności email
			$emailB=filter_var($email, FILTER_SANITIZE_EMAIL);
			if ((filter_var($emailB, FILTER_VALIDATE_EMAIL)==false) || ($emailB!=$email))
			{
				$wszystko_OK=false;
				$_SESSION['e_email']="Podaj poprawny adres e-mail.";
			}
			
			//Regulamin
			if (!isset($_POST['regulamin']))
			{
				$wszystko_OK=false;
				$_SESSION['e_regulamin']="Zaakceptuj regulamin.";
			}
			
			//Recaptcha
			$sekret="6LfYKVsUAAAAAIUmsa09xhGouK8VhieEGd1qotJh";
			$sprawdz=file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$sekret.'&response='.$_POST['g-recaptcha-response']);
			$odpowiedz=json_decode($sprawdz);
			if ($odpowiedz->success==false)
			{
				$wszystko_OK=false;
				$_SESSION['e_bot']="Potwierdź, że nie jesteś botem.";
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
						if ($polaczenie->query("INSERT INTO klient VALUE (NULL, '$imie', '$nazwisko', '$email', '$tel')"))
						{
							
							$idklient =  mysqli_fetch_array(mysqli_query($con, 'SELECT max(IdKlient) FROM klient'));
							$klient = $idklient[0];
						
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
								
								$polaczenie->query("INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES (NULL, '$klient', '$seans', '$rodzaj', NULL, '$miejsce')");
								
							}
							
							//$polaczenie->query("INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES (NULL, '$klient', '$seans', '2', NULL, '3')");
							//$polaczenie->query("INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES (NULL, '1', '5', '5', '6', '4')");
							$_SESSION['udanarejestracja']=true;
			
							
							header('Location: repertuar_zarezerwowano.php?id='.$_POST['seans'].'');
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
		<a href="logowanie.php"><b>logowanie</b></a>
	</div>
	<div id="container">
		<div id="logo">
			<a href="#"><img src="logo1.png"  height="90px" alt="Tu podaj tekst alternatywny" /></a>
		</div>
		
		<div id="nav">
			<hr color="#ffffff", width="800px">
			<ul>
				<li><a href="repertuar.php">repertuar</a></li>
				<li><a href="cennik.php">cennik</a></li>
				<li><a href="promocje.php">promocje</a></li>
				<li><a href="news.php">newsy</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		<div id="content">
			<div id="main">
			<?php
						$normalny = $_POST['normalne'];
						$ulgowy = $_POST['ulgowy'];
						$student = $_POST['student'];
						$senior = $_POST['senior'];
						$wybrane = $_POST['wybrane'];
						$seans	= $_POST['seans'];?>
				<form method="post">
					Uzupełnij swoje dane: </br>
					* - pole wymagane
					<div class="logowanie">
						*Imię:</br>
						<input type="text" name="imie" value=""/></br>
						<?php
						if (isset($_SESSION['e_imie']))
						{
							echo '<div class="error">'.$_SESSION['e_imie'].'</div>';
							unset($_SESSION['e_imie']);
						}
						?>
					</div>
					<div class="logowanie">
						*Nazwisko:</br>
						<input type="text" name="nazwisko" value="" /></br>
						<?php
						if (isset($_SESSION['e_nazwisko']))
						{
							echo '<div class="error">'.$_SESSION['e_nazwisko'].'</div>';
							unset($_SESSION['e_nazwisko']);
						}
						?>
					</div>
					<div class="logowanie">
						*E-mail:</br>
						<input type="email" name="email" value=""/></br>
						<?php
						if (isset($_SESSION['e_email']))
						{
							echo '<div class="error">'.$_SESSION['e_email'].'</div>';
							unset($_SESSION['e_email']);
						}
						?>
					</div>
					<div class="logowanie">
						*Telefon:</br>
						<input type="text" name="tel" value=""/></br></br>
						<?php
						if (isset($_SESSION['e_tel']))
						{
							echo '<div class="error">'.$_SESSION['e_tel'].'</div>';
							unset($_SESSION['e_tel']);
						}
						?>
					</div>
					<div class="logowanie">
					<label><input type="checkbox" checked name="regulamin" style="width: 15px; height: 15px;"/> Akceptuję regulamin.*</label>
					<?php
						if (isset($_SESSION['e_regulamin']))
						{
							echo '<div class="error">'.$_SESSION['e_regulamin'].'</div>';
							unset($_SESSION['e_regulamin']);
						}
						?>
					</div>
					<div class="logowanie">
						<div class="g-recaptcha" data-sitekey="6LfYKVsUAAAAAHMl0aTKFGU1RFjpIOpqPr0s1Uk4"></div>
						<?php
						if (isset($_SESSION['e_bot']))
						{
							echo '<div class="error">'.$_SESSION['e_bot'].'</div>';
							unset($_SESSION['e_bot']);
						}
						?>
					</div>
					<div class="logowanie">
					
					<?php
					foreach ($wybrane as $miejsce){
						echo '<input type="hidden" name="wybrane[]" value='.$miejsce.'>';
					}?>
					<input type="hidden" name="seans" value="<?php echo $seans;?>"/>
					<input type="hidden" name="normalne" value="<?php echo $normalny;?>"/>
					<input type="hidden" name="ulgowy" value="<?php echo $ulgowy;?>"/>
					<input type="hidden" name="student" value="<?php echo $student;?>"/>
					<input type="hidden" name="senior" value="<?php echo $senior;?>"/>
				
					<input type="submit" value="Potwierdź" style="margin-left: 75px; width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;"/>
					</div>
					

				</form>
			</div>
			<div id="side">
				<!--Twoje zamówienie:</br>

				TYTUŁ</br>
				DATA</br>
				GODZINA</br>
				ILOŚĆ MIEJSC</br>-->
			</div>
		</div>

</div>


	<div id="dol">
		<ul>
			<li1><a href="#">kontakt</a></li1>
			<li1><a href="#">o nas</a></li1>
			<li1><a href="#">informacje</a></li1>
		</ul>

	</div>
		
	<div id="footer">
		 Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>