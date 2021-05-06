<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>

    
<%
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli</title>
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
		<h2>Dettagli</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Saldo</th>
			<th>Data di uscita</th>
			<th>Voto</th>
			<th>Descrizione</th>
			<th>Peso</th>
			<th>Quantità</th>
		</tr>
		<tr>
			<td><%=product.getId()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getSaldo()%></td>
			<td><%=product.getData_uscita()%></td>
			<td><%=product.getVoto()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPeso()%></td>
			<td><%=product.getQuantità()%></td>
			<td><a href="product?action=addC&id=<%=product.getId()%>">Aggiungi al carrello</a></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>