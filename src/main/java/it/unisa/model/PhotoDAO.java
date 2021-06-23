package it.unisa.model;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PhotoDAO {
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

	public synchronized List<PhotoBean> getPhotos(ProductBean product) {
		List<PhotoBean> photos = new LinkedList<PhotoBean>();
		PreparedStatement preparedStatement = null;
		String SearchQuery = "Select foto.* FROM foto Join articolo ON " + "foto.articolo=articolo.id "
				+ " WHERE articolo.id = " + product.getId();

		System.out.print(SearchQuery);
		Connection connection = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SearchQuery);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				PhotoBean bean = new PhotoBean();
				Blob blob = rs.getBlob("foto");
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();

				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();
				bean.setBase64image(base64Image);
				bean.setId(rs.getInt("id"));
				bean.setArticolo(rs.getInt("articolo"));
				photos.add(bean);

			}

		}

		catch (Exception ex) {
			System.out.println(ex);
		}

		return photos;

	}

}
