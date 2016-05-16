/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO_Factory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Crust;
import model.Ingredient;
import model.Pizza;
import model.Sauce;

/**
 *
 * @author Ada
 */
public class MakePizzaC extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        ArrayList<Double> price=new ArrayList<Double>();
        
        
        String size = request.getParameter("size");
        int crustId = Integer.parseInt(request.getParameter("crust"));
        int sauceId = Integer.parseInt(request.getParameter("sauce").substring(1));

      Crust c = ProductDAO_Factory.getProductDAO().getCrust(crustId);
  Sauce s = ProductDAO_Factory.getProductDAO().getSauce(sauceId);
        boolean cheese = false;
        if (request.getParameter("cheese").equals("w")) {
            cheese = true;
            price.add(2.0);
            
        }

        
            ArrayList<Ingredient> ingredients = new ArrayList<Ingredient>();
            Enumeration<String> it;
            it = request.getParameterNames();

            while (it.hasMoreElements()) {
                String t = it.nextElement();

                if (t.startsWith("meats") || t.startsWith("veggies") && request.getParameter(t) != null && Integer.parseInt(request.getParameter(t)) != 0) {
                    ingredients.add(ProductDAO_Factory.getProductDAO().getIngredient(Integer.parseInt(request.getParameter(t))));

                }

            }

            for (Ingredient i : ingredients) {
               price.add(i.getPrice());
            }


if(size.equals("Small")){
    price.add(2.0);
}
else if(size.equals("Medium")){
price.add(3.0);
}
else if(size.equals("Large")){
    price.add(3.0);
}

//c.getPrice();
price.add(c.getPrice());
price.add(s.getPrice());
//
double totalPrice=0;
for(int i=0;i<price.size();i++){
totalPrice+=price.get(i);}

Pizza p=new Pizza(size,c,s,cheese,ingredients,totalPrice);


try{
out.println(totalPrice);
}catch(Exception e){}

        
        
        
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
