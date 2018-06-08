<?php
	
	
	$con=mysqli_connect("localhost","root", "", "kino");
mysqli_query($con, 'SET NAMES utf8');
	session_start();

		if (isset($_POST['typ']))
		{
			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
			
			$film = $_POST['film'];
			$sala =$_POST['sala'];
			$typ = $_POST['typ'];
			$data =$_POST['data'];
			$godzina =$_POST['godzina'];
			$czas=$_POST['czas'];
            
          //  $idsala = mysqli_fetch_array(mysqli_query($con, 'SELECT max(IdKlient) FROM klient'));
						
		
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
						if ($con->query("INSERT INTO seans VALUES (NULL, '$film', '$sala', '$typ', '$data', '$godzina', '$czas')"))
						{
							$_SESSION['udanedodaniefilmu']=true;
							header('Location: repertuar_zarezerwowano.php');
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
		min-height: 700px;
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
				<li><a href="#" style="color: green">dodaj seans</a></li>
				<li><a href="admin_dodanie_pracownika.php">dodaj pracownika</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		<div id="content">
			<div id="main">
				<form method="post">
					Dodaj dane seansu: 
					<div class="logowanie">
						Film:</br>
				
						
						<select name="film" style="width: 300px; height: 30px; font-size: 16px; font-family: Century Gothic;" id="film">
						<?php
						
						
						$seanse = mysqli_query($con, 'SELECT * FROM `film`');
					
						while ($rec = mysqli_fetch_array($seanse))
						{
							$_SESSION['wybrane']=$rec;
							echo '<option value="'.$rec['IdFilm'].'">'.$rec['tytul'].'</option>';
						}
								
						?>
						
						</select></br>
						
						
					</div>
					
					<div class="logowanie">
						Sala:</br>
				
						
						<select name="sala" style="width: 300px; height: 30px; font-size: 16px; font-family: Century Gothic;" id="sala">
						<?php
						
						
						
					//$seanse = mysqli_query($con, 'SELECT * FROM `numer_sali` GROUP BY lokalizacja');

					$seanse = mysqli_query($con, 'SELECT * FROM `v_lokalizacja`');
						while ($rec = mysqli_fetch_array($seanse))
						{
							
							$_SESSION['wybrane']=$rec;
							echo '<option value="'.$rec['IdSala'].'">'.$rec['IdSala'].' '.$rec['lokalizacja'].'</option>';
							
						}
								
						?>
						
						</select></br>
						
						
					</div>
					
					
					<div class="logowanie">
						Typ:</br>
						<select name="typ" style="width: 300px; height: 30px; font-size: 16px; font-family: Century Gothic;"id="typ">
						
						<option></option>
						<option>PL</option>
							<option>Napisy PL</option>
							<option>Lektor</option>
							<option>Dubbing</option>
						</select></br>
					</div>
					
				
					<div class="logowanie">	
					Wybierz datę: 
						<input type="date" name="data"></br>
					</div>
					
					<div class="logowanie">	
					Wybierz godzinę: 
						<input type="datetime-local" name="godzina"></br>
					</div>
					
					<div class="logowanie">	
					Czas trwania: 
						<input type="time" name="czas"></br>
					</div>
	
					<div id="przyciski">
					<input type="submit" name="dodaj" style=" margin-left: 50px; width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;" value="dodaj">
					

					

				</form>
			</div>

		</div>

</div>
</div>

		
	<div id="footer">
		</br> Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>
