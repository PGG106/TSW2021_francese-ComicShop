<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="NewFile.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%if(request.getParameter("login")!=null)
{
	if(request.getParameter("login").equals("wrong"))
	{%>
	<h2 class=error>Le credenziali inserite sono sbagliate </h2>	
<%}
	}%>

	<h2>Accedi / Registrati</h2>
	
	<h3>Hai già un account?</h3>
	
<div class=login>
<form action="Login" class=login>
<label><input class=login type="text" name="un" placeholder="Username"></label> <br><br>
<label><input class=login type="password" name="pw" placeholder="Password"></label><br><br>
<button class=btn type="submit" name="login">Login</button>
<button class=btn type="submit" formaction="RegistrationPage.jsp">Crea un account</button>
</form>
</div>
</body>
</html>