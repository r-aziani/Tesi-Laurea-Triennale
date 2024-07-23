package action;

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

public class ConfermaPrenotazione extends Action {

@Override
public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception {
	
	System.out.println("*** Action ConfermaPrenotazione ***");
	
	Prenotazione p = (Prenotazione) form;
	
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

	Message message = new MimeMessage(session);
	message.setSubject("CODICE CONFERMA");
	String text = "<div style=\"background: #dbe2ef; color: #112d4e;max-width: 640px;\">"
			+ "<br/><h3 style=\"margin-left: 16px;\">Inserisci il codice di accesso per finalizzare la conferma</h3>"
			+ "<div style=\"margin-left: auto; margin-right: auto; border: 2px solid #112d4e; background: #f9f7f7; width: 96px; height: 48px; text-align: center; vertical-align: middle; line-height: 48px;\">"
			+ "<span style=\"font-weight: bold; font-size: 32px;\">" + p.getCodiceConferma() + "</span></div><br/><br/>"
			+ "</div>";
	message.setContent(text, "text/html; charset=utf-8");
	
	InternetAddress addressTo = new InternetAddress(p.getEmail());
	message.setRecipient(Message.RecipientType.TO, addressTo);
	
	Transport.send(message);
	System.out.println("Mail codice conferma inviata");
	
	HttpSession httpSession = request.getSession();
    httpSession.setAttribute("prenotazione", p);
	
	return mapping.findForward("success");
}
}