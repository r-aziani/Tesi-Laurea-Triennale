package action;

import java.sql.Connection;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import bean.Prenotazione;
import dao.CampoDAO;
import dao.Database;
import dao.PrenotazioneDAO;


public class Riepilogo extends Action {

@Override
public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
	
	System.out.println("*** Action Riepilogo ***");
	Prenotazione prenotazione = (Prenotazione) form;
    System.out.println(prenotazione.getCodiceConferma());
    System.out.println(prenotazione.getInputCodiceConferma());
	
	if(prenotazione.getCodiceConferma().equals(prenotazione.getInputCodiceConferma())) {
		Connection con = new Database().getCon();
		
		if(prenotazione.getIdToDelete() != null)
			PrenotazioneDAO.eliminaPrenotazione(con, prenotazione.getIdToDelete());
		
		String id = PrenotazioneDAO.aggiungiPrenotazione(con, prenotazione);
		if(id != null) {
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", true);
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", 587);
			properties.put("mail.smtp.starttls.enable", true);
			properties.put("mail.transport.protocol", "smtp");
			properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
			
			Session session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("noreply.prenotazione.calcio@gmail.com", "yygofwzildmleryv");
				}
			});
			String text = "<div style=\"background: #dbe2ef; color: #112d4e;max-width: 640px;\">"
					//+ "<img src=\"/ProgettoVergine/WebContent/football-pitch.png\" style=\"max-width: 320; margin-left: auto; margin-right: auto; margin-top: 24px;\"><br/>"
					+ "<br/><br/><h3 style=\"margin-left: 16px;\">Prenotazione avvenuta con successo!</h3>"
					+ "<br/><br/>"
					+ "<span style=\"margin-left: 16px;\">Gentile cliente, la tua prenotazione è stata effettuata con successo.</span>"
					+ "<br/>"
					+ "<span style=\"margin-left: 16px;\">Ti ricordiamo che è possibile cancellare la prenotazione fino a 24 ore prima dell'evento.</span>"
					+ "<br/>"
					+ "<h3 style=\"margin-left: 16px;\">RIEPILOGO</h3>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">CODICE PRENOTAZIONE: </span><span>" + id + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">CAMPO: </span><span>" + CampoDAO.getNomeById(con, prenotazione.getId_campo()) + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">TARIFFA: </span><span>" + prenotazione.getTariffa() + " \u20ac</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">DATA: </span><span>" + PrenotazioneDAO.getDataFormattata(prenotazione.getData()) + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">ORARIO: </span><span>" + prenotazione.getOrario() + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">NOME: </span><span>" + prenotazione.getNome() + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">COGNOME: </span><span>" + prenotazione.getCognome() + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">EMAIL: </span><span>" + prenotazione.getEmail() + "</span><br/>"
					+ "<span style=\"margin-left: 16px; font-weight: bold;\">TELEFONO: </span><span>" + prenotazione.getTelefono() + "</span><br/>"
					+ "<br/><br/>"
					+ "<span style=\"margin-left: 16px;\">Ti ringraziamo per aver usato il nostro servizio.\nA presto!</span><br/><br/>"
					+ "</div>";
			
			Message message = new MimeMessage(session);
			message.setSubject("Conferma prenotazione " + id);
			message.setContent(text, "text/html; charset=utf-8");
			
			InternetAddress addressTo = new InternetAddress(prenotazione.getEmail());
			message.setRecipient(Message.RecipientType.TO, addressTo);
			
			Transport.send(message);
			System.out.println("Mail inviata");
			
			con.close();
			HttpSession httpSession = request.getSession();
		    httpSession.setAttribute("prenotazione", prenotazione);
			return mapping.findForward("success");
		}
		else {
			con.close();
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("prenotazione", prenotazione);
			return mapping.findForward("fail");
		}
	} else {
		return mapping.findForward("failCode");
	}
	
	
	
}
}