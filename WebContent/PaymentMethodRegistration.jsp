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
	<h2> Compila il form per inserire un nuovo metodo di pagamento</h2>
	<div class=register>
	
	<form action="PaymentMethodControl">
		<label>Id<input class=paymentMethod type=number name=id required></label> <br>
		<label>Tipo<input class=paymentMethod type=number name=tipo required></label> <br>
		<label>Titolare<input class=paymentMethod type=text name=titolare required></label> <br>
		<label>Predefinito<input class=paymentMethod type=text name=predefinito required></label> <br>
		<label>Indirizzo di fatturazione<input class=paymentMethod type=text name=indirizzo_fatturazione required></label> <br>
		<label>Numero<input class=paymentMethod type=number name=numero required></label> <br>
		<label>Scadenza<input class=paymentMethod type=date name=scadenza required></label> <br>
		<input class=btn type=submit value=Aggiungi>
	</form>
	</div>
</body>
</html>