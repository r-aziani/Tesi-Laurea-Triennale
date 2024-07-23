package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import org.junit.Test;
import bean.Prenotazione;
import dao.Database;
import dao.PrenotazioneDAO;

public class PrenotazioneDAOTest {

	@Test
	public void esistePrenotazione() throws SQLException {
		Connection con = new Database().getCon();
		assertEquals(PrenotazioneDAO.esistePrenotazione(con, 1, LocalDate.parse("2024-05-13"), LocalTime.parse("19:00:00")), true);
		assertEquals(PrenotazioneDAO.esistePrenotazione(con, 1, LocalDate.parse("2024-05-13"), LocalTime.parse("18:00:00")), false);
		assertEquals(PrenotazioneDAO.esistePrenotazione(con, 1, LocalDate.parse("2024-05-14"), LocalTime.parse("19:00:00")), false);
		con.close();
	}
	
	@Test
	public void esistePrenotazioneId() throws SQLException {
		Connection con = new Database().getCon();
		assertEquals(PrenotazioneDAO.esistePrenotazione(con, "E3493541AB2A"), true);
		assertEquals(PrenotazioneDAO.esistePrenotazione(con, "fail"), false);
		con.close();
	}
	
	@Test
	public void generaId() throws SQLException {
		Connection mockConnection = mock(Connection.class);
		Statement mockStatement = mock(Statement.class);
		ResultSet mockResultSet = mock(ResultSet.class);
		
		when(mockConnection.createStatement()).thenReturn(mockStatement);
		when(mockStatement.executeQuery(anyString())).thenReturn(mockResultSet);
		
		ArrayList<String> existingIDs = new ArrayList<>();
        existingIDs.add("EXISTINGID1");
        existingIDs.add("EXISTINGID2");
        existingIDs.add("EXISTINGID3");
		
		when(mockResultSet.next()).thenAnswer(invocation -> {
            if (!existingIDs.isEmpty()) {
                return true;
            }
            return false;
        });
		
        when(mockResultSet.getString(1)).thenAnswer(invocation -> {
            return existingIDs.remove(0);
        });
        
        String generatedId = PrenotazioneDAO.generaId(mockConnection);

        assertFalse(existingIDs.contains(generatedId));
        assertNotNull(generatedId);
        assertEquals(12, generatedId.length());

        verify(mockResultSet).close();
        verify(mockStatement).close();
	}
	
	@Test
	public void aggiungiPrenotazione() throws SQLException {
	    Connection mockConnection = mock(Connection.class);
	    PreparedStatement mockStatement = mock(PreparedStatement.class);
	    ResultSet mockResultSet = mock(ResultSet.class);
	    Statement mockSt = mock(Statement.class);
	    PreparedStatement mockStatement2 = mock(PreparedStatement.class);
	    
	    when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement, mockStatement2);
	    when(mockStatement.executeQuery()).thenReturn(mockResultSet);
	    when(mockResultSet.next()).thenReturn(false);
	    when(mockConnection.createStatement()).thenReturn(mockSt);
	    when(mockSt.executeQuery(anyString())).thenReturn(mockResultSet);
	   
	    Prenotazione mockPrenotazione = mock(Prenotazione.class);
	    when(mockPrenotazione.getId_campo()).thenReturn(1);
	    when(mockPrenotazione.getData()).thenReturn("2024-01-10");
	    when(mockPrenotazione.getOrario()).thenReturn("10:00");
	    when(mockPrenotazione.getTariffa()).thenReturn(20);
	    when(mockPrenotazione.getNome()).thenReturn("nome");
	    when(mockPrenotazione.getCognome()).thenReturn("cognome");
	    when(mockPrenotazione.getEmail()).thenReturn("email");
	    when(mockPrenotazione.getTelefono()).thenReturn("1234");
	    
	    PrenotazioneDAO.aggiungiPrenotazione(mockConnection, mockPrenotazione);

	    verify(mockStatement).setInt(1, 1);
	    verify(mockStatement).setDate(2, Date.valueOf("2024-01-10"));
	    verify(mockStatement).setTime(3, Time.valueOf("10:00:00"));
	    
	    verify(mockStatement2).setInt(2, mockPrenotazione.getId_campo());
	    verify(mockStatement2).setDate(3, Date.valueOf(LocalDate.parse(mockPrenotazione.getData())));
	    verify(mockStatement2).setTime(4, Time.valueOf(LocalTime.parse(mockPrenotazione.getOrario().concat(":00"))));
	    verify(mockStatement2).setInt(5, mockPrenotazione.getTariffa());
	    verify(mockStatement2).setString(6, mockPrenotazione.getNome());
	    verify(mockStatement2).setString(7, mockPrenotazione.getCognome());
	    verify(mockStatement2).setString(8, mockPrenotazione.getEmail());
	    verify(mockStatement2).setString(9, mockPrenotazione.getTelefono());
	    
	    verify(mockResultSet, times(2)).close();
        verify(mockStatement).close();
        verify(mockStatement2).close();
        verify(mockStatement2).executeUpdate();
	}
	
	@Test
	public void getDataFormattata() {
		String dataFormattata = PrenotazioneDAO.getDataFormattata("2024-01-10");
		assertEquals(dataFormattata, "10/01/2024");
	}
	
	@Test
	public void getDaPagare() throws SQLException {
		Connection mockConnection = mock(Connection.class);
		PreparedStatement mockSt = mock(PreparedStatement.class);
		ResultSet mockResultSet = mock(ResultSet.class);
		
		when(mockConnection.prepareStatement(anyString())).thenReturn(mockSt);
		when(mockSt.executeQuery()).thenReturn(mockResultSet);
		
		PrenotazioneDAO.getDaPagare(mockConnection);
		
		verify(mockSt).executeQuery();
		verify(mockSt).closeOnCompletion();
	}
	
	@Test
	public void segnaComePagato() throws SQLException {
		Connection mockConnection = mock(Connection.class);
		PreparedStatement mockSt = mock(PreparedStatement.class);
		
		when(mockConnection.prepareStatement(anyString())).thenReturn(mockSt);
		
		PrenotazioneDAO.segnaComePagato(mockConnection, "id");
		
		verify(mockSt).setString(1, "id");
		verify(mockSt).executeUpdate();
		verify(mockSt).close();
	}
	
	@Test
	public void generaCodiceConferma() {
		String codice = PrenotazioneDAO.generaCodiceConferma();
		Integer n = Integer.parseInt(codice);
		assertTrue(n >= 1000);
		assertTrue(n < 10000);
	}
	
	@Test
	public void eliminaPrenotazione() throws SQLException {
		Connection mockConnection = mock(Connection.class);
		PreparedStatement mockSt = mock(PreparedStatement.class);
		
		when(mockConnection.prepareStatement("DELETE FROM "
				+ "public.\"Prenotazioni\" WHERE id = ?")).thenReturn(mockSt);
		
		PrenotazioneDAO.eliminaPrenotazione(mockConnection, "id");
		
		verify(mockSt).setString(1, "id");
		verify(mockSt).executeUpdate();
		verify(mockSt).close();
	}
}




















