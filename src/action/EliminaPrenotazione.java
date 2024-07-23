package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.Prenotazione;
import dao.Database;
import dao.PrenotazioneDAO;


public class EliminaPrenotazione extends Action {

@Override
public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
	
	System.out.println("*** Action EliminaPrenotazione ***");
	
	Prenotazione p = (Prenotazione) form;
	Connection con = new Database().getCon();
	
	try {
		String sql = "SELECT ora, data FROM public.\"Prenotazioni\" WHERE id = ?;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getId());
		ResultSet rs = st.executeQuery();
		rs.next();
		
		LocalDateTime timeP = LocalDateTime.of(LocalDate.parse(rs.getString(2)), LocalTime.parse(rs.getString(1)));
		ZoneId zoneRome = ZoneId.of("Europe/Rome");
		LocalDateTime timeNow = LocalDateTime.now(zoneRome);
		Duration differenza = Duration.between(timeNow, timeP);
		
		rs.close();
		st.close();
		if(differenza.toHours() >= 24) {
			PrenotazioneDAO.eliminaPrenotazione(con, p.getId());
			con.close();
			return mapping.findForward("success");
		} else {
			con.close();
			return mapping.findForward("fail");
		}
	} catch (SQLException e) {
		e.printStackTrace();
		con.close();
		return mapping.findForward("fail");
	}
	
}
}
