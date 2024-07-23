package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.Campo;

public class CampoDAO {
	
	public static int size(Connection con) {;
		int size = -1;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT (*)"
					+ "	FROM public.\"Campi\";");
			rs.next();
			size = rs.getInt(1);
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return size;
	}

	public static Campo getCampo(Connection con, int i) {
		i++;
		Campo campo = new Campo();
		try {
			String sql = "SELECT * "
					+ "FROM public.\"Campi\" "
					+ "WHERE id = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, i);
			ResultSet rs = st.executeQuery();
			rs.next();
			campo.setId(rs.getInt(1));
			campo.setGiocatori(rs.getInt(2));
			campo.setNome(rs.getString(3));
			
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return campo;
	}
	
	public static String getNomeById(Connection con, int id) {
		String nome = "";
		try {
			String sql = "SELECT nome"
					+ "	FROM public.\"Campi\""
					+ "	WHERE id = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			rs.next();
			nome = rs.getString(1);
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nome;
	}
}






