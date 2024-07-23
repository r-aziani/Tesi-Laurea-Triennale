package action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.Utente;
import dao.Database;
import dao.UtenteDAO;

public class AreaRiservata extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
			HttpServletResponse response)throws Exception {
	
		System.out.println("*** Action AreaRiservata ***");
		Utente utente = (Utente) form;
		
		String username = String.valueOf(utente.getUsername().hashCode());
		String pwd = String.valueOf(utente.getPwd().hashCode());
		Connection con = new Database().getCon();
		
		if(UtenteDAO.login(con, username, pwd)) {
			con.close();
			return mapping.findForward("success");
		} else {
			con.close();
			return mapping.findForward("fail");
		}	
	}
}