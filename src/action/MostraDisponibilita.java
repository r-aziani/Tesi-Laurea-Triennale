package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class MostraDisponibilita extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
		/*
		Calendario calendario = (Calendario) form;
		System.out.println(calendario.getId_campo());
		*/
		System.out.println("*** Action MostraDisponibilita ***");
	
		return mapping.findForward("success");
	}
}