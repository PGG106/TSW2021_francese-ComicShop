<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./fragments/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
	<title>Aggiungi indirizzo</title>
</head>

<body>
	<h2> Compila il form per inserire un nuovo indirizzo di consegna</h2>
	<div class=register>
	
	<form action="AddressControl">
		<label>Via<input class=address type=text name=via required></label> <br>
		<label>Numero Civico<input class=address type=number name=numero_civico required></label> <br>
		<label>Cap<input class=address type=number name=cap required></label> <br>
		<label>Città<input class=address type=text name=citta required></label> <br>
		<label>Provincia<input class=address type=text name=provincia required></label> <br>
		<input class=btn type=submit value=Aggiungi>
	</form>
	</div>
</body>
<%@ include file="./fragments/footer.html" %>
</html>