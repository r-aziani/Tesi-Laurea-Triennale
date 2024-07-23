package test;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import servletunit.struts.MockStrutsTestCase;

class AreaRiservataEliminaTest extends MockStrutsTestCase {

	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
	@Test
	public void test() {
		setRequestPathInfo("/areaRiservataElimina");
		actionPerform();
		verifyForward("success");
		verifyTilesForward("success", "tiles.areaRiservataElimina");
	}

}
