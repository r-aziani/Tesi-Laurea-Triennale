package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import bean.Calendario;

public class DisponibilitaDAO {

	public static int isPrenotabile(Connection con, LocalDate data, LocalTime ora, int id_campo) {
		try {
			String sql = "SELECT ora_inizio, ora_fine, tariffa"
					+ "	FROM public.\"Disponibilita\""
					+ "	WHERE data = ? AND id_campo = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setDate(1, Date.valueOf(data));
			st.setInt(2, id_campo);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				LocalTime ora_inizio = LocalTime.parse(rs.getString(1));
				LocalTime ora_fine = LocalTime.parse(rs.getString(2));
				
				if((ora_inizio.compareTo(ora) <= 0) && (ora_fine.compareTo(ora) == 1)) {
					int tariffa = rs.getInt(3);
					rs.close();
					st.close();
					return tariffa;
				}
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static LocalTime[] getFinestraDisponibilita(Connection con, Calendario calendario) {
		LocalTime[] toReturn = new LocalTime[2];
		toReturn[0] = LocalTime.parse("23:59:59");
		toReturn[1] = LocalTime.parse("00:00:00");
		
		for(int i = 0; i < 3; i++) {
			try {
				String sql = "SELECT ora_inizio, ora_fine "
						+ "FROM public.\"Disponibilita\" "
						+ "WHERE data = ? AND id_campo = ?;";
				PreparedStatement st = con.prepareStatement(sql);
				st.setDate(1, Date.valueOf(calendario.getData(i)));
				st.setInt(2, calendario.getId_campo());
				ResultSet rs = st.executeQuery();
				
				while(rs.next()) {
					if(toReturn[0].compareTo(LocalTime.parse(rs.getString(1))) == 1)
						toReturn[0] = LocalTime.parse(rs.getString(1));
					if(toReturn[1].compareTo(LocalTime.parse(rs.getString(2))) == -1)
						toReturn[1] = LocalTime.parse(rs.getString(2));
				}
				rs.close();
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return toReturn;
	}
	
	public static int getTariffa(Connection con, int id_campo, LocalDate data, LocalTime ora) {
		int tariffa = -1;
		try {
			String sql = "SELECT tariffa FROM public.\"Disponibilita\" "
					   + "WHERE data = ? AND id_campo = ? AND ora_inizio <= ? AND ora_fine >= ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setDate(1, Date.valueOf(data));
			st.setInt(2, id_campo);
			st.setTime(3, Time.valueOf(ora));
			st.setTime(4, Time.valueOf(ora));
			
			ResultSet rs = st.executeQuery();
			rs.next();
			tariffa = rs.getInt(1);
			rs.close();
			st.close();
			return tariffa;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return tariffa;
		}
	}
	
	public static void deleteUpdate(Connection con, int id_campo, String data) {
		try {
			String sql = "DELETE FROM public.\"Disponibilita\" "
					   + "WHERE id_campo = ? AND data = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id_campo);
			st.setDate(2, Date.valueOf(LocalDate.parse(data)));
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static int getNewId(Connection con) {
		int id = -1;
		try {
			String sql = "SELECT MAX(id) FROM public.\"Disponibilita\";";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			rs.next();
			id = rs.getInt(1) + 1;
			rs.close();
			st.close();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return id;
		}
	}
	
	public static int getTariffaByTime(String ora_inizio, String[] tariffa) {
		int index = Integer.parseInt(ora_inizio.split(":")[0]);
		return Integer.parseInt(tariffa[index]);
	}
	
	public static void insertUpdate(Connection con, int id_campo, String data, String[] noDelete,
									String[] toAdd, String[] tariffa) {
		if(noDelete != null) {
			try {
				for(int i = 0; i < noDelete.length; i++) {
					String sql = "INSERT INTO public.\"Disponibilita\"("
							+ "	id, data, ora_inizio, ora_fine, tariffa, id_campo)"
							+ "	VALUES (?, ?, ?, ?, ?, ?);";
					PreparedStatement st = con.prepareStatement(sql);
					
					LocalTime ora_inizio = LocalTime.parse(noDelete[i].concat(":00"));
					LocalTime ora_fine = ora_inizio.plusHours(1);
					int currTariffa = getTariffaByTime(noDelete[i], tariffa);
					
					st.setInt(1, getNewId(con));
					st.setDate(2, Date.valueOf(data));
					st.setTime(3, Time.valueOf(ora_inizio));
					st.setTime(4, Time.valueOf(ora_fine));
					st.setInt(5, currTariffa);
					st.setInt(6, id_campo);
					
					st.executeUpdate();
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(toAdd != null) {
			try {
				for(int i = 0; i < toAdd.length; i++) {
					String sql = "INSERT INTO public.\"Disponibilita\"("
							+ "	id, data, ora_inizio, ora_fine, tariffa, id_campo)"
							+ "	VALUES (?, ?, ?, ?, ?, ?);";
					PreparedStatement st = con.prepareStatement(sql);
					
					LocalTime ora_inizio = LocalTime.parse(toAdd[i].concat(":00"));
					LocalTime ora_fine = ora_inizio.plusHours(1);
					int currTariffa = getTariffaByTime(toAdd[i], tariffa);
					
					st.setInt(1, getNewId(con));
					st.setDate(2, Date.valueOf(data));
					st.setTime(3, Time.valueOf(ora_inizio));
					st.setTime(4, Time.valueOf(ora_fine));
					st.setInt(5, currTariffa);
					st.setInt(6, id_campo);
					
					st.executeUpdate();
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
