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





	<h2 style="text-align: center;">Inserisci nuovo articolo</h2>
<div class=details>
	<form method="post" id="a_form" action="product">
	<table>
	
		<thead class=details>
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Voto</th>
			<th>Quantit&agrave;</th>
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
            		<input class=details name="descrizione" type="text" maxlength="100"  
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
    </form>
</div>	
		


<h2>Prodotti</h2>
	 
<div class=details>
	

	<table>
	
		<thead class=details>
		<tr>
			<th><a href="product?sort=id">Id </a></th>
			<th><a href="product?sort=nome">Nome</a></th>
			<th><a href="product?sort=prezzo">Prezzo</a></th>
			<th><a href="product?sort=voto">Voto</a></th>
			<th><a href="product?sort=quantita">Quantit&agrave;</a></th>
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
        		<INPUT class="catalogo-admin old" TYPE=hidden  name="OldID" VALUE=<%=bean.getId()%>> 
					<INPUT class="catalogo-admin new" TYPE=number  name="NewID" VALUE=<%=bean.getId()%>> 
        		</td>
        		
        		<td>
					<INPUT TYPE=TEXT class="nome" NAME=nome VALUE=<%=bean.getNome()%>>
				</td>
				<td>
					<INPUT TYPE=text step="any" class="prezzo" NAME=prezzo VALUE=<%=String.format("%.2f", bean.getPrezzo())%>>
				</td>
				<td>
					<INPUT TYPE=number min="0" max="10" class="voto" NAME=voto VALUE=<%=bean.getVoto()%>>
				</td>
				<td>
					<INPUT TYPE=number min="0" class="quantita" NAME=quantita VALUE=<%=bean.getQuantità()%>>
				</td>

				<td>
					<INPUT type=number min="0" class="saldo" NAME=saldo VALUE=<%=bean.getSaldo()%>>
				</td>


				<td>
					<INPUT TYPE=date class="data" name="data" VALUE=<%=bean.getData_uscita()%>>
				</td>

				<td>
					<INPUT TYPE=TEXT class="descrizione" name=descrizione VALUE=<%=bean.getDescrizione()%>>
				</td>

				<td>
					<INPUT TYPE=number step="any" class=peso NAME=peso VALUE=<%=bean.getPeso()%>>
				</td>
					
				<td><INPUT TYPE="checkbox" value=<%=bean.getId()%>
					NAME="mostra" <%if (bean.isVisible()) {%> checked <%}%>>
				</td>
				<td>
					<INPUT class="btn-det" TYPE=SUBMIT VALUE="Update">
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
		










</body>
<%@ include file="../fragments/footer.html"%>
</html>