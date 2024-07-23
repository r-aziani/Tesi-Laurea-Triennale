package test;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import dao.Database;
import dao.UtenteDAO;

public class UtenteDAOTest {

	@Test
	public void login() throws SQLException {
		Connection con = new Database().getCon();
		assertEquals(UtenteDAO.login(con, String.valueOf("admin".hashCode()), String.valueOf("password".hashCode())), true);
		assertEquals(UtenteDAO.login(con, String.valueOf("fail".hashCode()), String.valueOf("password".hashCode())), false);
		assertEquals(UtenteDAO.login(con, String.valueOf("admin".hashCode()), String.valueOf("fail".hashCode())), false);
		con.close();
	}

}
