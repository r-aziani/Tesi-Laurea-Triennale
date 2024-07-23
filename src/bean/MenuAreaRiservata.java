package bean;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class MenuAreaRiservata extends ActionForm {

	private int value;
	
	public MenuAreaRiservata() {}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
}
