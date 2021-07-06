<%@page import="it.unisa.model.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Catalogo</title>
</head>
<body>
	<%
	Collection<?> products = (Collection<?>) session.getAttribute("products");
	%>






	<h2>Prodotti</h2>

	<table>
		<thead class=catalogo>
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
				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=number name="NewID" VALUE=<%=bean.getId()%>> <INPUT TYPE=SUBMIT
							VALUE=Update>
					</form></td>
				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=TEXT NAME=nome VALUE=<%=bean.getNome()%>> <INPUT
							TYPE=SUBMIT VALUE=Update>
					</form></td>
				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=number step="any" NAME=prezzo VALUE=<%=bean.getPrezzo()%>>
						<INPUT TYPE=SUBMIT VALUE=Update>
					</form></td>
				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=number min="0" max="10" NAME=voto VALUE=<%=bean.getVoto()%>>
						<INPUT TYPE=SUBMIT VALUE=Update>
					</form></td>
				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=number min="0" NAME=quantita VALUE=<%=bean.getQuantità()%>>
						<INPUT TYPE=SUBMIT VALUE=Update>
					</form></td>

				<td><form action="product">
						<INPUT type="hidden" name="action" value="update"> <INPUT
							type="hidden" name="action" value="update"> <INPUT
							type="hidden" name=itemID value=<%=bean.getId()%>> <INPUT
							type=number min="0" NAME=saldo VALUE=<%=bean.getSaldo()%>>
						<INPUT type=SUBMIT VALUE=Update>
					</form></td>


				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=date VALUE=<%=bean.getData_uscita()%>> <INPUT
							TYPE=SUBMIT VALUE=Update>
					</form></td>

				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>
						<INPUT type="hidden" name="action" value="update"> <INPUT
							TYPE=TEXT name=descrizione VALUE=<%=bean.getDescrizione()%>>
						<INPUT TYPE=SUBMIT VALUE=Update>
					</form></td>

				<td><form action="product">
						<INPUT type="hidden" name=itemID value=<%=bean.getId()%>>

						<INPUT TYPE=number step="any" NAME=peso VALUE=<%=bean.getPeso()%>> <INPUT
							TYPE=SUBMIT VALUE=Update>
					</form></td>
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


	<h2 style="text-align: center;">Inserisci nuovo articolo</h2>
	<div class=catalogo>
		<form style="text-align: center;" action="product" method="post">
			<input type="hidden" name="action" value="insert"> <label
				for="id">Id:</label><br> <input class=catalogo name="id"
				type="number" maxlength="20" required placeholder="Inserisci ID"><br>

			<label for="nome">Nome:</label><br> <input class=catalogo
				name="nome" type="text" maxlength="20" required
				placeholder="Inserisci nome"><br> <label
				for="descrizione">Descrizione:</label><br>
			<textarea class=catalogo name="descrizione" maxlength="100" rows="3"
				required placeholder="Inserisci descrizione"></textarea>
			<br> <label for="prezzo">Prezzo:</label><br> <input
				class=catalogo name="prezzo" type="number" min="0" value="0"
				required><br> <label for="saldo">Saldo:</label><br>
			<input class=catalogo name="saldo" type="number" value="0" required><br>

			<label for="data">Data di uscita</label><br> <input
				class=catalogo name="data" type="date" required><br> <label
				for="voto">Voto:</label><br> <input class=catalogo name="voto"
				type="number" min="0" max="10" required><br> <label
				for="peso">Peso:</label><br> <input class=catalogo name="peso"
				type="number" required><br> <label for="quant">Quantita':</label><br>
			<input class=catalogo name="quant" type="number" min="1" value="1"
				required><br> <input class=btn type="submit"
				value="Aggiungi"><input class=btn type="reset"
				value="Ripristina">
		</form>
	</div>

</body>
</html>