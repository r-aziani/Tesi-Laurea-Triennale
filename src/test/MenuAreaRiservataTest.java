package test;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import servletunit.struts.MockStrutsTestCase;

public class MenuAreaRiservataTest extends MockStrutsTestCase {
	
	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
    @Test
    public void testExecuteElencoPrenotazioni() {
    	addRequestParameter("value", "1");

        setRequestPathInfo("/menuAreaRiservata");

        actionPerform();
        
        verifyForward("elencoPrenotazioni");
        verifyTilesForward("elencoPrenotazioni", "tiles.areaRiservata");
    }
    
    @Test
    public void testExecuteEliminaPrenotazioni() {
    	addRequestParameter("value", "2");

        setRequestPathInfo("/menuAreaRiservata");

        actionPerform();
        
        verifyForward("eliminaPrenotazioni");
        verifyTilesForward("eliminaPrenotazioni", "tiles.areaRiservataElimina");
    }
    
    @Test
    public void testExecuteModificaDisponibilita() {
    	addRequestParameter("value", "3");

        setRequestPathInfo("/menuAreaRiservata");

        actionPerform();
        
        verifyForward("modificaDisponibilita");
        verifyTilesForward("modificaDisponibilita", "tiles.areaRiservataDisponibilita");
    }

}
