package it.unisa.model;

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

public class AddressDAO {
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
	private static final String TABLE_NAME2 = "indirizzo";
	private static final String TABLE_NAME3 = "indirizzo_spedizione";

	public synchronized List<AddressBean> getAddresses(UserBean user) {
		List<AddressBean> addresses = new LinkedList<AddressBean>();
		PreparedStatement preparedStatement = null;
		String SearchQuery = "Select" + TABLE_NAME3 + ".*" + "FROM" + TABLE_NAME + "Join" + TABLE_NAME2
				+ " ON username=utente" + "Join" + TABLE_NAME3 + " ON " + TABLE_NAME2 + ".via=" + TABLE_NAME3 + ".via"
				+ " AND " + TABLE_NAME2 + ".cap=" + TABLE_NAME3 + ".cap" + "AND " + TABLE_NAME2 + ".numero_civico="
				+ TABLE_NAME3 + ".numero_civico"
				+"WHERE";

		Connection connection = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SearchQuery);
			preparedStatement.setString(1, user.getUsername());

			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				AddressBean bean = new AddressBean();
				bean.setVia(rs.getString("via"));
				bean.setNumero_civico(rs.getInt("numero_civico"));
				bean.setCap(rs.getInt("cap"));
				bean.setCittà(rs.getString("città"));
				bean.setProvincia(rs.getString("provincia"));
				addresses.add(bean);

			}

		}

		catch (Exception ex) {
			System.out.println("Inserimento ordine fallito " + ex);
		}

		return addresses;

	}

	public synchronized void doSave(UserBean user, AddressBean address) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME3
				+ " (via,numero_civico,cap,città,provincia ) VALUES (?, ?, ?,?,?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, address.getVia());
			preparedStatement.setInt(2, address.getNumero_civico());
			preparedStatement.setInt(3, address.getCap());
			preparedStatement.setString(4, address.getCittà());
			preparedStatement.setString(5, address.getProvincia());
			preparedStatement.executeUpdate();

		} catch (SQLException ex) {
			if (ex.getErrorCode() == 1062) {
				System.out.println("Indirizzo già esistente nel DB " + ex);
				try {
					preparedStatement.close();

					insertSQL = "INSERT INTO " + TABLE_NAME2 + " (via,utente,cap,numero_civico) VALUES (?, ?, ?,?)";
					preparedStatement = connection.prepareStatement(insertSQL);
					preparedStatement.setString(1, address.getVia());
					preparedStatement.setString(2, user.getUsername());
					preparedStatement.setInt(3, address.getCap());
					preparedStatement.setInt(4, address.getNumero_civico());
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
				System.out.println("Inserimento indirizzo fallito " + ex);
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
			connection = ds.getConnection();
			insertSQL = "INSERT INTO " + TABLE_NAME2 + " (via,utente,cap,numero_civico) VALUES (?, ?, ?,?)";
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, address.getVia());
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setInt(3, address.getCap());
			preparedStatement.setInt(4, address.getNumero_civico());
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
