<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="NewFile.css">
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

<form action="Login">
<label>Username <input type="text" name="un" ></label> <br>
<label>Password <input type="password" name="pw" ></label>
<input type="submit" name="login" value="login">
</form>
<a href= "RegistrationPage.jsp">non sei registrato? Registrati ora</a>
</body>
</html>