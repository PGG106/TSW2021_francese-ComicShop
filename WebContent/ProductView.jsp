<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="ProductStyle.css" rel="stylesheet" type="text/css">
<title>Catalogo</title>
	<style>
	table {
  		margin-left:auto;
 		margin-right:auto;
 	}
	table, th, td {
  		border: 1px solid black;
  		border-collapse: collapse;
	}
	th, td {
  		padding: 5px;
	}
	td {
  		text-align: left;
  		border-spacing: 10px;
	}
	h2 {
		text-align: center;
		clear: both;
	}
	div.container {
		display: flex;
  		justify-content: space-between;
  		align-items: flex-end;
	}
	</style>
</head>

<body>
	<div class="container">
		<a href="product">Lista</a>
		<a href="cart.jsp">Visualizza Carrello</a>
	</div>
	
	<h2>Prodotti</h2>
	
	<table>
		<tr>
			<th> <a href="product?sort=id">Id </a></th>
			<th> <a href="product?sort=nome">Nome</a></th>
			<th> <a href="product?sort=prezzo">Prezzo</a></th>
			<th> <a href="product?sort=voto">Voto</a></th>
			<th> <a href="product?sort=quantita">Quantita'</a></th>
			<th> Azioni</th>
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
			<td><%=bean.getVoto()%></td>
			<td><%=bean.getQuantità()%></td>
			<td><a href="product?action=read&id=<%=bean.getId()%>">Dettagli</a><br>
				<a href="product?action=addC&id=<%=bean.getId()%>">Aggiungi al
					carrello</a></td>
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


	<h2 style="text-align:center;">Insert</h2>
	<form style="text-align:center;" action="product" method="post">
		<input type="hidden" name="action" value="insert">
		
		<label for="id">Id:</label><br> 
		<input name="id" type="number"maxlength="20" required placeholder="inserisci id"><br>
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20" required placeholder="inserisci nome"><br>
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required placeholder="inserisci descrizione"></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" min="0" value="0" required><br>
		
		<label for="saldo">Saldo:</label><br> 
		<input name="saldo" type="number" value="0" required><br>	
		 
		<label for="data">Data di uscita</label><br> 
		<input name="data" type="date" required><br>
		
		<label for="voto">Voto:</label><br> 
		<input name="voto" type="number" min="0" max="10" required><br> 
		
		<label for="peso">Peso:</label><br> 
		<input name="peso" type="number" required><br> 
		
		<label for="quant">Quantita':</label><br>
		<input name="quant" type="number" min="1" value="1" required><br>
		
		<input type="submit" value="Add"><input type="reset"
			value="Reset">
	</form>



</body>
</html>