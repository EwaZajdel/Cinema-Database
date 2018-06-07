<?php
//	mysqli_query($con, 'SET NAMES utf8');
	session_start();
	
	$con=mysqli_connect("localhost","root", "", "kino");
	mysqli_query($con, 'SET NAMES utf8');

		if (isset($_POST['IdBilet']))
		{
			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
			
			$IdBilet = $_POST['IdBilet'];
		
			
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
						if ($polaczenie->query('DELETE FROM bilet WHERE IdBilet = '.$IdBilet.''))
						{
							$_SESSION['udanarejestracja1']=true;
							echo 'SUKCES';
							header('Location: bilety_sprzedane.php');
							
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
				echo '<span style="color: red">Błąd serwera! Przepraszamy za niedogodności i proszimy o aktualizację zamówienia w innym terminie.</span>';
				//echo $e;
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

td {width:100px; }
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
				<li><a href="#" style="color: green">bilet-pracownik</a></li></br>
				<li><a href="dodanie_filmu.php">dodaj film</a></li>
				<li><a href="dodanie_seansu.php">dodaj seans</a></li>
				<li><a href="admin_dodanie_pracownika.php">dodaj pracownika</a></li>

			</ul>
			<hr color="#ffffff", width="800px">
		</div>

		<div id="main">
		<center>
				<form method="post">
					<div class="logowanie">
						*Numer zamówienia: &nbsp&nbsp 
						<input type="text" style="width: 300px; height: 30px; font-size: 16px; font-family: Century Gothic;" name="IdBilet" /></br></br>
						<?php
						if (isset($_SESSION['e_IdBilet']))
						{
							echo '<div class="error">'.$_SESSION['e_IdBilet'].'</div>';
							unset($_SESSION['e_IdBilet']);
						}
						?>
					</div>
				
					<div class="logowanie">
						<input type="submit" value="Usuń" style=" width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;"/>
					</div>
					

				</form>
				</center>
					

		<?php	
		
		echo '<center><table width="800px" border = "1" cellpadding ="1" cellspacing = "1">
		<tr><td><b>Numer biletu</b></td><td><b>Tytuł</b></td><td><b>Data</b></td><td><b>Numer miejsca</b></td><td><b>IdPracownika</b></td></tr>';
		$bilety = mysqli_query($con, 'SELECT * FROM  v_sprzedane WHERE IdBilet IS NOT NULL');
		while ($rec = mysqli_fetch_array($bilety))
		{
		 echo '<tr>
		 <td>'.$rec['IdBilet'].'</td>
		 <td>'.$rec['tytul'].'</td>
		 <td>'.$rec['godzina'].'</td>
		  <td>'.$rec['IdMiejsce'].'</td>
		 <td>'.$rec['IdPracownik'].'</td>
		 </tr>';
		}'</center>';
		
		?>
		</div>
	
	</div>


		
	<div id="footer">
		 </br>Wszystkie prawa zastrzeżone Kino Mem 2018 &copy;
	</div>
	
</body>

</html>