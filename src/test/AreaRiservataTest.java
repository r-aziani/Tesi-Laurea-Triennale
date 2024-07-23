package test;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import servletunit.struts.MockStrutsTestCase;

public class AreaRiservataTest extends MockStrutsTestCase {
	
	@BeforeEach
    public void setUp() throws Exception {
        super.setUp();
        setContextDirectory(new java.io.File("WebContent"));
    }
	
    @Test
    public void testExecuteSuccess() {
    	addRequestParameter("username", "admin");
        addRequestParameter("pwd", "password");

        setRequestPathInfo("/areaRiservata");

        actionPerform();
        
        verifyForward("success");
        verifyTilesForward("success", "tiles.areaRiservata");
    }

    @Test
    public void testExecuteFail() throws Exception {
    	addRequestParameter("username", "fail");
        addRequestParameter("pwd", "password");

        setRequestPathInfo("/areaRiservata");

        actionPerform();
        
        verifyForward("fail");
        verifyTilesForward("fail", "tiles.home");
        /*
        ConfigHelper configHelper = new ConfigHelper(getActionServlet().getServletContext(),
        		getRequest(), getResponse()); 
        System.out.println(configHelper.getMapping().findForward("success").getName());  
        */
    	
    	/*
        AreaRiservata action = new AreaRiservata();
        ActionMapping mapping = new ActionMapping();
		ActionForward config = new ActionForward();
		config.setName("fail");
		HttpServletRequestSimulator request = new HttpServletRequestSimulator(null);
		HttpSession session = request.getSession();
		session.setAttribute("username", "admin");
		session.setAttribute("pwd", "password");
		mapping.addForwardConfig(config);
		Utente u = new Utente();
		u.setPwd("password");
		u.setUsername("adminn");
		ActionForward result = action.execute(mapping, u, request, null);
		System.out.println(result.getName());
		*/
    }
}


