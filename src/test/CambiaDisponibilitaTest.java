package test;

import java.sql.Connection;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import dao.Database;
import servletunit.struts.MockStrutsTestCase;

public class CambiaDisponibilitaTest extends MockStrutsTestCase {
	
	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
    
	@Test
    public void testExecute() throws Exception {
        String data = "1990-01-10";
        String[] noDelete = {"10:00", "11:00"};
        String[] toAdd = {"12:00", "13:00"};
        String[] tariffa = new String[24];
        for (int i = 0; i < 24; i++) {
            tariffa[i] = String.valueOf(i * 10);
        }
        addRequestParameter("id_campo", "1");
        addRequestParameter("data", data);
        addRequestParameter("noDelete", noDelete);
        addRequestParameter("toAdd", toAdd);
        addRequestParameter("tariffa", tariffa);
    	
    	setRequestPathInfo("/cambiaDisponibilita");
    	
    	actionPerform();
    	    	
    	verifyForward("success");
    	verifyTilesForward("success", "tiles.areaRiservataDisponibilita");
    	
    	Connection con = new Database().getCon();
    	con.prepareStatement("DELETE FROM public.\"Disponibilita\" WHERE data = '1990-01-10';").executeUpdate();
    	con.close();
	}
}
