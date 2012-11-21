package com.pighouse.server.springmvc.validate;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Documented
@Constraint(validatedBy = FieldEqualValidator.class)
@Target({ ANNOTATION_TYPE, TYPE })
@Retention(RUNTIME)
public @interface FieldEqual {
	
	public abstract String message() default "{org.hibernate.validator.constraints.Equal.message}";

	public abstract Class<?>[] groups() default { };

	public abstract Class<? extends Payload>[] payload() default { };
	
	// 如果包含default值，那么调用的时候将不强制你输入此字段
	String firstField();
	String secondField();
	
	 /**
     * Defines several <code>@FieldMatch</code> annotations on the same element
     *
     * @see FieldMatch
     */
    @Target({TYPE, ANNOTATION_TYPE})
    @Retention(RUNTIME)
    @Documented
    @interface List
    {
    	FieldEqual[] value();
    }
}
