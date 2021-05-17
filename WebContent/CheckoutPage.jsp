<%@page import="org.apache.tomcat.jni.Address"%>
<%@page import= "it.unisa.model.*" %>
<%@page import="it.unisa.model.AddressDAO"%>
<%@page import="it.unisa.model.AddressBean"%>
<%@page import="java.util.*"%>
<%@page import="it.unisa.model.UserBean"%>
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
	%>

	
	<%
	UserBean user = (UserBean) session.getAttribute("currentSessionUser");
	AddressDAO addressDAO = new AddressDAO();
	PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
	%>
	<h1>Riepilogo dell'ordine</h1><br>
	
	<h2>Indirizzo di consegna</h2>
	<div class=checkout>
		<table>
			
		<% 
		List<AddressBean> addresses = addressDAO.getAddresses(user);
		List<String> indirizzi = new ArrayList<String>();
		for (AddressBean address : addresses) {
		String indirizzo;
		indirizzo=address.getVia()+" " + address.getNumero_civico()+" " +  address.getCittà()+" " + address.getProvincia()+" " + address.getCap();
		indirizzi.add(indirizzo);	
		}
		%>
			<tbody>
				<tr>
				<td>
					<select id="indirizzo" class=select-large>
					<%
						for (String indirizzo : indirizzi){
						%>
				  		<option><%=indirizzo%> </option>
					<% } %>
					</select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<h2>Metodo di pagamento</h2>
	<div class=checkout>
	
		<table>
			
		<% 
		List<PaymentMethodBean> paymentMethods = paymentMethodDAO.getPaymentMethods(user) ;
		List<String> metodiPagamento = new ArrayList<String>();
		for (PaymentMethodBean paymentMethod : paymentMethods) {
		String metodoPagamento;
		metodoPagamento = paymentMethod.getId() +" " + paymentMethod.getTipo() +" " +  paymentMethod.getTitolare() +" " 
		+ paymentMethod.isPredefinito() +" " + paymentMethod.getIndirizzo_fatturazione() +" " + paymentMethod.getNumero() +" " + paymentMethod.getScadenza();
		metodiPagamento.add(metodoPagamento);
		}
		%>
			<tbody>
				<tr>
				<td>
					<select id="metodoPagamento" class=select-large>
					<%
						for (String metodoPagamento : metodiPagamento){
						%>
				  		<option><%=metodoPagamento%> </option>   <!-- NON FUNZIONA -->
					<% } %>
					</select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	
	<h2>Rivedi gli articoli</h2>
	<div class=checkout>
		<table class=checkout>
			
			
		<%
		List<ItemOrder> prodcart = cart.getProducts();
		float prezzo_finale = 0;
		for (ItemOrder beancart : prodcart) {
		%>
			
			<tbody>
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
	</div>
	<br>
	
	<!-- questo pulsante non fa nulla -->
	<div class=wrapper>
		<form action="">
		<button class=btn type="submit" formaction="">Concludi ordine</button>
		</form>
	</div>
	
	
	
	<br><br><br>
	<div class=flex>
		<form action="AddressRegistration.jsp" class=flex-item>
		<button class=btn-center type="submit" formaction="AddressRegistration.jsp">Inserisci un indirizzo</button>
		</form>
	
	
		<form action="PaymentMethodRegistration.jsp" class=flex-item>
		<button class=btn-center type="submit" formaction="PaymentMethodRegistration.jsp">Inserisci un metodo di pagamento</button>
		</form>
	
	</div>	 
	<%
	}
	%>
	
	</body>
</html>