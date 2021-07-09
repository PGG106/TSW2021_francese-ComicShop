<%@page import="it.unisa.model.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="../fragments/header.jsp"%>

<%
} else {
%>
<%@ include file="../fragments/headerlogged.jsp"%>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<script src="./js/catalogo.js"></script>

<title>Catalogo</title>
</head>
<body>
	<%
	Collection<?> products = (Collection<?>) session.getAttribute("products");
	%>


	<h2>Prodotti</h2>
	 
<div class=details>
	
	<form method="GET" id="my_form" action="product"></form>
	<table>
	
		<thead class=details>
		<tr>
			<th><a href="product?sort=id">Id </a></th>
			<th><a href="product?sort=nome">Nome</a></th>
			<th><a href="product?sort=prezzo">Prezzo</a></th>
			<th><a href="product?sort=voto">Voto</a></th>
			<th><a href="product?sort=quantita">Quantità;</a></th>
			<th>Saldo</th>
			<th>Data di uscita</th>
			<th>Descrizione</th>
			<th>Peso</th>
			<th>Visibile</th>
			<th></th>
    		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
			%>
			</tr>
		</thead>
			
        <tbody  class=details>
        	<tr>
        		<td>
            		<INPUT class="catalogo-admin" type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT class="catalogo-admin" type="hidden" name="action" value="update"> 
					<INPUT class="catalogo-admin" TYPE=number name="NewID" VALUE=<%=bean.getId()%>> 
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
        		</td>
        		
        		<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type="hidden" name="action" value="update">
					<INPUT TYPE=TEXT NAME=nome VALUE=<%=bean.getNome()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>
				<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type="hidden" name="action" value="update">
					<INPUT TYPE=number step="any" NAME=prezzo VALUE=<%=bean.getPrezzo()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>
				<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type="hidden" name="action" value="update">
					<INPUT TYPE=number min="0" max="10" NAME=voto VALUE=<%=bean.getVoto()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>
				<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type="hidden" name="action" value="update">
					<INPUT TYPE=number min="0" NAME=quantita VALUE=<%=bean.getQuantità()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>

				<td>
					<INPUT type="hidden" name="action" value="update">
					<INPUT type="hidden" name="action" value="update"> 
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type=number min="0" NAME=saldo VALUE=<%=bean.getSaldo()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>


				<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type="hidden" name="action" value="update">
					<INPUT TYPE=date VALUE=<%=bean.getData_uscita()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>

				<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT type="hidden" name="action" value="update">
					<INPUT TYPE=TEXT name=descrizione VALUE=<%=bean.getDescrizione()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>

				<td>
					<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
					<INPUT TYPE=number step="any" NAME=peso VALUE=<%=bean.getPeso()%>>
					<%-- <INPUT TYPE=SUBMIT VALUE=Update>--%>
				</td>
					
				<td><INPUT TYPE="checkbox" value=<%=bean.getId()%>
					NAME="mostra" <%if (bean.isVisible()) {%> checked <%}%>>
				</td>
				<td>
					<INPUT class=btn-det TYPE=SUBMIT VALUE=Update>
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
			</tbody>	
    	
	</table>
</div>	
		









	<h2 style="text-align: center;">Inserisci nuovo articolo</h2>
<div class=details>
	<form method="post" id="a_form" action="product"></form>
	<table>
	
		<thead class=details>
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Voto</th>
			<th>Quantità;</th>
			<th>Saldo</th>
			<th>Data di uscita</th>
			<th>Descrizione</th>
			<th>Peso</th>
			<th></th>
			<th></th>
			</tr>
		</thead>
		 <tbody  class=details>
        	<tr>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="id" type="number" 
            		maxlength="20" required placeholder="Inserisci ID">
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="nome" type="text"
            		maxlength="20" required placeholder="Inserisci nome">
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="prezzo" type="number" min="0" value="0" required>
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="voto" type="number" min="0" max="10" required>
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="quant" type="number" min="1" value="1" required>
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="saldo" type="number" value="0" required>
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		 <input class=details name="data" type="date" required>
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=details name="descrizione" type="text" maxlength="100" rows="3" 
            		required placeholder="Inserisci descrizione">
        		</td>
        		<td>
            		<input type="hidden" name="action" value="insert">
            		<input class=detailso name="peso" type="number" required>
        		</td>
        		<td>
        			<input class=btn-det type="submit" value="Aggiungi">
				</td>
				<td>
					<input class=btn-det type="reset" value="Ripristina">
				</td>
        </tbody>	
    </table>
</div>	
		


</body>
<%@ include file="../fragments/footer.html"%>
</html>