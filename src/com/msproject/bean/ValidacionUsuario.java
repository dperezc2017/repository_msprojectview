package com.msproject.bean;

import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator(value = "repeatPasswordValidator")
public class ValidacionUsuario {
	public void validate(FacesContext fc, UIComponent component, Object value) 
	throws ValidatorException {
	String attribute = (String) component.getAttributes().get("password");
	if (!value.equals(attribute)) {
	FacesMessage message = new FacesMessage();
	message.setSummary("La contraseña no coincide");
	message.setSeverity(FacesMessage.SEVERITY_ERROR);
	throw new ValidatorException(message);
	}
	}	
	

}
