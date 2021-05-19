<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
				<td><%=ordine.getCosto_totale()%> &euro;</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	}
	else {
	%>
	<h2>Nessun ordine registrato</h2>
	<%
	}
	%>
</body>
</html>