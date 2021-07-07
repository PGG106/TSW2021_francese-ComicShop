package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.google.gson.Gson;

/**
 * Servlet implementation class Visibility
 */
@WebServlet("/Visibility")
public class Visibility extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Visibility() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json");
	
		if (request.getParameter("id") == null || request.getParameter("visible") == null) {
			return;
		}
		System.out.println(request.getParameter("visible"));
		System.out.println(request.getParameter("id"));
		Boolean visible= (request.getParameter("visible").equalsIgnoreCase("true"));
		DataSource ds = null;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/comicshop");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}

		PreparedStatement preparedStatement = null;
		String query = "UPDATE `comicshop`.`articolo` SET `mostra` = ? WHERE (`id` = ?);";
		try {
			Connection connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setBoolean(1, visible);
			preparedStatement.setLong(2, Long.parseLong(request.getParameter("id")));
			preparedStatement.executeUpdate();

			boolean success = true;
			Gson gson = new Gson();
			String jsonInString = gson.toJson(success);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(jsonInString);
			out.flush();
			System.out.println(preparedStatement);
			connection.close();
			preparedStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
