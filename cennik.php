<?php
$con=mysqli_connect("localhost","root", "", "kino");
mysqli_query($con, 'SET NAMES utf8');

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
		margin: 0px;
		clear: both;}
		
	#footer {
		clear: both;
		text-align: center;}	
	
	table{
		text-align: center;
		font-size: 20px;}
		
	h1 {
		text-align: center;}
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
				<li><a href="#" style="color: green">cennik</a></li>
				<li><a href="budowa.php">promocje</a></li>
				<li><a href="budowa.php">newsy</a></li>
			</ul>
			<hr color="#ffffff", width="800px">
		</div>	
	
	<!-- CENNIK W FORMIE TABELI Z BAZY DANYCH -->
	
		<!--</table></center>
		<center><table width="600px" border = "1" cellpadding ="1" cellspacing = "1">
			<tr><td>Rodzaj biletu</td>	<td>Opis</td> <td>Cena</td></tr>
			<tr><td>Normalny</td>	<td>Dorośli</td> <td>20zł</td></tr>
			<tr><td>Ulgowy</td>	<td>Dzieci i młodzież do 18. roku życia</td> <td>10zł</td></tr>
			<tr><td>Studencki</td>	<td>Studenci do 26. roku życia</td> <td>12zł</td></tr>
			<tr><td>Senior</td>	<td>Emeryci po 60. roku życia</td> <td>10zł</td></tr>
		</table></center>-->
		
		<center><table width="400px" border = "1" cellpadding ="1" cellspacing = "1">
		<tr><td><b>Rodzaj biletu</b></td><td><b>Cena</b></td></tr>
<?php	
	$cennik = mysqli_query($con, 'SELECT * FROM `rodzaj_biletu`');
	while ($rec = mysqli_fetch_array($cennik))
	{
	 echo '<tr>
	 <td>'.$rec['rodzaj'].'</td>
	 <td>'.$rec['cena'].'</td>
	 </tr>';
	}
	?>
	</table></center>


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