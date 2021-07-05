<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ include file="./fragments/headerlogged.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>il mio account</title>
</head>
<body>
	<%
	LinkedList<String> indirizzi = (LinkedList<String>) session.getAttribute("indirizzi");
	ArrayList<String> metodiPagamento = (ArrayList<String>) session.getAttribute("metodi");
	UserBean user= (UserBean) session.getAttribute("currentSessionUser");
	%>
<div><h3>Dati utente</h3>

<div>Nome</div>
<input type="text" value=<%=user.getNome() %>>
<div>Cognome</div>
<input type="text" value=<%=user.getCognome() %>>
<div>Email</div>
<input type="email" value=<%=user.getEmail() %>>
<div>Data di nascita</div>
<input type="date" value=<%=user.getData_nascita() %>>
</div>

	<div>
		<h3>I miei Indirizzi </h3>
		<select id="indirizzo" name="indirizzo" class=select-large>
			<%
			if (indirizzi != null) {
				for (String indirizzo : indirizzi) {
			%>
			<option value="<%=indirizzo%>">
				<%=indirizzo%>
			</option>
			<%
			}
			} else {
			%>
			<option>nessun indirizzo in archivio</option>
			<%
			}
			%>

		</select> <a href=AddressRegistration.jsp>Inserisci un indirizzo</a> <br>

	</div>
	<div>
		<h3>I miei Metodi di pagamento</h3>

		<select id="metodoPagamento" name="pagamento" class=select-large>
			<%
			if (metodiPagamento != null) {
				for (String metodoPagamento : metodiPagamento) {
			%>
			<option value="<%=metodoPagamento%>"><%=metodoPagamento%>
			</option>

			<%
			}
			} else {
			%>
			<option>nessun metodo di pagamento in archivio</option>
			<%
			}
			%>

		</select> <a href=PaymentMethodRegistration.jsp>Inserisci un metodo di
			pagamento</a><br>
	</div>

</body>
</html>