<%@page import="it.unisa.model.ProductDAO"%>
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
ProductDAO model= new ProductDAO();

Collection<?> products = (Collection<?>) model.doRetrieveAll("id");

%>
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
</html>