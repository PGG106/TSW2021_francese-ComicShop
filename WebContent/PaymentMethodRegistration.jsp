<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="./fragments/header.jsp"%>

<%
} else {
%>
<%@ include file="./fragments/headerlogged.jsp"%>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<script src="./js/methodcheck.js"></script>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<link href="./style/error.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Aggiungi indirizzo</title>
</head>

<body>
	<h2>Compila il form per inserire un nuovo metodo di pagamento</h2>
	<div class=register>
		<div class="alert">
			<span class="closebtn"
				onclick="this.parentElement.style.display='none';">&times;</span>
				<span id="errorspan"></span>
		</div>
		<form action="PaymentMethodControl" id="paymentform">
			<p>Tipo di metodo di pagamento:</p>
			<label>Carta di credito<input class=paymentMethod type=radio
				name=tipo value="Carta di credito" required></label> <label>Conto
				bancario<input class=paymentMethod type=radio name=tipo
				value="Conto bancario" required>
			</label> <br> <label>Titolare<input class=paymentMethod
				type=text name="titolare" placeholder="mario rossi" required></label> <br> <label>Indirizzo
				di fatturazione<input class=paymentMethod type=text
				name=indirizzo_fatturazione placeholder="Via Franco Salerni 165" required>
			</label> <br> <label>Numero<input class=paymentMethod
				type=text name="numero" placeholder="IT60X0542811101000000123456" required></label> <br> <label>Scadenza<input
				class=paymentMethod type=date name=scadenza required></label> <br>
			<input class=btn type=submit value=Aggiungi>
		</form>
	</div>
</body>
<%@ include file="./fragments/footer.html"%>
</html>