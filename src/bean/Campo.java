package bean;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class Campo extends ActionForm {

	private int id;
	private int giocatori;
	private String nome;
	
	public Campo() {}
	
	public Campo(int id, int giocatori, String nome) {
		this.id = id;
		this.giocatori = giocatori;
		this.nome = nome;
	}
	
	public int getId() {
		return id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public int getGiocatori() {
		return giocatori;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setGiocatori(int giocatori) {
		this.giocatori = giocatori;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
}
