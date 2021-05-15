<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="NewFile.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
	<title>Aggiungi indirizzo</title>
</head>

<body>
	<h2> Compila il form per inserire un nuovo indirizzo di consegna</h2>
	<div class=register>
	
	<!-- Error 404: AddressControl ancora non esiste -->
	<form action="AddressControl">
		<label>Via<input class=address type=text name=via required></label> <br>
		<label>Numero Civico<input class=address type=number name=numero_civico required></label> <br>
		<label>Cap<input class=address type=number name=cap required></label> <br>
		<label>Città<input class=address type=text name=città required></label> <br>
		<label>Provincia<input class=address type=text name=provincia required></label> <br>
		<input class=btn type=submit value=Aggiungi>
	</form>
	</div>
</body>
</html>