package it.unisa.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class OrderDAO {
	private static DataSource ds;
	static ResultSet rs = null;
	static int numordine;
	private static final String TABLE_NAME = "ordine";

	public OrderDAO() {
		super();

	}

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/comicshop");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	public synchronized  void doSave(UserBean bean, Cart cart) {

		PreparedStatement preparedStatement = null;

		
		String indirizzo_spedizione;
		String metodo_di_pagamento;
		String insertQuery = "INSERT INTO " + TABLE_NAME + "VALUES(?,?,?,?,?,?,?)";

		// connect to DB
		Connection connection = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setLong(1, numordine++);
			preparedStatement.setFloat(2, cart.getTotalCost());
			preparedStatement.setString(3, "lorem ipsum");
			preparedStatement.setDate(4, Date.valueOf(LocalDate.now()));
			preparedStatement.setString(5, "lorem ipsum");
			preparedStatement.setString(6, bean.getUsername());
			preparedStatement.setDate(7, Date.valueOf(LocalDate.now()));
			preparedStatement.executeQuery();

		}

		catch (Exception ex) {
			System.out.println("Inserimento ordine fallito " + ex);
		}

		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (Exception e) {
			}
			preparedStatement = null;
		}

		if (connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
			}

			connection = null;
		}
	}

	public synchronized OrderBean getOrderById(String OrderID) {
		PreparedStatement preparedStatement = null;
		Connection connection = null;

		OrderBean bean = new OrderBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE numero_ordine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, OrderID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCosto_totale(rs.getFloat("costo_totale"));
				bean.setNum_ordine(rs.getLong("numero_ordine"));
				bean.setData_spedizione(rs.getDate("data_spedizione").toLocalDate());
				bean.setMetodo_di_pagamento(rs.getString("metodo_di_pagamento"));
				bean.setIndirizzo_spedizione(rs.getString("indirizzo_spedizione"));
				bean.setUsername(rs.getString("username"));
				bean.setData_ordine(rs.getDate("data_ordine").toLocalDate());
			}
		}

		catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} 
			catch (Exception e) {
				System.out.println("Error:" + e.getMessage());
			}
				
			}
		
		return bean;

	}

	public synchronized List<OrderBean> getAllOrdersByUser(UserBean user) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		List<OrderBean> orders = new LinkedList<OrderBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME +" WHERE username = "+user.getUsername() ;


		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();

				bean.setCosto_totale(rs.getFloat("costo_totale"));
				bean.setNum_ordine(rs.getLong("numero_ordine"));
				bean.setData_spedizione(rs.getDate("data_spedizione").toLocalDate());
				bean.setMetodo_di_pagamento(rs.getString("metodo_di_pagamento"));
				bean.setIndirizzo_spedizione(rs.getString("indirizzo_spedizione"));
				bean.setUsername(rs.getString("username"));
				bean.setData_ordine(rs.getDate("data_ordine").toLocalDate());
				orders .add(bean);
			}
		}
			catch (Exception ex) {
				System.out.println("Inserimento ordine fallito " + ex);
			}

		 finally {
			
				try {
					if (preparedStatement != null)
						preparedStatement.close();
					if (connection != null)
						connection.close();
				} catch (Exception e) {
					System.out.println("Inserimento ordine fallito " + e);
				}
			
			}
		
		return orders ;
	}

}
