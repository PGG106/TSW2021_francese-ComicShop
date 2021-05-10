package it.unisa.control;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

/**
 * Servlet implementation class UserControl
 */
@WebServlet("/UserControl")
public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UserDAO UserDAO = new UserDAO();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("usr");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cogn");
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		String num_telefono = request.getParameter("num_tel");
		String paese_residenza = request.getParameter("paese");
		LocalDate data_nascita=LocalDate.parse(request.getParameter("data"));
		UserBean user= new UserBean();
		user.setUsername(username);
		user.setNome(nome);
		user.setCognome(cognome);
		user.setEmail(email);
		user.setPassword(password);
		user.setNum_tel(num_telefono);
		user.setPaese_residenza(paese_residenza);
		user.setData_nascita(data_nascita);
		UserDAO.doSave(user);
		
		response.sendRedirect("loginPage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
