package bean;

import java.time.LocalDate;
import java.time.LocalTime;

public class Disponibilita {

	private int id;
	private LocalDate data;
	private LocalTime ora_inizio;
	private LocalTime ora_fine;
	private int tariffa;
	private int id_campo;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	public LocalTime getOra_inizio() {
		return ora_inizio;
	}
	public void setOra_inizio(LocalTime ora_inizio) {
		this.ora_inizio = ora_inizio;
	}
	public LocalTime getOra_fine() {
		return ora_fine;
	}
	public void setOra_fine(LocalTime ora_fine) {
		this.ora_fine = ora_fine;
	}
	public int getTariffa() {
		return tariffa;
	}
	public void setTariffa(int tariffa) {
		this.tariffa = tariffa;
	}
	public int getId_campo() {
		return id_campo;
	}
	public void setId_campo(int id_campo) {
		this.id_campo = id_campo;
	}
	
}