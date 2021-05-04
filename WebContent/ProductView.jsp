<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Catalogo</title>
</head>

<body>
	<h2>Prodotti</h2>
	<a href="product">Lista</a>
	<table border="1">
		<tr>
			<th>Id <a href="product?sort=id">Sort</a></th>
			<th>Nome <a href="product?sort=name">Sort</a></th>
			<th>Prezzo <a href="product?sort=prezzo">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getId()%></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.getPrezzo()%></td>
			<td><%=%></td>
			<td><a href="product?action=read&id=<%=bean.getId()%>">Dettagli</a><br>
				<a href="product?action=addC&id=<%=bean.getId()%>">Aggiungi al carrello</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Nessun prodotto disponibile</td>
		</tr>
		<%
			}
		%>
	</table>
	

	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20" required placeholder="inserisci nome"><br> 
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required placeholder="inserisci descrizione"></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" min="0" value="0" required><br>
		
		<label for="saldo">Saldo:</label>
		<input name="saldo" type="number" value="0" required><br>
		
		<label for="data_uscita">Data di uscita</label><br>
		<input name="data_uscita" type="date" required><br>
		
		<label for="voto">Voto:</label><br>
		<input name="voto" type="number" min="0" max="10" required><br>
		
		<label for="peso">Peso:</label><br>
		<input name="peso" type="number" required><br>
		
		<label for="quantità">Quantità:</label><br> 
		<input name="quantità" type="number" min="1" value="1" required><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	
	<% if(cart != null) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<% List<ItemOrder> prodcart = cart.getProducts(); 	
		   for(ItemOrder beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getItem() %></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Elimina dal carrello</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>