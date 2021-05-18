<%@page import="it.unisa.model.*"%>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>


<%
OrderBean order = (OrderBean) request.getAttribute("ordine");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="NewFile.css" rel="stylesheet" type="text/css">
<title>Dettagli</title>

</head>

<body>
	<h2>Dettagli</h2>
	<%
	if (order != null) {
	%>

	<div class=details>
		<table>
			<thead class=details>
				<tr>
					<th>numero_ordine</th>
					<th>costo_totale</th>
					<th>indirizzo_spedizione</th>
					<th>data_spedizione</th>
					<th>username</th>
					<th>data_ordine</th>
				</tr>
			</thead>

			<tbody class=details>
				<tr>
					<td><%=order.getNum_ordine()%></td>
					<td><%=order.getCosto_totale()%> &euro; </td>
					<td><%=order.getIndirizzo_spedizione()%></td>
					<td><%=order.getData_spedizione()%></td>
					<td><%=order.getUsername()%></td>
					<td><%=order.getData_ordine()%></td>
				</tr>
			</tbody>
		</table>

		<br>

	
	</div>

	<%
	}
	%>

</body>
</html>