package it.unisa.control;

import java.io.IOException;
import java.time.LocalDate;
import it.unisa.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentMethodControl
 */
@WebServlet("/PaymentMethodControl")
public class PaymentMethodControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static PaymentMethodDAO PaymentMethodDAO = new PaymentMethodDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentMethodControl() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int tipo = (request.getParameter("tipo")=="carta di credito" ) ? 0: 1;
		String titolare = request.getParameter("titolare");
		boolean predefinito = false;
		String indirizzo_fatturazione = request.getParameter("indirizzo_fatturazione");
		long numero = Long.parseLong(request.getParameter("numero"));
		LocalDate scadenza = LocalDate.parse(request.getParameter("scadenza"));
		PaymentMethodBean paymentMethod = new PaymentMethodBean();
		UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
		paymentMethod.setTipo(tipo);
		paymentMethod.setTitolare(titolare);
		paymentMethod.setPredefinito(predefinito);
		paymentMethod.setIndirizzo_fatturazione(indirizzo_fatturazione);
		paymentMethod.setNumero(numero);
		paymentMethod.setScadenza(scadenza);
		PaymentMethodDAO.doSave(user, paymentMethod);
		
		response.sendRedirect("CheckoutPage.jsp");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
