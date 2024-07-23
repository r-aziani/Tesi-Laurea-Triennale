package test;

import static org.junit.Assert.assertEquals;
import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import bean.Campo;
import dao.CampoDAO;
import dao.Database;

public class CampoDAOTest {

	@Test
	public void size() throws SQLException {
		Connection con = new Database().getCon();
		assertEquals(CampoDAO.size(con), 3);
		con.close();
	}
	
	@Test
	public void getCampo() throws SQLException {
		@SuppressWarnings("unused")
		Campo c = new Campo(1, 1, "nome");
		
		Connection con = new Database().getCon();
		Campo campo1 = CampoDAO.getCampo(con, 0);
		assertEquals(campo1.getId(), 1);
		assertEquals(campo1.getGiocatori(), 10);
		assertEquals(campo1.getNome(), "Campo a 5");
		Campo campo2 = CampoDAO.getCampo(con, 1);
		assertEquals(campo2.getId(), 2);
		assertEquals(campo2.getGiocatori(), 12);
		assertEquals(campo2.getNome(), "Campo a 6");
		Campo campo3 = CampoDAO.getCampo(con, 2);
		assertEquals(campo3.getId(), 3);
		assertEquals(campo3.getGiocatori(), 14);
		assertEquals(campo3.getNome(), "Campo a 7");
		con.close();
	}
	
	@Test
	public void getNomeById() {
		Connection con = new Database().getCon();
		assertEquals(CampoDAO.getNomeById(con, 1), "Campo a 5");
		assertEquals(CampoDAO.getNomeById(con, 2), "Campo a 6");
		assertEquals(CampoDAO.getNomeById(con, 3), "Campo a 7");
	}
	
	
}








