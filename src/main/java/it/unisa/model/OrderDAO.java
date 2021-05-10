package it.unisa.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;
import java.time.LocalDate;

public class OrderDAO {
	private static DataSource ds;
	static Connection currentCon = null;
	static ResultSet rs = null;
	static int numordine;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/comicshop");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "ordine";

	public static  void setOrder(UserBean bean,Cart cart) {
		
		
		PreparedStatement preparedStatement = null;
	
		
		
		String username= bean.getUsername();
		String indirizzo_spedizione;
		String metodo_di_pagamento;
		String insertQuery = "INSERT INTO " + TABLE_NAME +"VALUES(?,?,?,?,?)";


	
	

		// connect to DB
		Connection connection = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setLong(1, numordine++);
			preparedStatement.setFloat(2, cart.getTotalCost());
			preparedStatement.setString(3, "lorem ipsum");
			preparedStatement.setDate(4,  Date.valueOf(LocalDate.now()));
			preparedStatement.setString(5, "lorem ipsum");
			
			 preparedStatement.executeQuery(insertQuery);
			
			

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

			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}

				currentCon = null;
			}
		}

		

	}

