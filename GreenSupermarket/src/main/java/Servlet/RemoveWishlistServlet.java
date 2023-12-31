/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RemoveWishlist")
public class RemoveWishlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract product ID from request parameter
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Remove item from the wishlist (perform database deletion)
        Wishlist.removeFromWishlist(productId);

        // Redirect back to the wishlist page
        response.sendRedirect(request.getContextPath() + "/wishlist.jsp");
    }
}