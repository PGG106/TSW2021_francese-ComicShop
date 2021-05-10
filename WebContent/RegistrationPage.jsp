<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina di registrazione</title>
</head>
<body>
<h2> compila il form per registrarti</h2>
<form action="UserControl">
<label>Username<input type=text name=usr required></label> <br>
<label>Nome<input type=text name=nome required></label> <br>
<label>Cognome<input type=text name=cogn required></label> <br>
<label>Email<input type=email name=email required></label> <br>
<label>Password<input type=password name=pwd required></label> <br>
<label>Num_tel<input type=number name=num_tel required></label> <br>
<label>Paese di residenza<input type=text name=paese required></label> <br>
<label>Data di nascita<input type=date name=data required></label><br>
<input type=submit value=Registrati>
</form>
</body>
</html>