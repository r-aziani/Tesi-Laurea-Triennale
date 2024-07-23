package action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.ModificaDisponibilita;
import dao.Database;
import dao.DisponibilitaDAO;


public class CambiaDisponibilita extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
	
		System.out.println("*** Action CambiaDisponibilita ***");
	
		Connection con = new Database().getCon();
		ModificaDisponibilita bean = (ModificaDisponibilita) form;
	
		DisponibilitaDAO.deleteUpdate(con, bean.getId_campo(), bean.getData());
		DisponibilitaDAO.insertUpdate(con, bean.getId_campo(), bean.getData(), 
		bean.getNoDelete(), bean.getToAdd(), bean.getTariffa());
	
		return mapping.findForward("success");
	}
}