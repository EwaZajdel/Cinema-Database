<?php
$con=mysqli_connect("localhost","root", "", "kino");
mysqli_query($con, 'SET NAMES utf8');
session_start();
/*
if(!isset($_POST['']))
	{
		header('Location: mem.php');
		exit();
	}*/
?>

<!DOCTYPE html>
<html>
<head>
<title>mem kino</title>


<style type = "text/css">
	
	body {
		color: #ffffff;
		background-color: #222222;
		font-family: Century Gothic;
		margin: 0;}
	
	#container {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
		min-height: 800px;}

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
		max-height: 240px;
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
		float: bottom;
		font-size: 20px;

		clear: both;}
		
	#footer {
		
		text-align: center;
		clear: both;}
	
	.wybor {
		align: right;
		margin: 35px;
		width: 600px;
		float: left;}
		
	select {
		width: 300px;
		height: 30px;
		margin-left: 10px;
		font-family: Century Gothic;
		font-size: 15px;
		float: right;}
	
	#content {
		font-size: 20px;
		height: 500px;
		float: left;}
		
	button {
		width: 150px;
		height: 30px;
		margin-right: 60px;
		margin-top: 20px;
		font-size: 15px;
		font-family: Century Gothic;
		background-color: #333333;
		color: #ffffff;
		float: right;}
		

		
	#main {
		
		width: 700px;
		height: 300px;
		text-align: center;
		float: left;}
		
	#side {
		
		float: left;
		width: 240px;
		text-align: center;
		margin-right: 60px;
		margin-top: 30px;}
		
	.miejscowka{
		float: left;
		width: 300px;}
	
	
</style>

</head>
<body>

	<div id="login">
		<a href="logowanie.php"><b>logowanie</b></a>
	</div>
	
	<div id="container">
		<div id="logo">
			<a href="mem.php"><img src="logo1.png"  height="90px" alt="Tu podaj tekst alternatywny" /></a>
		</div>
		
		<div id="nav">
			<hr color="#ffffff", width="800px">
			<ul>
				<li><a href="repertuar.php" style="color: green">repertuar</a></li>
				<li><a href="cennik.php">cennik</a></li>
				<li><a href="promocje.html">promocje</a></li>
				<li><a href="news.html">newsy</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		
		<div id="content">
			
				
				
				
			<div id="main">
			
				<?php
				$nowy=$_GET['n1'];
				echo '<h1 style="color: red;">'.$nowy.'</h1>';
				?>
				
				<form action="repertuar_wybor_miejsca.php" method="POST">
					Wybierz seans: </br></br>
					<?php	
					$seans = 0;
					$idfilm = mysqli_query($con, "SELECT IdFilm FROM film WHERE tytul='".$nowy."'");
						echo 'POZNAŃ</br>';
					while ($rec1 = mysqli_fetch_array($idfilm))
					{
		
						$poznan = mysqli_query($con, "SELECT * FROM seans WHERE IdFilm='".$rec1['IdFilm']."' AND (IdSala='11' OR IdSala='13') AND godzina>CURRENT_TIME ");
						while ($rec11 = mysqli_fetch_array($poznan))
						{
							echo '<a href="repertuar_wybor_miejsca.php?n3='.$rec11['IdSeans'].'">'.$rec11['godzina'].'</a></br>';
						}
					
					echo '</br></br>WROCŁAW</br>';
					
					
						$wroclaw = mysqli_query($con, "SELECT * FROM seans WHERE IdFilm='".$rec1['IdFilm']."' AND (IdSala='12' OR IdSala='14')AND godzina>CURRENT_TIME");
						while ($rec12 = mysqli_fetch_array($wroclaw))
						{
							echo '<a href="repertuar_wybor_miejsca.php?n3='.$rec12['IdSeans'].'">'.$rec12['godzina'].'</a></br>';
						}
					}
					?>
				</form>
			</div>
			
			
			
		
			<div id="side">
				Polecane:
				<center><div class="film"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
					while($row=mysqli_fetch_array($plakat)){
						$plakat1 = $row['linki'];
						echo $plakat1;
					} ?>" width="170px" height="240px"></img></div>
				<div class="film"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
					while($row=mysqli_fetch_array($plakat)){
						$plakat1 = $row['linki'];
						echo $plakat1;
					} ?>" width="170px" height="240px"></img></div></center>
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
</div>
	
</body>

</html>