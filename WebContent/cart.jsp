<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.ItemOrder"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="NewFile.css" rel="stylesheet" type="text/css">
<title>Carrello</title>
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
	<div class=cart>
	<table >
	<thead class=cart>
		<tr>
			<th>Articolo:</th>
			<th>Quantità:</th>
			<th>Prezzo:</th>
			<th>Azioni:</th>
		</tr>
</thead>
		<%
		List<ItemOrder> prodcart = cart.getProducts();
		float prezzo_finale = 0;
		for (ItemOrder beancart : prodcart) {
		%>
	<tbody class=cart>
		<tr>
			<td><%=beancart.getNome()%></td>
			<td><form>
					<INPUT type="hidden" name=itemID value=<%=beancart.getId()%>>
					<INPUT TYPE=TEXT NAME=numItems SIZE=3
						VALUE=<%=beancart.getNumItems()%>> <INPUT TYPE=SUBMIT
						VALUE=Update>
				</form></td>
			<td><%=beancart.getTotalCost()%> &euro;</td>
			<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Elimina
					dal carrello</a></td>
		</tr>
		</tbody>
		<%
		prezzo_finale += beancart.getTotalCost();
		
		%>
		
		<%
		}
		%>
		<tfoot class=cart> 
		
		<tr>
		<th  colspan=3>Totale: </th>
		<td> <%=prezzo_finale %> &euro;</td>
		</tr>
		</tfoot>
	</table>
	<br>
	<form class=cart>
	<input type="hidden" name="action" value="CompletaOrdine">
	<input type="submit" id=checkout formaction="CheckoutPage.jsp" value="Checkout"></form>
	</div>
	<%
	}
	%>
</body>
</html>