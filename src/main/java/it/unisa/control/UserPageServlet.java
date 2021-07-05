package it.unisa.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.AddressBean;
import it.unisa.model.AddressDAO;
import it.unisa.model.PaymentMethodBean;
import it.unisa.model.PaymentMethodDAO;
import it.unisa.model.UserBean;

/**
 * Servlet implementation class UserPageServlet
 */
@WebServlet("/UserPage")
public class UserPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPageServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("currentSessionUser");
		AddressDAO addressDAO = new AddressDAO();
		PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
		
		List<AddressBean> addresses = addressDAO.getAddresses(user);
		List<String> indirizzi = new LinkedList<String>();
		for (AddressBean address : addresses) {
			String indirizzo;
			indirizzo = address.getVia() + " " + address.getNumero_civico() + " " + address.getCittà() + " "
			+ address.getProvincia() + " " + address.getCap();

			indirizzi.add(indirizzo);
		}

	
		List<PaymentMethodBean> paymentMethods = paymentMethodDAO.getPaymentMethods(user);

		List<String> metodiPagamento = new ArrayList<String>();
		for (PaymentMethodBean paymentMethod : paymentMethods) {
			String metodoPagamento;
			metodoPagamento = paymentMethod.getTipo() + " " + paymentMethod.getTitolare() + " "
			+ paymentMethod.getIndirizzo_fatturazione() + " " + paymentMethod.getNumero() + " "
			+ paymentMethod.getScadenza();

			metodiPagamento.add(metodoPagamento);
		}
		session.setAttribute("indirizzi", indirizzi);
		session.setAttribute("metodi", metodiPagamento);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserPage.jsp");
		dispatcher.include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
