package it.unisa.control;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import it.unisa.model.Cart;
import it.unisa.model.ContentBean;
import it.unisa.model.OrderDAO;
import it.unisa.model.ProductDAO;
import it.unisa.model.UserBean;

@WebServlet("/Ordine")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static OrderDAO OrderDao = new OrderDAO();
static ProductDAO productDAO= new ProductDAO();
	public OrdineControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		OrderDAO order = new OrderDAO();

		String action = request.getParameter("action");



		if (action != null) {
			if (action.equalsIgnoreCase("CompletaOrdine")) {
				HttpSession session = request.getSession(true);
				order.doSave((UserBean) session.getAttribute("currentSessionUser"), request.getParameter("indirizzo"),
						request.getParameter("pagamento"), cart);
				session.setAttribute("cart", new Cart());
				response.sendRedirect("./Homepage.jsp");

			}

			else if (action.equalsIgnoreCase("mostradettagli")) {
				HttpSession session = request.getSession(true);
				String id = String.valueOf(request.getParameter("codice"));
				LinkedList<ContentBean> products=order.getContentByOrderId(id);
				session.removeAttribute("ordine");
				session.setAttribute("ordine", order.getOrderById(id));
				session.setAttribute("products", products);
				request.getRequestDispatcher("orderDetails.jsp").forward(request, response);
			}
			
			

		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
