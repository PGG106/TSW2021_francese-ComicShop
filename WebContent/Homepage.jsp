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
<script src="./js/photo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Comicshop</title>

</head>

<body>


	<h2>Prodotti</h2>



	<br>
	<div class="grid-container">
		<%
		if (products != null && products.size() != 0) {
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				ProductBean bean = (ProductBean) it.next();
				LinkedList<PhotoBean> foto = (LinkedList<PhotoBean>) fotodao.getPhotos(bean);
				if (bean.isVisible()) {
		%>
	
		<div class="grid-item">
			<div class="thumbnail">
				<a href="product?action=read&id=<%=bean.getId()%>"> <img
					src="data:image/jpg;base64,<%=foto.get(0).getBase64image()%>"
					width=100% height=300 />
				</a>
			</div>
			<div class="item-description">
				<h4><%=bean.getNome()%></h4>
				<h5><%=String.format("%.2f", bean.getPrezzo())%>
					&euro;
				</h5>
				<h6>
					<a href="product?action=addC&id=<%=bean.getId()%>">Aggiungi al
						carrello</a>
				</h6>
			</div>
		</div>






		<%
		} else {
		continue;
		}
		}
		} else {
		%>

		<h3>Nessun prodotto disponibile</h3>

		<%
		}
		%>

	</div>

</body>

<%@ include file="./fragments/footer.html"%>
</html>