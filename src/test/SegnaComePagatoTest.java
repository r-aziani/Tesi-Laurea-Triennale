package test;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import servletunit.struts.MockStrutsTestCase;

public class SegnaComePagatoTest extends MockStrutsTestCase {
    
    @BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
    
	@Test
    public void testExecute() throws Exception {
    	addRequestParameter("id", "id");
    	
    	setRequestPathInfo("/segnaComePagato");
    	
    	actionPerform();
    	    	
    	verifyForward("success");
    	verifyTilesForward("success", "tiles.areaRiservata");
    }
    
    
}
