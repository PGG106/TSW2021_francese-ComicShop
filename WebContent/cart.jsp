<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.ItemOrder"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
	<style>
	table {
  		margin-left:auto;
 		margin-right:auto;
 		border: 1px solid black;
 		border-collapse: collapse;
		}
	th, td {
  		padding: 5px;
  		border: 1px solid black;
  		border-collapse: collapse;
	}
	td {
  		text-align: left;
  		border-spacing: 10px;
	}
	h2 {
		text-align: center;
	}
	</style>
</head>
<body>

<%
	Cart cart = (Cart) session.getAttribute("cart");
%>

<%
if (cart != null) {
%>
	<h2>Carrello</h2>
	<table>
	<tr>
		<th>Articolo:</th>
		<th>Quantità:</th>
		<th>Prezzo:</th>
		<th>Azioni:</th>
	</tr>
	<%
			List<ItemOrder> prodcart = cart.getProducts();
			for (ItemOrder beancart : prodcart) {
	%>

	<tr>
		<td><%=beancart.getNome()%></td>
		<td><input type=number value=<%=beancart.getNumItems()%>  style="width:50px;" ></td>
		<td><%=beancart.getTotalCost()%> Euro</td>
		<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Elimina
				dal carrello</a></td>
	</tr>
	<%
	}
	%>
</table>
<%
}

%>
</body>
</html>