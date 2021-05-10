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
	margin-left: auto;
	margin-right: auto;
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
	String itemID = request.getParameter("itemID");
	if (itemID != null) {
		String numItemsString = request.getParameter("numItems");
		if (numItemsString != null) {
			int numItems;
			try {
		numItems = Integer.parseInt(numItemsString);
			} catch (NumberFormatException nfe) {
		numItems = 1;
			}
			cart.setNumOrdered(Integer.parseInt(itemID), numItems);

		}

	}
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
		float prezzo_finale = 0;
		for (ItemOrder beancart : prodcart) {
		%>

		<tr>
			<td><%=beancart.getNome()%></td>
			<td><form>
					<INPUT type="hidden" name=itemID value=<%=beancart.getId()%>>
					<INPUT TYPE=TEXT NAME=numItems SIZE=3
						VALUE=<%=beancart.getNumItems()%>> <INPUT TYPE=SUBMIT
						VALUE=Update>
				</form></td>
			<td><%=beancart.getTotalCost()%> Euro</td>
			<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Elimina
					dal carrello</a></td>
		</tr>
		<%
		prezzo_finale += beancart.getTotalCost();
		
		%>
		
		<%
		}
		%><tr>
		<th  colspan=3>Totale </th>
		<td>  <%=prezzo_finale %></td>
		</tr>
	</table>
	
	
	
	
	<%
	}
	%>
	<form><input type="submit" formaction="Ordine" value="Checkout"></form>
</body>
</html>