<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="NewFile.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
	<title>Pagina di registrazione</title>
</head>

<body>
	<h2> Compila il form per registrarti</h2>
	<div class=register>
	<form action="UserControl">
		<label>Username<input class=register type=text name=usr required></label> <br>
		<label>Nome<input class=register type=text name=nome required></label> <br>
		<label>Cognome<input class=register type=text name=cogn required></label> <br>
		<label>Email<input class=register type=email name=email required></label> <br>
		<label>Password<input class=register type=password name=pwd required></label> <br>
		<label>Num_tel<input class=register type=number name=num_tel required></label> <br>
		<label>Paese di residenza<input class=register type=text name=paese required></label> <br>
		<label>Data di nascita<input class=register type=date name=data required></label><br>
		<input class=btn type=submit value=Registrati>
	</form>
	</div>
</body>
</html>