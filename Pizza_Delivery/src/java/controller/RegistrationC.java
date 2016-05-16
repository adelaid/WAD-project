/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adelaid
 */
public class RegistrationC extends HttpServlet {

    private static final long serialVersionUID = -734503860925086969L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd;
        String error = "";
        boolean hasErrors = false;
        String username = request.getParameter("uname");
        String password = request.getParameter("password");
        String password2 = request.getParameter("rpassword");
        String email = request.getParameter("email");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender").substring(0, 1);
        String telephone = request.getParameter("tel");

        boolean spam = request.getParameter("spam") != null
                && request.getParameter("spam").equals("on");
        if (UserDAOFactory.getUserDAO().userExists(username)) {
            hasErrors = true;
            error = "Username already exists";
        }
        if (!validation.ServerSideValidation.getInstance().isFnameValid(fname)) {
            hasErrors = true;
            error = "Please fill in the First Name";
        }

        if (!validation.ServerSideValidation.getInstance().isLnameValid(lname)) {
            hasErrors = true;
            error = "Please fill in the Last Name";
        }
        if (!validation.ServerSideValidation.getInstance().isUserNameValid(username)) {
            hasErrors = true;
            error = "Please fill in the Username";
        }
        if (!validation.ServerSideValidation.getInstance().isPassValid(password)) {
            hasErrors = true;
            error = "Please fill in the Password";
        }

        if (!validation.ServerSideValidation.getInstance().isPassValid2(password, password2)) {
            hasErrors = true;
            error = "Please fill in the Repeat Password!The password doesn't match";

        }
        if (!validation.ServerSideValidation.getInstance().isEmailValid(email)) {
            hasErrors = true;
            error = "Please fill in the Email";
        }
        if (!validation.ServerSideValidation.getInstance().isEmailValid2(email)) {
            hasErrors = true;
            error = "Please fill in the Email! It has to contain \"@ and .";
        }
        if (!validation.ServerSideValidation.getInstance().isGenderValid(gender)) {
            hasErrors = true;
            error = "Please choose the Gender";
        }
        if (!validation.ServerSideValidation.getInstance().isPhoneValid(telephone)) {
            hasErrors = true;
            error = "Please fill in the Telephone";
        }
        if (!validation.ServerSideValidation.getInstance().isPhoneValid2(telephone)) {
            hasErrors = true;
            error = "Telephone number must contain only digits!Retry";
        }

        if (!validation.ServerSideValidation.getInstance().isAddressValid(address)) {
            hasErrors = true;
            error = "Please fill in the Address";
        }

        if (hasErrors) {
            request.setAttribute("ERRORS", error);
            rd = request.getRequestDispatcher("RegistrationJSP.jsp");
            rd.forward(request, response);
        } else if (!hasErrors) {
            //  UserDAO_Factory.getUserDAO().createUser(username, password, email, gender, telephone, , spam);

            UserDAOFactory.getUserDAO().createUser(username, password, fname, lname, email, telephone, address, gender, spam);

            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }

       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
