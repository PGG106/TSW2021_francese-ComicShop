<%@page import="it.unisa.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://use.fontawesome.com/747292109b.js"></script>
<link href="./style/headerStyle.css" rel="stylesheet" type="text/css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<section class="navigation">
		<div class="nav-container">
			<div class="brand">
				<a href="./Homepage.jsp">ComicShop</a>
			</div>
			<nav>
				<div class="nav-mobile">
					<a id="nav-toggle" href="#!"><span></span></a>
				</div>
				<ul class="nav-list">

			<%-- 

					<li>
						<form action="" id="searchform" method="get">
							<input type="search" name="search" placeholder="Cerca..." />
						</form>
					</li>
--%>
					<li><a href="#!">Ciao, <%=((UserBean) session.getAttribute("currentSessionUser")).getNome()%>
					</a>
						<ul class="nav-dropdown">
							<li><a href="./UserPage">Il mio account</a></li>
							<li><a href="./OrderHistory">I miei ordini</a></li>
							<li><a href="./Logout">Esci</a></li>
						</ul></li>
					<li><a href="./OrderHistory">Storico ordini</a></li>
					<li><a href="./cart.jsp">Carrello</a></li>

					<%
					if (((UserBean) session.getAttribute("currentSessionUser")).IsAdmin()) {
					%>
					<li><a href="./OrderArchive">Storico ordini admin</a></li>
					<li><a href="./Catalogo">Catalogo</a></li>
					<%
					}
					%>



				</ul>
			</nav>
		</div>
	</section>

	<script>
		(function($) { // Begin jQuery
			$(function() { // DOM ready
				// If a link has a dropdown, add sub menu toggle.
				$('nav ul li a:not(:only-child)').click(function(e) {
					$(this).siblings('.nav-dropdown').toggle();
					// Close one dropdown when selecting another
					$('.nav-dropdown').not($(this).siblings()).hide();
					e.stopPropagation();
				});
				// Clicking away from dropdown will remove the dropdown class
				$('html').click(function() {
					$('.nav-dropdown').hide();
				});
				// Toggle open and close nav styles on click
				$('#nav-toggle').click(function() {
					$('nav ul').slideToggle();
				});
				// Hamburger to X toggle
				$('#nav-toggle').on('click', function() {
					this.classList.toggle('active');
				});
			}); // end DOM ready
		})(jQuery); // end jQuery
	</script>

</body>
</html>