package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModel;
import it.unisa.model.ProductModelDS;

/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager
	static boolean isDataSource = true;

	static ProductModel model = new ProductModelDS();

	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(id);
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(id);
				} else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				} else if (action.equalsIgnoreCase("insert")) {
					int id = Integer.parseInt(request.getParameter("id"));
					String nome = request.getParameter("nome");
					float prezzo = Float.parseFloat(request.getParameter("prezzo"));
					int saldo = Integer.parseInt(request.getParameter("saldo"));
					LocalDate data_uscita = LocalDate.parse(request.getParameter("data_uscita"));
					float voto = Float.parseFloat(request.getParameter("voto"));
					String descrizione = request.getParameter("descrizione");
					float peso = Float.parseFloat(request.getParameter("peso"));
					int quantità = Integer.parseInt(request.getParameter("quantità"));
					ProductBean bean = new ProductBean();
					bean.setId(id);
					bean.setNome(nome);
					bean.setPrezzo(prezzo);
					bean.setSaldo(saldo);
					bean.setData_uscita(data_uscita);
					bean.setVoto(voto);
					bean.setDescrizione(descrizione);
					bean.setPeso(peso);
					bean.setQuantità(quantità);
					model.doSave(bean);
				}
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);

		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
