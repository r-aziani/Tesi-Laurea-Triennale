package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.Prenotazione;


public class RedirectConfermaPrenotazione extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		System.out.println("*** Action RedirectConfermaPrenotazione ***");
	
		HttpSession session = request.getSession();
		Prenotazione p = (Prenotazione) session.getAttribute("prenotazione");
		request.setAttribute("prenotazione", p);
	
		return mapping.findForward("success");
	}
}