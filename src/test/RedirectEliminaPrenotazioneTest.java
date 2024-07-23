package test;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import servletunit.struts.MockStrutsTestCase;

public class RedirectEliminaPrenotazioneTest extends MockStrutsTestCase {
	
	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
    @Test
    public void testExecuteSuccess() {

        setRequestPathInfo("/redirectEliminaPrenotazione");

        actionPerform();
        
        verifyForward("success");
        verifyTilesForward("success", "tiles.prenotazioneEliminata");
    }

}
