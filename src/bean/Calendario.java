package bean;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class Calendario extends ActionForm {
	
	private int id_campo;
	private int offset;
	private LocalDate dataOggi;
	private LocalDate dataDomani;
	private LocalDate dataDopoDomani;
	private String id;
	
	public Calendario() {}
	
	public void inizializzaDate() {
		ZoneId zoneRome = ZoneId.of("Europe/Rome");
		LocalDate currentDate = LocalDate.now(zoneRome);
		
		dataOggi = currentDate.plusDays(offset);
		dataDomani = currentDate.plusDays(offset + 1);
		dataDopoDomani = currentDate.plusDays(offset + 2);
	}

	public String getGiorno(int i) {
		String giorno;
		switch(i) {
			case 0: giorno = dataOggi.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ITALIAN);
			break;
			case 1: giorno = dataDomani.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ITALIAN);
			break;
			case 2: giorno = dataDopoDomani.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ITALIAN);
			break;
			default: return null;
		}
		return giorno.substring(0, 1).toUpperCase().concat(giorno.substring(1));
	}
	
	public LocalDate getData(int i) {
		LocalDate data;
		
		switch(i) {
			case 0: data = dataOggi;
			break;
			case 1: data = dataDomani;
			break;
			case 2: data = dataDopoDomani;
			break;
			default: data = null;
			break;
		}
		return data;
	}
	
	public String getDataFormattata(int i) {
		String data;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		
		switch(i) {
			case 0: data = dataOggi.format(formatter);
			break;
			case 1: data = dataDomani.format(formatter);
			break;
			case 2: data = dataDopoDomani.format(formatter);
			break;
			default: return null;
		}
		return data;
	}
	
	
	
	public int getId_campo() {
		return id_campo;
	}
	public void setId_campo(int id_campo) {
		this.id_campo = id_campo;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
