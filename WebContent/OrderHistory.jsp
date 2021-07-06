<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="it.unisa.model.*"%>
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
<meta charset="UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Storico Ordini</title>
</head>
<body>
	<%
	List<OrderBean> ordini = new LinkedList<OrderBean>();
	ordini = (LinkedList<OrderBean>) session.getAttribute("ordini");
	if (ordini != null) {
		for (OrderBean ordine : ordini) {
	%>

	<table>
		<thead>
			<tr>
				<th>Codice ordine:</th>
				<th>Data:</th>
				<th>Importo totale:</th>
			</tr>
		</thead>
		<tbody>



			<tr>
				<td><a
					href="Ordine?action=mostradettagli&codice=<%=ordine.getId()%>"><%=ordine.getId()%></a>
				</td>
				<td><%=ordine.getData_ordine()%></td>
				<td><%=String.format("%.2f", ordine.getCosto_totale())%>&euro;</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else {
	%>
	<h2>Nessun ordine registrato</h2>
	<%
	}
	%>
</body>
<%@ include file="./fragments/footer.html"%>
</html>