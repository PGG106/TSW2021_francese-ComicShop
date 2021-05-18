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
	UserBean user = (UserBean) session.getAttribute("currentSessionUser");
	OrderDAO orderDAO = new OrderDAO();
	List<OrderBean> ordini = new ArrayList<OrderBean>();
	ordini = orderDAO.getAllOrdersByUser(user);
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
			<%
			for (OrderBean ordine : ordini) {
			%>

			<tr>
				<td><a href="Ordine?action=mostradettagli&codice=<%=ordine.getId()%>"><%=ordine.getId()%></a> </td>
				<td><%=ordine.getData_ordine()%></td>
				<td><%=ordine.getCosto_totale()%> &euro;</td>
			</tr>
			<%
			}
			%>
		
</body>
</html>