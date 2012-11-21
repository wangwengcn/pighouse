package com.pighouse.server.springmvc.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class FieldCompareValidator<A> implements ConstraintValidator<FieldCompare, Object> {

	private String fieldToBeCompared;
	
	@Override
	public void initialize(FieldCompare arg0) {
		fieldToBeCompared = arg0.fieldToBeCompared();
	}

	@Override
	public boolean isValid(Object arg0, ConstraintValidatorContext arg1) {
		return arg0.toString().equals(fieldToBeCompared);
	}

}
