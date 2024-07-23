package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteDAO {

	public static boolean login(Connection con, String user, String pwd) {
		try {
			String sql = "SELECT * FROM public.\"Admin\";";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				if(rs.getString(1).equals(user) && rs.getString(2).equals(pwd)) {
					rs.close();
					st.close();
					return true;
				}
			}
			rs.close();
			st.close();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
