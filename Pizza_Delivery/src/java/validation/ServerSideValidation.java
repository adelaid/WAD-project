/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

/**
 *
 * @author Adelaid
 */
public class ServerSideValidation {
    
    private static ServerSideValidation instance;

    public static ServerSideValidation getInstance() {
        if (instance == null) {
            instance = new ServerSideValidation();
        }
        return instance;
    }
    
    
    
     public boolean isFnameValid(String name) {

       if(name == null || name.equals("")) return false;
       else return true;

    }
     
     public boolean isLnameValid(String name) {

       if(name == null || name.equals("")) return false;
       else return true;

    }

    public boolean isUserNameValid(String username) {

       if(username == null || username.equals("")) return false;
       else return true;

    }

    public boolean isPassValid(String pass) {

      if (pass == null || pass.equals("")) return false;
      else  return true;

    }

    public boolean isPassValid2(String pass, String pass2) {

        if (pass.equals(pass2)) return true;
        else return false;

    }

    public boolean isEmailValid(String email) {

      if (email == null || email.equals("")) return false;
      return true;

    }

    public boolean isEmailValid2(String email) {
 
         MailValidation e1 = new MailValidation();
            return e1.validate(email);
    

    }

    public boolean isGenderValid(String gender) {

       if ( gender == null ) return false;
          else return true;

    }

    public boolean isPhoneValid(String tel) {

       if (tel == null || tel.equals("")) return false;
       return true;

    }

    public boolean isPhoneValid2(String tel) {

        String re = "/^\\(?([0-9]{3})\\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/";
        if (tel.matches(re)) return false;
        return true;

    }
      public boolean isAddressValid(String address) {

       if (address == null || address.equals("") || address.equals("-")) return false;
       return true;

    }
      
      
}
