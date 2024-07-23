package action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.Prenotazione;
import dao.Database;
import dao.PrenotazioneDAO;

public class ControllaCodice extends Action {

@Override
public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {	
	
	System.out.println("*** Action ControllaCodice ***");
	
	Prenotazione p = (Prenotazione) form;
	Connection con = new Database().getCon();
	if(PrenotazioneDAO.esistePrenotazione(con, p.getId())) {
		con.close();
		return mapping.findForward("success");
	} else {
		con.close();
		return mapping.findForward("fail");
	}
	
}
}