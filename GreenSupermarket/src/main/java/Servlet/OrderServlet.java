package Servlet;

import Class.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "OrderServlet", urlPatterns = { "/OrderServlet" })
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get customer email from request parameter
        String userEmail = (String) request.getSession().getAttribute("userEmail");

        // Instantiate DAO class and call the method
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.placeOrder(userEmail);

        // Change the method to POST and redirect
        RequestDispatcher dispatcher = request.getRequestDispatcher("authorize_payment");
        dispatcher.forward(request, response);
    }

    // ... other methods ...
}