/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAOImpl;
import dao.ProductDAO_Factory;
import dao.UserDAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.CreateImage;

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
        RequestDispatcher rd;
        ArrayList<Double> price = new ArrayList<Double>();
        boolean admin = false;
//        if (UserDAOFactory.getUserDAO().isAdmin((String)request.getSession().getAttribute("uname"))) {
//            admin = true;
//        }
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

        if (size.equals("Small")) {
            price.add(2.0);
        } else if (size.equals("Medium")) {
            price.add(3.0);
        } else if (size.equals("Large")) {
            price.add(3.0);
        }

//c.getPrice();
        price.add(c.getPrice());
        price.add(s.getPrice());
//
        double totalPrice = 0;
        for (int i = 0; i < price.size(); i++) {
            totalPrice += price.get(i);
        }

        ArrayList<Integer> ids = ProductDAOImpl.getInstance().getPizzaIds();
        String pizzaName = "Personal pizza" + ids.get(ids.size() - 1);
        boolean bought = false;
        if (totalPrice != 0) {
            bought = true;
        }
        if (bought) {
            Pizza p = new Pizza(pizzaName, size, c, s, cheese, ingredients, totalPrice, "-");
            ProductDAO_Factory.getProductDAO().insertPizza(p);

            ArrayList<Integer> ids2 = ProductDAOImpl.getInstance().getPizzaIds();

            for (Ingredient ii : ingredients) {
                ProductDAO_Factory.getProductDAO().insertIngredient(ids2.get(ids2.size() - 1), ii.getId());//1 2 16 3
//p.setIngredients(ingredients);
            }
            p.setIngredients(ingredients);
            p.setId(ids2.get(ids2.size() - 1));

//String imgPath=CreateImage.getInstance().createImage(p);
//p.setImage(imgPath);
//ProductDAO_Factory.getProductDAO().updatePizza(pizzaName, imgPath);
            request.getSession().setAttribute("ShoppingCart", p);
            rd = request.getRequestDispatcher("PizzaJSP.jsp");
            rd.forward(request, response);

        } else {
            rd = request.getRequestDispatcher("indexJSP.jsp");
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
