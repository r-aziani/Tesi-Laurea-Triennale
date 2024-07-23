package test;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import servletunit.struts.MockStrutsTestCase;

class ControllaCodiceTest extends MockStrutsTestCase {

	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
	@Test
    public void testExecuteSuccess() {
    	addRequestParameter("id", "E3493541AB2A");

        setRequestPathInfo("/controllaCodice");

        actionPerform();
        
        verifyForward("success");
        verifyTilesForward("success", "tiles.gestisciPrenotazione");
    }
	
	@Test
    public void testExecuteFail() {
    	addRequestParameter("id", "fail");

        setRequestPathInfo("/controllaCodice");

        actionPerform();
        
        verifyForward("fail");
        verifyTilesForward("fail", "tiles.codiceNonTrovato");
    }



}
