/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Adelaid
 */
public class MailValidation {
    private static Pattern pattern;
	private static Matcher matcher;
 
	private static final String EMAIL_PATTERN = 
		"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
 
	public MailValidation() {
		pattern = Pattern.compile(EMAIL_PATTERN);
	}
 
	
	public boolean validate(String hex) {
                
 		matcher = pattern.matcher(hex);
		return matcher.matches();
 
	}
}
