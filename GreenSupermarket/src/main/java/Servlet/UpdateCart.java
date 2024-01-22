/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Class.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author yvant
 */
@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCart"})
public class UpdateCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String userEmail = (String) request.getSession().getAttribute("userEmail");
         int cartquantity = Integer.parseInt(request.getParameter("cartquantity"));
         int productId = Integer.parseInt(request.getParameter("productId"));
         
         CartDAO.updateCart(userEmail, cartquantity, productId);
         
         response.sendRedirect("cart.jsp");
         
         
    }

    
   
}
