<?php
	session_start();
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
		width: 50px;
		height: 30px;
		font-size: 16px;
		font-family: Century Gothic;}
		
	#content {
		margin-left: 150px;
		margin-top: 50px;
		font-size: 20px;}
		
	#main {
		float:left;
		max-width: 400px;}
		
	#side {
		float: right;
		margin-right: 100px;
		margin-top: 0px;
		text-align: center;
		font-size: 24px;}
		
		
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
				<li><a href="repertuar.php">repertuar</a></li>
				<li><a href="cennik.php">cennik</a></li>
				<li><a href="promocje.php">promocje</a></li>
				<li><a href="news.php">newsy</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		<div id="content">
		<form action = "formularz.php" method="post">
		
					<p>Twój wybór:</p>
	<li>Normalny: <b><?php echo $_POST["iloscnormalnych"]; ?></b></li></br>

      <li>Ulgowy: <b><?php echo $_POST["ilosculgowy"]; ?></b></li></br>

      <li>Student: <b><?php echo $_POST["iloscstudent"]; ?></b></li></br>

      <li>Senior: <b><?php echo $_POST["iloscsenior"]; ?></b></li></br></br>
				
				<?php
				
				$normalny =$_POST["iloscnormalnych"];
				$ulgowy = $_POST["ilosculgowy"];
				$student = $_POST["iloscstudent"];
				$senior = $_POST["iloscsenior"];
				$iloscmiejsc = $_POST["miejsca"];
				$wybrane = $_POST['wybrane'];
				$seans = $_POST['seans'];
				
					if (isset($_POST["dalej"])) {
						

						
							if (($normalny+$ulgowy+$senior+$student)==$iloscmiejsc)
							{
								//echo 'super';
								
								$cenan = mysqli_fetch_array(mysqli_query($con, 'SELECT `cena` FROM `rodzaj_biletu` WHERE `rodzaj`="normalny"'));
								$cenau = mysqli_fetch_array(mysqli_query($con, 'SELECT `cena` FROM `rodzaj_biletu` WHERE `rodzaj`="ulgowy"'));
								$cenast = mysqli_fetch_array(mysqli_query($con, 'SELECT `cena` FROM `rodzaj_biletu` WHERE `rodzaj`="student"'));
								$cenase = mysqli_fetch_array(mysqli_query($con, 'SELECT `cena` FROM `rodzaj_biletu` WHERE `rodzaj`="senior"'));
								
								
								
								//echo $cenan['cena'].'</br>';
								//echo $cenau['cena'].'</br>';
								//echo $cenast['cena'].'</br>';
								//echo $cenase['cena'].'</br>';
								
								$suma = $normalny*$cenan['cena']+$ulgowy*$cenau['cena']+$student*$cenast['cena']+$senior*$cenase['cena'];
								echo '<p style = "font-size: 35px;">PODSUMOWANIE ZAMÓWIENIA</br>Do zapłaty: <b>'.$suma.'zł</b></br></p>';
								
								echo '<input type="submit" name="dalej" style=" margin-left: 300px; width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;" value="Potwierdź">';
								
							}
							else
							{
								echo 'Ilość wybranych miejsc nie zgadza się z ilością biletów. Cofnij stronę i popraw ilość.';
							}								
							
					?>

      
     

      
						
					
					
			<?php
					}
			else {
				header("Location: repertuar.php");
			}?>
		
			</div>
		
					<?php
					foreach ($wybrane as $miejsce){
						
						echo '<input type="hidden" name="wybrane[]" value='.$miejsce.'>';
					}?>
					<input type="hidden" name="seans" value="<?php echo $seans;?>"/>
					<input type="hidden" name="normalne" value="<?php echo $normalny;?>"/>
					<input type="hidden" name="ulgowy" value="<?php echo $ulgowy;?>"/>
					<input type="hidden" name="student" value="<?php echo $student;?>"/>
					<input type="hidden" name="senior" value="<?php echo $senior;?>"/>
					
					
				
							<div id="przyciski">
					
				
			</div>
			</form>
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
