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
	<h2>Compila il form per inserire un nuovo metodo di pagamento</h2>
	<div class=register>

		<form action="PaymentMethodControl">
			<p>Tipo di metodo di pagamento:</p>
			<label>Carta di credito<input class=paymentMethod type=radio
				name=tipo value="Carta di credito" required></label> <label>Conto
				bancario<input class=paymentMethod type=radio name=tipo
				value="Conto bancario" required>
			</label> <br> <label>Titolare<input class=paymentMethod
				type=text name=titolare required></label> <br> <label>Indirizzo
				di fatturazione<input class=paymentMethod type=text
				name=indirizzo_fatturazione required>
			</label> <br> <label>Numero<input class=paymentMethod
				type=number name=numero required></label> <br> <label>Scadenza<input
				class=paymentMethod type=date name=scadenza required></label> <br>
			<input class=btn type=submit value=Aggiungi>
		</form>
	</div>
</body>
</html>