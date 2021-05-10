package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import it.unisa.model.Cart;
import it.unisa.model.OrderDAO;
import it.unisa.model.UserBean;

@WebServlet("/Ordine")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static OrderDAO OrderDao = new OrderDAO();

	public OrdineControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		

		String action = request.getParameter("action");

		if (action != null) {
			if (action.equalsIgnoreCase("CompletaOrdine")) {
				 HttpSession session = request.getSession(true);	     
				if (session.getAttribute("currentSessionUser") != null)
				{OrderDAO.setOrder((UserBean)session.getAttribute("currentSessionUser"), cart);
				session.setAttribute("cart", new Cart());
				}
				else
				{
					response.sendRedirect("loginPage.jsp");
				}
			} 
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
