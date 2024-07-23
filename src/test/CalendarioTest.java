package test;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;

import org.junit.jupiter.api.Test;

import bean.Calendario;

class CalendarioTest {

	@Test
	void testInizializzaDate() {
		Calendario calendario = new Calendario();
		calendario.inizializzaDate();
		ZoneId zoneRome = ZoneId.of("Europe/Rome");
		LocalDate currentDate = LocalDate.now(zoneRome);
		
		assertEquals(currentDate, calendario.getData(0));
		assertEquals(currentDate.plusDays(1), calendario.getData(1));
		assertEquals(currentDate.plusDays(2), calendario.getData(2));
		assertEquals(null, calendario.getData(3));
		
		
		String giorno = currentDate.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ITALIAN);
		giorno = giorno.substring(0, 1).toUpperCase().concat(giorno.substring(1));
		assertEquals(giorno, calendario.getGiorno(0));
		
		giorno = currentDate.plusDays(1).getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ITALIAN);
		giorno = giorno.substring(0, 1).toUpperCase().concat(giorno.substring(1));
		assertEquals(giorno, calendario.getGiorno(1));
		
		giorno = currentDate.plusDays(2).getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ITALIAN);
		giorno = giorno.substring(0, 1).toUpperCase().concat(giorno.substring(1));
		assertEquals(giorno, calendario.getGiorno(2));
		
		assertEquals(null, calendario.getGiorno(3));
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		assertEquals(currentDate.format(formatter), calendario.getDataFormattata(0));
		assertEquals(currentDate.plusDays(1).format(formatter), calendario.getDataFormattata(1));
		assertEquals(currentDate.plusDays(2).format(formatter), calendario.getDataFormattata(2));
		assertEquals(null, calendario.getDataFormattata(3));
	}
}
