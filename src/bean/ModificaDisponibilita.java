package bean;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

@SuppressWarnings("serial")
public class ModificaDisponibilita extends ActionForm {

	private String data;
	private int id_campo;
	private String[] toAdd;
	private String[] noDelete;
	private String[] tariffa;
	
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("Resetting form...");
        toAdd = null;
        noDelete = null;
        tariffa = null;
    }
	
	public ModificaDisponibilita() {}
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getId_campo() {
		return id_campo;
	}
	public void setId_campo(int id_campo) {
		this.id_campo = id_campo;
	}
	public String[] getToAdd() {
		return toAdd;
	}
	public void setToAdd(String[] toAdd) {
		this.toAdd = toAdd;
	}
	public String[] getNoDelete() {
		return noDelete;
	}
	public void setNoDelete(String[] noDelete) {
		this.noDelete = noDelete;
	}
	public String[] getTariffa() {
		return tariffa;
	}
	public void setTariffa(String[] tariffa) {
		this.tariffa = tariffa;
	}
}
