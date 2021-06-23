package it.unisa.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import it.unisa.model.*;

/**
 * Servlet implementation class AddressControl
 */
@WebServlet("/AddressControl")
public class AddressControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static AddressDAO AddressDAO = new AddressDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String via = request.getParameter("via");
		int numero_civico = Integer.parseInt(request.getParameter("numero_civico"));
		int cap = Integer.parseInt(request.getParameter("cap"));
		String città = request.getParameter("citta");
		String provincia = request.getParameter("provincia");
		AddressBean address = new AddressBean();
		UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
		address.setVia(via);
		address.setNumero_civico(numero_civico);
		address.setCap(cap);
		address.setCittà(città);
		address.setProvincia(provincia);
		AddressDAO.doSave(user, address);
	
		
		response.sendRedirect("CheckoutPage.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
