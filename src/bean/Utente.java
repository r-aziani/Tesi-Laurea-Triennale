package bean;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class Utente extends ActionForm {

	private String username;
	private String pwd;
	
	public Utente() {}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
