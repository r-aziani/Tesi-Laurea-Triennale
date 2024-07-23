package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class InserisciDati extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
		/*
		Prenotazione prenotazione = (Prenotazione) form;
		System.out.println(prenotazione.getId_campo());
		System.out.println(prenotazione.getOrario());
		System.out.println(prenotazione.getData());
		*/
		System.out.println("*** Action InserisciDati ***");
	
		return mapping.findForward("success");
	}
}