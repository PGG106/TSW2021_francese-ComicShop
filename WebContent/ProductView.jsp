
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./fragments/header.jsp" %>
<%
Collection<?> products = (Collection<?>) request.getAttribute("products");
if (products == null) {
	response.sendRedirect("./product");
	return;
}

ProductBean product = (ProductBean) request.getAttribute("product");

Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Catalogo</title>
	
</head>

<body>

	<h2>Prodotti</h2>
	
	<table>
	<thead class=catalogo>
		<tr >
			<th> <a href="product?sort=id">Id </a></th>
			<th> <a href="product?sort=nome">Nome</a></th>
			<th> <a href="product?sort=prezzo">Prezzo</a></th>
			<th> <a href="product?sort=voto">Voto</a></th>
			<th> <a href="product?sort=quantita">Quantita'</a></th>
			<th> Azioni</th>
		</tr>
		</thead>
		<tbody class=catalogo>
		<%
		if (products != null && products.size() != 0) {
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getId()%></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.getPrezzo()%> &euro;</td>
			<td><%=bean.getVoto()%></td>
			<td><%=bean.getQuantità()%></td>
			<td><a href="product?action=read&id=<%=bean.getId()%>">Dettagli</a><br>
				<a href="product?action=addC&id=<%=bean.getId()%>">Aggiungi al carrello</a></td>
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
		</tbody>
	</table>


	<h2 style="text-align:center;">Inserisci nuovo articolo</h2>
	<div class=catalogo>
	<form style="text-align:center;" action="product" method="post">
		<input type="hidden" name="action" value="insert">
		
		<label for="id">Id:</label><br> 
		<input class=catalogo name="id" type="number"maxlength="20" required placeholder="Inserisci ID"><br>
		
		<label for="nome">Nome:</label><br> 
		<input class=catalogo name="nome" type="text" maxlength="20" required placeholder="Inserisci nome"><br>
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea class=catalogo name="descrizione" maxlength="100" rows="3" required placeholder="Inserisci descrizione"></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input class=catalogo name="prezzo" type="number" min="0" value="0" required><br>
		
		<label for="saldo">Saldo:</label><br> 
		<input class=catalogo name="saldo" type="number" value="0" required><br>	
		 
		<label for="data">Data di uscita</label><br> 
		<input class=catalogo name="data" type="date" required><br>
		
		<label for="voto">Voto:</label><br> 
		<input class=catalogo name="voto" type="number" min="0" max="10" required><br> 
		
		<label for="peso">Peso:</label><br> 
		<input class=catalogo name="peso" type="number" required><br> 
		
		<label for="quant">Quantita':</label><br>
		<input class=catalogo name="quant" type="number" min="1" value="1" required><br>
		
		<input class=btn type="submit" value="Aggiungi"><input class=btn type="reset"
			value="Ripristina">
	</form>
	</div>
	
</body>

<%@ include file="./fragments/footer.html" %>
</html>