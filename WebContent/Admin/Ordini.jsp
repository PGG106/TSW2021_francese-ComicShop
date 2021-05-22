<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="it.unisa.model.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
				<th>Identificativo:</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a
					href="Ordine?action=mostradettagli&codice=<%=ordine.getId()%>"><%=ordine.getId()%></a>
				</td>
				<td><%=ordine.getData_ordine()%></td>
				<td><%=ordine.getCosto_totale()%> &euro;</td>
				<td><%=ordine.getUsername()%> &euro;</td>
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
	<form action=OrderArchive>
		<INPUT type="date" name="startdate"> 
		<INPUT type="date" name="enddate"> 
		<INPUT type="submit" value="cerca">
	</form>
	
	<form action=OrderArchive>
		<INPUT type="text" name="username"> 
		<INPUT type="submit" value="cerca">
	</form>
</body>
</html>