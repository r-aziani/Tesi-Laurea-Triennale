package test;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import servletunit.struts.MockStrutsTestCase;

public class MostraDisponibilitaTest extends MockStrutsTestCase {
	
	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
    @Test
    public void testExecuteSuccess() {
    	
        setRequestPathInfo("/mostraDisponibilita");

        actionPerform();
        
        verifyForward("success");
        verifyTilesForward("success", "tiles.mostraDisponibilita");
    }

}
