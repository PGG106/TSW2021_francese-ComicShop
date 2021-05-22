package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductDAO;

/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProductDAO model = new ProductDAO();

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
					request.getRequestDispatcher("cart.jsp").forward(request, response);
				} else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					request.getRequestDispatcher("productDetails.jsp").forward(request, response);

				} else if (action.equalsIgnoreCase("Update")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean product = new ProductBean();
					product = model.doRetrieveByKey(id);
					Integer Newid = Integer.parseInt(request.getParameter("NewID"));
					String nome = request.getParameter("nome");
					Float prezzo = Float.parseFloat(request.getParameter("prezzo"));
					Integer saldo = Integer.parseInt(request.getParameter("saldo"));
					LocalDate data_uscita = LocalDate.parse(request.getParameter("data"));
					Float voto = Float.parseFloat(request.getParameter("voto"));
					String descrizione = request.getParameter("descrizione");
					Float peso = Float.parseFloat(request.getParameter("peso"));
					Integer quantità = Integer.parseInt(request.getParameter("quantita"));

					if (Newid != null) {
						product.setId(Newid);
					}

					if (nome != null) {
						product.setNome(nome);
					}

					if (prezzo != null) {
						product.setPrezzo(prezzo);
					}

					if (saldo != null) {
						product.setSaldo(saldo);
					}
					if (data_uscita != null) {
						product.setData_uscita(data_uscita);
					}
					if (voto != null) {
						product.setVoto(voto);
					}
					if (descrizione != null) {
						product.setDescrizione(descrizione);
					}
					if (peso != null) {
						product.setPeso(peso);
					}
					if (quantità != null) {
						product.setQuantità(quantità);
					}

					model.Alter(id, product);

				}

				else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				} else if (action.equalsIgnoreCase("insert")) {

					int id = Integer.parseInt(request.getParameter("id"));
					String nome = request.getParameter("nome");
					float prezzo = Float.parseFloat(request.getParameter("prezzo"));
					int saldo = Integer.parseInt(request.getParameter("saldo"));
					LocalDate data_uscita = LocalDate.parse(request.getParameter("data"));
					float voto = Float.parseFloat(request.getParameter("voto"));
					String descrizione = request.getParameter("descrizione");
					float peso = Float.parseFloat(request.getParameter("peso"));
					int quantità = Integer.parseInt(request.getParameter("quant"));
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

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
		dispatcher.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
