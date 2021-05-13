package it.unisa.model;
import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PaymentMethodDAO {

	private static DataSource ds;
	static Connection currentCon = null;
	static ResultSet rs = null;
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/comicshop");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	private static final String TABLE_NAME = "utente";
	private static final String TABLE_NAME2 = "fatturazione";
	private static final String TABLE_NAME3 = "metodo_di_pagamento";


	public synchronized List<PaymentMethodBean> getPaymentMethods(UserBean user) {
		List<PaymentMethodBean> Methods = new LinkedList<PaymentMethodBean>();
		PreparedStatement preparedStatement = null;
		String SearchQuery = "Select" + TABLE_NAME3 + ".*" + "FROM" + TABLE_NAME + "Join" + TABLE_NAME2
				+ " ON username=utente" + "Join" + TABLE_NAME3 + " ON " + TABLE_NAME2 + ".metodo_di_pagamento=" + TABLE_NAME3 + ".numero"
				+"WHERE "+TABLE_NAME+".username=?";
				
		Connection connection = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SearchQuery);
			preparedStatement.setString(1, user.getUsername());

			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				PaymentMethodBean bean = new PaymentMethodBean();
				bean.setId(rs.getInt("id"));
				bean.setIndirizzo_fatturazione(rs.getString("indirizzo_fatturazione"));
				bean.setNumero(rs.getLong("numero"));
				bean.setScadenza(rs.getDate("scadenza").toLocalDate());
				bean.setPredefinito(rs.getBoolean("predefinito"));
				bean.setTipo(rs.getInt("tipo"));
				bean.setTitolare(rs.getString("titolare"));
				Methods.add(bean);

			}

		}

		catch (Exception ex) {
			//TODO
		}

		return Methods;

	}

	public synchronized void doSave(UserBean user, PaymentMethodBean PaymentMethod) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME3
				+ " (tipo,titolare,scadenza,predefinito,indirizzo_fatturazione,numero ) VALUES (?, ?,?, ?,?,?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, PaymentMethod.getTipo());
			preparedStatement.setString(2, PaymentMethod.getTitolare());
			preparedStatement.setDate(3, Date.valueOf(PaymentMethod.getScadenza()));
			preparedStatement.setBoolean(4, PaymentMethod.isPredefinito());
			preparedStatement.setString(5, PaymentMethod.getIndirizzo_fatturazione());
			preparedStatement.setLong(6, PaymentMethod.getNumero());
			preparedStatement.executeUpdate();

		} catch (SQLException ex) {
			if (ex.getErrorCode() == 1062) {
				System.out.println("PaymentMethod già esistente nel DB " + ex);
				try {
					preparedStatement.close();

					insertSQL = "INSERT INTO " + TABLE_NAME2 + " (utente,metodo_di_pagamento) VALUES (?, ?)";
					preparedStatement = connection.prepareStatement(insertSQL);
					preparedStatement.setString(1, user.getUsername());
					preparedStatement.setInt(2, PaymentMethod.getId());
					preparedStatement.executeUpdate();

				} catch (Exception e) {
					System.out.print("could not update table " + TABLE_NAME2 + " to reflect changes");
				}

				finally {
					try {
						if (preparedStatement != null)
							preparedStatement.close();

						if (connection != null)
							connection.close();
					} catch (Exception e) {
						System.out.println(e);
					}
				}

				return;

			} else
				System.out.println("Inserimento metodo di pagamento  fallito " + ex);
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();

				if (connection != null)
					connection.close();
			} catch (Exception ex) {
				System.out.println(ex);
			}
		}

		try {
			preparedStatement.close();

			insertSQL = "INSERT INTO " + TABLE_NAME2 + " (utente,metodo_di_pagamento) VALUES (?, ?)";
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setInt(2, PaymentMethod.getId());
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			System.out.print("could not update table " + TABLE_NAME2 + " to reflect changes");
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();

				if (connection != null)
					connection.close();
			} catch (Exception ex) {
				System.out.println(ex);
			}
		}

	}

}
