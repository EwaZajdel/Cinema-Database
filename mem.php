<?php
$con=mysqli_connect("localhost","root", "", "kino");
?>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
		float: left;
		margin: 13px;
		<!--background-color: #eeeeee;-->
		text-align: center;
		al}
		
	
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
		-webkit-transition: all 1s ease; -moz-transition: all 1s ease; -o-transition: all 1s ease;
	}
	
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
		cursor: pointer;
	}
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
				<li><a href="budowa.php">promocje</a></li>
				<li><a href="budowa.php">newsy</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>

		
		<div id="wiersz">
		

		


			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
			<div class="film"><a href = "repertuar.php"><img src="<?php $plakat = mysqli_query($con, "SELECT * FROM `film` ORDER BY rand() LIMIT 1;");
						while($row=mysqli_fetch_array($plakat)){
							$plakat1 = $row['linki'];
							echo $plakat1;
						} ?>"></img></a></div>
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
