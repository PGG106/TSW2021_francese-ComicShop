<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Collection<?> products = (Collection<?>) request.getAttribute("products");
if (products == null) {
	response.sendRedirect("./product");
	return;
}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="NewFile.css" rel="stylesheet" type="text/css">
<title>Comicshop</title>

</head>

<body>
	<div class="container">
		<a href="OrderHistory" id="orderhistory">Storico Ordini </a> <a
			href="cart.jsp">Visualizza Carrello</a> <a href="loginPage.jsp"
			id="loginPage">Login </a> <a href="Admin/Catalogo.jsp" id="Catalogo">Catalogo
		</a>
	</div>


	<h2>Prodotti</h2>

	<table>
		<thead class=catalogo>
			<tr>
				<th><a href="product?sort=id">Id </a></th>
				<th><a href="product?sort=nome">Nome</a></th>
				<th><a href="product?sort=prezzo">Prezzo</a></th>
				<th><a href="product?sort=voto">Voto</a></th>
				<th><a href="product?sort=quantita">Quantita'</a></th>
				<th>Azioni</th>
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
		</tbody>
	</table>




</body>
</html>