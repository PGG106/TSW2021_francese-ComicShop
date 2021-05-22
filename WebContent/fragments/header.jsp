<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://use.fontawesome.com/747292109b.js"></script>
<link href="./style/headerStyle.css" rel="stylesheet" type="text/css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<section class="navigation">
  <div class="nav-container">
    <div class="brand">
      <a href="./ProductView.jsp">ComicShop</a>
    </div>
    <nav>
      <div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>
      <ul class="nav-list">

        <li>
            <form action="" id="searchform" method="get">
            <input type="search"name="search"placeholder="Cerca..."/> 
            </form>
         </li>
        <!-- pulsante da implementare in un altro posto -->
        <li>
          <a href="./OrderHistory.jsp">Storico ordini</a>
        </li>
        
        
         <li>
          <a href="#!">Dropdown 1</a>
          <ul class="nav-dropdown">
            <li>
              <a href="#!">Link 1</a>
            </li>
            <li>
              <a href="#!">Link 2</a>
            </li>
            <li>
              <a href="#!">Link 3</a>
            </li>
          </ul>
        </li>
        
        <li>
          <a href="./Admin/Ordini.jsp">Storico ordini_admin</a>
        </li>
        
        
        
        <li>
          <a href="./cart.jsp">Carrello</a>
        </li>
        <li>
          <a href="./loginPage.jsp">Accedi</a>
        </li>
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