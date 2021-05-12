package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AddressDao {
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

	public synchronized static List<AddressBean> getAddresses(UserBean user) {
		List<AddressBean> addresses = new LinkedList<AddressBean>();
		PreparedStatement preparedStatement = null;
		String SearchQuery = "Select" + TABLE_NAME3 + ".*" + "FROM" + TABLE_NAME + "Join" + TABLE_NAME2
				+ " ON username=?" + "Join" + TABLE_NAME3 + " ON " + TABLE_NAME2 + ".via=" + TABLE_NAME3 + ".via"
				+ " AND " + TABLE_NAME2 + ".cap=" + TABLE_NAME3 + ".cap" + "AND " + TABLE_NAME2 + ".numero_civico="
				+ TABLE_NAME3 + ".numero_civico";

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
}
