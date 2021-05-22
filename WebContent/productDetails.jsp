<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>

    
<%
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
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
		if (product != null) {
	%>
	
	<div class=details>
	<table>
	<thead class=details>
		<tr>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Saldo</th>
			<th>Data di uscita</th>
			<th>Voto</th>
			<th>Descrizione</th>
			<th>Peso</th>
			<th>Quantità</th>
		</tr>
		</thead>
		
		<tbody class=details>
		<tr>
			<td><%=product.getNome()%></td>
			<td><%=product.getPrezzo()%> &euro;</td>
			<td><%=product.getSaldo()%></td>
			<td><%=product.getData_uscita()%></td>
			<td><%=product.getVoto()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPeso()%></td>
			<td><%=product.getQuantità()%></td>
		</tr>
		</tbody>
	</table>
	
	<br>
	
	<div class="wrapper">
	<form class=details action="product?action=addC&id=<%=product.getId()%>" method="post" id="checkout">
	<button class=btn type="submit">Aggiungi al carrello</button>
	</form>
	</div>
	</div>

<%
	}
%>
	
</body>
</html>