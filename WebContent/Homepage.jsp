<%@page import="it.unisa.model.PhotoBean"%>
<%@page import="it.unisa.model.PhotoDAO"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.*"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.xml.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="./fragments/header.jsp"%>

<%
} else {
%>
<%@ include file="./fragments/headerlogged.jsp"%>
<%
}
%>




<%
Collection<?> products = (Collection<?>) request.getAttribute("products");
PhotoDAO fotodao = new PhotoDAO();
if (products == null) {
	response.sendRedirect("./product");
	return;
}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Comicshop</title>

</head>

<body>


	<h2>Prodotti</h2>

	<table>
		<thead class=catalogo>
			<tr>
				<th>Foto</th>
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
					LinkedList<PhotoBean> foto = (LinkedList<PhotoBean>) fotodao.getPhotos(bean);
					if (bean.isVisible()) {
			%>
			<tr>
				<td><img
					src="data:image/jpg;base64,<%=foto.get(0).getBase64image()%> "
					width=200 height=200 /></td>
				<td><%=bean.getNome()%></td>
				<td><%=String.format("%.2f", bean.getPrezzo())%> &euro;</td>
				<td><%=bean.getVoto()%></td>
				<td><%=bean.getQuantità()%></td>
				<td><a href="product?action=read&id=<%=bean.getId()%>">Dettagli</a><br>
					<a href="product?action=addC&id=<%=bean.getId()%>">Aggiungi al
						carrello</a></td>
			</tr>

			<%
			} else {
			continue;
			}
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

<%@ include file="./fragments/footer.html"%>
</html>