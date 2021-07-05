package it.unisa.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.OrderBean;
import it.unisa.model.OrderDAO;
import it.unisa.model.UserBean;

/**
 * Servlet implementation class OrderHistoryServlet
 */
@WebServlet("/OrderHistory")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		UserBean user = (UserBean) session.getAttribute("currentSessionUser");
		OrderDAO orderDAO = new OrderDAO();
		List<OrderBean> ordini = new ArrayList<OrderBean>();
		ordini = orderDAO.getAllOrdersByUser(user);
		session.setAttribute("ordini", ordini);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderHistory.jsp");
		dispatcher.include(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
