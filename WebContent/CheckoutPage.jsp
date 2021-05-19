<%@page import="org.apache.tomcat.jni.Address"%>
<%@page import="it.unisa.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="NewFile.css" rel="stylesheet" type="text/css">
<title>Checkout</title>
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

		LinkedList<String> indirizzi = (LinkedList<String>) session.getAttribute("indirizzi");
		ArrayList<String> metodiPagamento = (ArrayList<String>) session.getAttribute("metodi");
	%>



	<h1>Riepilogo dell'ordine</h1>
	<br>

	<h2>Indirizzo di consegna</h2>

	<form>




		<select id="indirizzo" name="indirizzo" class=select-large>
			<%
			for (String indirizzo : indirizzi) {
			%>
			<option value="<%=indirizzo%>">
				<%=indirizzo%>
			</option>
			<%
			}
			%>
		</select> <a href=AddressRegistration.jsp>Inserisci un indirizzo</a> <br>
		<h2>Metodo di pagamento</h2>



		<select id="metodoPagamento" name="pagamento" class=select-large>
			<%
			for (String metodoPagamento : metodiPagamento) {
			%>
			<option value="<%=metodoPagamento%>"><%=metodoPagamento%>
			</option>

			<%
			}
			%>
		</select> <a href=PaymentMethodRegistration.jsp>Inserisci un metodo di
			pagamento</a><br>

		<h2>Rivedi gli articoli</h2>
		<div class=checkout>
			<table class=checkout>
				<thead>
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

				<tbody>
					<tr>
						<td><%=beancart.getNome()%></td>
						<td><%=beancart.getNumItems()%></td>
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
						<th colspan=3>Totale:</th>
						<td><%=prezzo_finale%> &euro;</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<br> <input type=hidden name=action value=CompletaOrdine>

		<div class=wrapper>

			<button class=btn type="submit" formaction="Ordine">Concludi
				ordine</button>
		</div>
	</form>


	<%
	}
	%>

</body>
</html>