package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

import bean.Prenotazione;

public class PrenotazioneDAO {

	public static boolean esistePrenotazione(Connection con, 
							int id_campo, LocalDate data, LocalTime ora) {
		try {
			String sql = "SELECT id "
					   + "FROM public.\"Prenotazioni\" "
					   + "where id_campo = ? AND data = ? AND ora = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id_campo);
			st.setDate(2, Date.valueOf(data));
			st.setTime(3, Time.valueOf(ora));
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				rs.close();
				st.close();
				return true;
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean esistePrenotazione(Connection con, String id) {
		try {
			String sql = "SELECT * FROM public.\"Prenotazioni\" WHERE id = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				rs.close();
				st.close();
				return true;
			} else {
				rs.close();
				st.close();
				return false;
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static String generaId(Connection con) {
		boolean contiene = true;
		String generatedString = "";

		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT id"
					+ "	FROM public.\"Prenotazioni\";");
	
			ArrayList<String> IDs = new ArrayList<String>();
			while(rs.next()) {
				IDs.add(rs.getString(1));
			}
			
			while(contiene) {
				generatedString = UUID.randomUUID().toString().toUpperCase().replace("-", "").substring(0, 12);
				if(!IDs.contains(generatedString))
					contiene = false;
			}
			rs.close();
			st.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	    return generatedString;
	}
	
	public static String aggiungiPrenotazione(Connection con, Prenotazione p) {
		try {
			String sql = "SELECT id "
					+ "FROM public.\"Prenotazioni\" "
					+ "WHERE id_campo = ? AND data = ? AND ora = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, p.getId_campo());
			st.setDate(2, Date.valueOf(LocalDate.parse(p.getData())));
			st.setTime(3, Time.valueOf(p.getOrario().concat(":00")));
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				rs.close();
				st.close();
				return null;
			}
			rs.close();
			st.close();
			
			
			sql = "INSERT INTO public.\"Prenotazioni\"("
					+ "	id, id_campo, data, ora, tariffa, nome, cognome, email, telefono)"
					+ "	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement st2 = con.prepareStatement(sql);
			
			String id = generaId(con);
			st2.setString(1, id);
			st2.setInt(2, p.getId_campo());
			st2.setDate(3, Date.valueOf(p.getData()));
			st2.setTime(4, Time.valueOf(p.getOrario().concat(":00")));
			st2.setInt(5, p.getTariffa());
			st2.setString(6, p.getNome());
			st2.setString(7, p.getCognome());
			st2.setString(8, p.getEmail());
			st2.setString(9, p.getTelefono());
			
			st2.executeUpdate();
			st2.close();
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static String getDataFormattata (String str) {
		LocalDate data = LocalDate.parse(str);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		return data.format(formatter).toString();
	}
	
	public static ResultSet getDaPagare(Connection con) {
		try {
			String sql = "SELECT * FROM public.\"Prenotazioni\" "
					   + "WHERE pagato = false "
					   + "ORDER BY data, ora;";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			st.closeOnCompletion();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void segnaComePagato(Connection con, String id) {
		try {
			String sql = "UPDATE public.\"Prenotazioni\" "
					   + "SET pagato = true "
					   + "WHERE id = ?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static String generaCodiceConferma() {
		return String.valueOf(ThreadLocalRandom.current().nextInt(1000, 10000));
	}
	
	public static void eliminaPrenotazione(Connection con, String id) {
		try {
			String sql = "DELETE FROM public.\"Prenotazioni\" WHERE id = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	public static int getIdCampoById(Connection con, String id) {
		int idCampo = -1;
		try {
			String sql = "SELECT id_campo FROM public.\"Prenotazioni\" WHERE id = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			rs.next();
			idCampo = rs.getInt(1);
			
			rs.close();
			st.close();
			return idCampo;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idCampo;
	}
	*/
}
