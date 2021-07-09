<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./fragments/headerlogged.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>il mio account</title>
</head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<body>
	<%
	LinkedList<String> indirizzi = (LinkedList<String>) session.getAttribute("indirizzi");
	ArrayList<String> metodiPagamento = (ArrayList<String>) session.getAttribute("metodi");
	UserBean user= (UserBean) session.getAttribute("currentSessionUser");
	%>
<div><h3>Dati utente</h3>





<div class="user-container">
	<ul>
		<li>
			<div class="user">
				<div class="user-label">Nome:</div>
				<input class="user" type="text" value=<%=user.getNome()%>>
			</div>
		</li>
	</ul>
	
	<ul>
		<li>
		<div class="user">
			<div class="user-label">Cognome:</div>
				<input class="user" type="text" value=<%=user.getCognome()%>>
			</div>
		</li>
	</ul>
	
	<ul>
		<li>
		<div class="user">
			<div class="user-label">Email:</div>
				<input class="user" type="email" value=<%=user.getEmail()%>>
			</div>
		</li>
	</ul>
	
	<ul>
		<li>
		<div class="user">
			<div class="user-label">Data di nascita:</div>
				<input class="user" type="date" value=<%=user.getData_nascita()%>>
			</div>
		</li>
	</ul>
	
</div>	

</div>



 	


	<div>
		<h3>I miei indirizzi </h3>
		
		<div class="user-container">
			<ul>
				<li>
					<div class="user-payment">
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
			<option>Nessun indirizzo in archivio</option>
			<%
			}
			%>
				</select>
		<br>
			<div class="user-link">
				<a href=AddressRegistration.jsp>Inserisci un nuovo indirizzo</a>
			</div>
		<br>
				</div>
			</li>
		</ul>
	</div>
</div>

	
	
	
	<div>
		<h3>I miei metodi di pagamento</h3>
		
		<div class="user-container">
			<ul>
				<li>
					<div class="user-payment">
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
				</select>
		<br>
			<div class="user-link">
				<a href=PaymentMethodRegistration.jsp>Inserisci un nuovo metodo di
				pagamento</a>
			</div>
		<br>
				</div>
			</li>
		</ul>
	</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	

</body>
</html>