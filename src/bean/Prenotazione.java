package bean;

import java.time.LocalDate;
import java.time.LocalTime;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class Prenotazione extends ActionForm {

	private String id;
	private int id_campo;
	private LocalDate data;
	private LocalTime orario;
	private int tariffa;
	private String nome;
	private String cognome;
	private String email;
	private String telefono;
	private boolean pagato;
	private String codiceConferma;
	private String inputCodiceConferma;
	private String idToDelete;
	
	public Prenotazione() {}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getId_campo() {
		return id_campo;
	}
	public void setId_campo(int id_campo) {
		this.id_campo = id_campo;
	}
	public String getData() {
		return data.toString();
	}
	public void setData(String data) {
		this.data = LocalDate.parse(data);
	}
	public String getOrario() {
		return orario.toString();
	}
	public void setOrario(String orario) {
		this.orario = LocalTime.parse(orario);
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public boolean isPagato() {
		return pagato;
	}
	public void setPagato(boolean pagato) {
		this.pagato = pagato;
	}
	public int getTariffa() {
		return tariffa;
	}
	public void setTariffa(int tariffa) {
		this.tariffa = tariffa;
	}
	public String getCodiceConferma() {
		return codiceConferma;
	}
	public void setCodiceConferma(String codiceConferma) {
		this.codiceConferma = codiceConferma;
	}
	public String getInputCodiceConferma() {
		return inputCodiceConferma;
	}
	public void setInputCodiceConferma(String inputCodiceConferma) {
		this.inputCodiceConferma = inputCodiceConferma;
	}
	public String getIdToDelete() {
		return idToDelete;
	}
	public void setIdToDelete(String idToDelete) {
		this.idToDelete = idToDelete;
	}
}
