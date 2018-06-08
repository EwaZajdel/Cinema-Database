<?php
    $con=mysqli_connect("localhost","root", "", "kino");
	mysqli_query($con, 'SET NAMES utf8');
    session_start();
    
    
    /*if(isset($_POST['miejsce']) && in_array('A01', $_POST['miejsce'])){
        $msc[] = 1;
        $rzad[] = "A";
        echo '$rzad$msc is checked';
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
		min-height: 700px;}

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
		float: bottom;
		font-size: 20px;
		margin: 0px;
		clear: both;}
		
	#footer {
		clear: both;
		text-align: center;
		float: bottom;}	
		
	.wybor {
		margin: auto;
		width: 500px;
		}
		
	select {
		width: 45px;
		height: 30px;
		float: center;
		font-family: Century Gothic;
		font-size: 15px;
		margin-left: 20px;
		}
	
	#content {
		margin-top: 5px;
		font-size: 20px;
		text-align: center;
		}
		
	button {
		font-family: Century Gothic;
		background-color: #333333;
		color: #ffffff;}
		
	button.dalej {
		width: 150px;
		height: 30px;
		margin: 30px;
		margin-top: 30px;
		font-size: 15px;}
		
	h1 {
		margin-left: 70px;
		float: left;}
		
	.wybrane {
		font-size: 40px;
		background-color: #333333;
		float: left;
		margin-left: 60px;}
		
	#przyciski {
		clear: both;
		margin-left: auto;
		margin-right: auto;}
	
	#choice {
		color: #ffffff;
		text-align: center;
		font-size: 38px;}
	
	#sala {
		width: 600px;
		background-color: #bbbbbb;
		height: 500px;
		margin: auto;}
	
	#przod {
		width: 600px;
		height: 90px;}
	
	#ekran {
		margin: auto;
		width: 350px;
		height: 25px;
		background-color: black;}

	
	#lewastrona {
		float: left;
		margin-left: 75px;}
	
	#prawastrona {
		float: right;
		margin-right: 75px;}
	
	button.miejsce {
		width: 30px;
		height: 30px;
		text-align: center;
		margin: 5px;
		float: left;}
	
	input {
		height: 35px;
		width: 35px;
		background-color: blue;
		margin: 1px;}
	input:checked {
	background-color: blue;}
	
	input:hover {
	background-color: red;}
	


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
				<li><a href="promocje.php">promocje</a></li>
				<li><a href="news.php">newsy</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>
		
		<div id="content">
			<div id="choice">
				<ul>
				<?php
					$seans = $_GET['n3'];
					//echo $seans;
					$daneseans= mysqli_fetch_array(mysqli_query($con, 'SELECT * FROM seans WHERE IdSeans='.$seans.''));
					$idfilmu = $daneseans['IdFilm'];
					$dataseans = $daneseans['godzina'];
					$tytulfilmu = mysqli_fetch_array(mysqli_query($con, 'SELECT * FROM film WHERE IdFilm='.$idfilmu.''));
					echo '<p style="font-size: 60px; color: red; float: bottom; margin: 0px;"><b>'.$tytulfilmu['tytul'].' </b></p>';
					echo ' <b> '.$dataseans.' </b>';?>
				</ul>
			</div>	
			Wybierz miejsca: </br></br>
		<form action="rodzaj_znizki.php" method="get">
			<div id="sala">
				<div id="przod">
					<div id="ekran">ekran</div>
				</div>
				
				
				
				<?php	
					
					$i = 0;
					$wybormiejsca = mysqli_query($con, 'SELECT * FROM widokmiejsc WHERE IdSeans='.$seans.'');
					while ($rec = mysqli_fetch_array($wybormiejsca))
					{
						
						
						$jest = mysqli_query($con, 'SELECT * FROM bilet WHERE IdSeans='.$seans.' AND IdMiejsce='.$rec['IdMiejsce'].'');
						//echo $seans;
						$num = mysqli_num_rows($jest);
						if($num == 0)
							echo '<input type="checkbox" name="miejsce[]" value='.$rec['IdMiejsce'].'>';
						else
							
							//echo $liczba;
							echo '<img style = "margin-right: 1px; margin-left: 1px;" src="ludzik'.rand(1,8).'.png" width="35px" height="35px";/>'; //'<span style = "font-size: 30px; margin: 5px;">♦</span>';
						$i++;
						if($i == 3)
							echo "&nbsp &nbsp &nbsp &nbsp &nbsp";
						
						if($i == 10) 
						{
							echo '<br/>';
							$i = 0;
						}
					 
					}
					?>
				
				
					
				</div>
	</br>
		<img src="wolne.png" width="20px"/> - miejsce wolne  &nbsp &nbsp &nbsp 
		<img src="ludzik6.png" width="35px"/> - miejsce zajęte  &nbsp &nbsp &nbsp 
		<img src="wybrane.png" width="20px"/> - twój wybór	
			
			
				
				
				
			
			
			<div id="przyciski">
			<input type="hidden" name="seans" value="<?php echo $seans;?>"/>
					</br><input type="submit" name="rezerwacja" value="Dalej" style=" width: 150px; height: 30px; font-size: 16px; color: #ffffff; background-color: #333333;"/>
					
			</div>
		</div>
	</div>
	</form>

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
