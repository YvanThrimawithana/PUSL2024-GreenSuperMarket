/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Class.OrderDAO;
import static Class.OrderDAO.getPaymentDetails;
import GetterSetters.PaymentItems;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author yvant
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

   
    


  protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Assuming you have a method to get payment details
    List<PaymentItems> paymentItemsList = getPaymentDetails(request);

    if (!paymentItemsList.isEmpty()) {
        String userEmail = (String) request.getSession().getAttribute("userEmail");

        // Construct the email message
        String msg = "Dear Customer,\n\n"
                + "Thank you for your order. Here are the payment details:\n\n";

        for (PaymentItems paymentItem : paymentItemsList) {
            msg += paymentItem.getFormattedPaymentDetails() + "\n\n";
        }

        msg += "Your payment has been successfully processed.";

        // Assuming you have a class for sending plain text emails
        PlainTextEmailSender.main(msg, userEmail);

        // Assuming you have a method to confirm payment
        OrderDAO.confirmPayment(userEmail);

        // You can redirect the user to a confirmation page
           RequestDispatcher dispatcher = request.getRequestDispatcher("/execute_payment");
        dispatcher.forward(request, response);
    } else {
        // Handle the case when payment details are not available
        response.getWriter().println("Error: Unable to retrieve payment details.");
    }
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
