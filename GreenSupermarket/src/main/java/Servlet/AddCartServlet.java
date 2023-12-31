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
@WebServlet(name = "AddCartServlet", urlPatterns = {"/AddCartServlet"})
public class AddCartServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
       String userEmail = (String) request.getSession().getAttribute("userEmail");
       int productId = Integer.parseInt(request.getParameter("productId"));
       
       CartDAO.addtoCart(userEmail, productId);
//       PrintWriter out = response.getWriter();
//       out.println(productId);
//       out.println(userEmail);
  
       
        
        
        response.sendRedirect("cart.jsp");
  }


}
