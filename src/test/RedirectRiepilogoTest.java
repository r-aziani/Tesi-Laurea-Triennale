package test;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import servletunit.struts.MockStrutsTestCase;

public class RedirectRiepilogoTest extends MockStrutsTestCase {
	
	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
    @Test
    public void testExecuteSuccess() {

        setRequestPathInfo("/redirectRiepilogo");

        actionPerform();
        
        verifyForward("success");
        verifyTilesForward("success", "tiles.riepilogo");
    }

}
