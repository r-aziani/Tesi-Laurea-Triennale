package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class MenuAreaRiservata extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {

		System.out.println("*** Action MenuAreaRiservata ***");
	
		bean.MenuAreaRiservata scelta = (bean.MenuAreaRiservata) form;
		switch(scelta.getValue()) {
			case 1: return mapping.findForward("elencoPrenotazioni");
			//break;
			case 2: return mapping.findForward("eliminaPrenotazioni");
			//break;
			case 3: return mapping.findForward("modificaDisponibilita");
			//break;
		}
	
		return mapping.findForward("elencoPrenotazioni");
		//return mapping.findForward("success");
	}
}