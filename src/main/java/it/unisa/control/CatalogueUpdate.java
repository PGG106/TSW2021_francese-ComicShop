package it.unisa.control;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductDAO;

/**
 * Servlet implementation class CatalogueUpdate
 */
@WebServlet("/CatalogueUpdate")
public class CatalogueUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CatalogueUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductBean newProduct = new ProductBean();
List<String> parameterNames = new ArrayList<String>(request.getParameterMap().keySet());

		
		
		for(String nome : parameterNames)
		{
			System.out.println(nome);
		}
		
		
		newProduct.setId(Integer.parseInt(request.getParameter("Newid")));
		newProduct.setNome((request.getParameter("nome")));
		newProduct.setPrezzo(Float.parseFloat(request.getParameter("prezzo").replace(',', '.')));
		newProduct.setSaldo(Integer.parseInt(request.getParameter("saldo")));
		newProduct.setData_uscita(LocalDate.parse(request.getParameter("data")));
		newProduct.setVoto(Float.parseFloat(request.getParameter("voto")));
		newProduct.setDescrizione(request.getParameter("descrizione"));
		newProduct.setPeso(Float.parseFloat(request.getParameter("peso")));
		newProduct.setQuantità(Integer.parseInt(request.getParameter("quantita")));

		ProductDAO productDAO = new ProductDAO();
		productDAO.Alter(Long.parseLong( request.getParameter("Oldid")) , newProduct);
	}

}
