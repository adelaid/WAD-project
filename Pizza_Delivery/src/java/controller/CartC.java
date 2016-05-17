/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO_Factory;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.Pizza;

/**
 *
 * @author Ada
 */
public class CartC extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
        
        ArrayList<Pizza> produse=new ArrayList<Pizza>();
        
        
        
        List<Pizza> pizzas=ProductDAO_Factory.getProductDAO().getPizza();
         Enumeration<String> it;
        it = request.getParameterNames();
        ArrayList lst=new ArrayList();
        ArrayList<Integer> cant=new ArrayList<Integer>();
        while (it.hasMoreElements()) {
                String t = it.nextElement();
                String value = request.getParameter(t);
               // out.println("<h1>Parameter " + t + " has value " + request.getParameter(t) + "</h1>");
//               if(Integer.parseInt(request.getParameter(t))!=0){
//               lst.add(t);
//               cant.add(Integer.parseInt(request.getParameter(t)));
//               }
//               if(Integer.parseInt(request.getParameter(t))==0){
//                   lst.add("product_0");
//                cant.add(0);
//               }
for(Pizza p:pizzas){
               if(p.getId()==Integer.parseInt(t)){
                   p.setQuantity(Integer.parseInt(request.getParameter(t)));
                   if(p.getQuantity()!=0){
               produse.add(p);
                   }
               }
                   }
            }
       
       
        
        
        
      //  new Order();
        
        produse.toString();
        request.getSession().setAttribute("ProduseCumparate", produse);
         RequestDispatcher rd = request.getRequestDispatcher("CartJSP.jsp");
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
