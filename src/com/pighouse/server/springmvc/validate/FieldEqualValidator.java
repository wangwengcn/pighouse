package com.pighouse.server.springmvc.validate;

import java.lang.reflect.Field;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class FieldEqualValidator implements ConstraintValidator<FieldEqual, Object> {

	private String first;
	private String second;
	
	@Override
	public void initialize(FieldEqual constraintAnnotation) {
		this.first = constraintAnnotation.firstField();
		this.second = constraintAnnotation.secondField();
	}

	@Override
	public boolean isValid(Object object, ConstraintValidatorContext context) {
		Field[] fields = object.getClass().getDeclaredFields();
		String[] names = new String[]{first, second};
		String[] values = new String[]{"",""};
		int i = 0;
		for(Field field : fields)
		{
			for(String name : names)
			{
				if(field.getName().equals(name))
				{
					field.setAccessible(true);
					try {
						String value = (String) field.get(object);
						values[i] = value == null?"":value;
					} catch (Exception e) {
					}
					i++;
				}
			}
			if(i == 2)
			{
				break;
			}
			
		}
		return values[0].equals(values[1]);
	}
	
}
