package test;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import org.junit.Test;

import bean.Calendario;
import dao.Database;
import dao.DisponibilitaDAO;

public class DisponibilitaDAOTest {
	
	@Test
	public void isPrenotabile() throws SQLException {
		Connection con = new Database().getCon();
		assertEquals(DisponibilitaDAO.isPrenotabile(con, LocalDate.parse("1995-01-01"), 
				LocalTime.parse("10:00:00"), 1), 1);
		con.close();
	}
	
	@Test
	public void getTariffa() throws SQLException {
		Connection con = new Database().getCon();
		assertEquals(DisponibilitaDAO.getTariffa(con, 1, LocalDate.parse("1995-01-01"),
				LocalTime.parse("10:00:00")), 1);
		con.close();
	}
	
	@Test
    public void testDeleteUpdate() throws SQLException {
        Connection mockConnection = mock(Connection.class);
        PreparedStatement mockStatement = mock(PreparedStatement.class);
        
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);

        DisponibilitaDAO.deleteUpdate(mockConnection, 123, "2024-05-30");
        
        verify(mockConnection).prepareStatement("DELETE FROM public.\"Disponibilita\" WHERE id_campo = ? AND data = ?;");
        verify(mockStatement).setInt(1, 123);
        verify(mockStatement).setDate(2, java.sql.Date.valueOf("2024-05-30"));
        verify(mockStatement).executeUpdate();
        verify(mockStatement).close();
    }
	
	@Test
    public void testGetNewId() throws SQLException {
        Connection mockConnection = mock(Connection.class);
        PreparedStatement mockStatement = mock(PreparedStatement.class);
        ResultSet mockResultSet = mock(ResultSet.class);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt(1)).thenReturn(10);

        int newId = DisponibilitaDAO.getNewId(mockConnection);

        verify(mockConnection).prepareStatement("SELECT MAX(id) FROM public.\"Disponibilita\";");
        verify(mockStatement).executeQuery();
        verify(mockResultSet).close();
        verify(mockStatement).close();
        assertEquals(11, newId);
    }
	
	@Test
    public void testGetTariffaByTime() {
        String oraInizio = "12:00:00";
        String[] tariffa = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100", "110", "120", "130", "140", "150", "160", "170", "180", "190", "200", "210", "220", "230"};
        
        int result = DisponibilitaDAO.getTariffaByTime(oraInizio, tariffa);
        
        assertEquals(120, result);
    }
	
	@Test
    public void testInsertUpdate() throws SQLException {
        Connection mockConnection = mock(Connection.class);
        PreparedStatement mockStatement = mock(PreparedStatement.class);
        ResultSet mockResultSet = mock(ResultSet.class);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        
        int id_campo = 1;
        String data = "2024-01-10";
        String[] noDelete = {"10:00", "11:00"};
        String[] toAdd = {"12:00", "13:00"};
        String[] tariffa = new String[24];
        for (int i = 0; i < 24; i++) {
            tariffa[i] = String.valueOf(i * 10);
        }

        DisponibilitaDAO.insertUpdate(mockConnection, id_campo, data, noDelete, toAdd, tariffa);

        verify(mockConnection, times(8)).prepareStatement(anyString());
        verify(mockStatement, times(4)).executeUpdate();
        verify(mockStatement, times(4)).executeQuery();

        verify(mockStatement, times(4)).setInt(eq(1), anyInt());
        verify(mockStatement, times(4)).setDate(eq(2), any(Date.class));
        verify(mockStatement, times(4)).setTime(eq(3), any(Time.class));
        verify(mockStatement, times(4)).setTime(eq(4), any(Time.class));
        verify(mockStatement, times(4)).setInt(eq(5), anyInt());
        verify(mockStatement, times(4)).setInt(eq(6), eq(id_campo));

        verify(mockStatement, times(4)).executeUpdate();
        verify(mockStatement, times(8)).close();
    }
	
	@Test
	public void getFinestraDisponibilita() throws SQLException {
		Connection mockConnection = mock(Connection.class);
        PreparedStatement mockStatement = mock(PreparedStatement.class);
        ResultSet mockResultSet = mock(ResultSet.class);
        Calendario mockCalendario = new Calendario();
        mockCalendario.inizializzaDate();
        
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        
        DisponibilitaDAO.getFinestraDisponibilita(mockConnection, mockCalendario);
        
        verify(mockConnection, times(3)).prepareStatement(anyString());
        verify(mockStatement, times(3)).setDate(eq(1), any(Date.class));
        verify(mockStatement, times(3)).setInt(eq(2), anyInt());
        verify(mockStatement, times(3)).executeQuery();
        verify(mockStatement, times(3)).close();
        verify(mockResultSet, times(3)).close();
	}
}
