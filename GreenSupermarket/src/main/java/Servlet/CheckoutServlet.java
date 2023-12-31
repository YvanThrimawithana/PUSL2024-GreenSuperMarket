package Servlet;
import Class.CartDAO;
import Class.CheckoutDAO;
import GetterSetters.CartItems;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement the logic for handling GET requests if needed
        // For example, you could show a confirmation page or redirect to another page
        // ...

        // If you don't need any logic for GET requests, you can leave this method empty
    }

  @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Your existing logic for handling POST requests
    String UserEmail = (String) request.getSession().getAttribute("userEmail");
    System.out.println("UserEmail from session: " + UserEmail);

    List<CartItems> cart = CartDAO.getCart(UserEmail);
    request.setAttribute("cart", cart);

    try {
        for (CartItems cartItem : cart) {
            String productName = cartItem.getName();
            double price = cartItem.getPrice();
            int quantity = cartItem.getQuantity();

            // Call the insertOrder method for each item in the cart
            CheckoutDAO.insertOrder(UserEmail,productName, price, quantity);

            // Output details for debugging
            System.out.println("Inserted order for product: " + productName +
                               ", Price: " + price +
                               ", Quantity: " + quantity);
        }

        // Redirect to the success page
        response.sendRedirect("Checkout.jsp");
    } catch (Exception e) {
        e.printStackTrace(); // Log the exception or handle it appropriately

        // Redirect to the error page
        response.sendRedirect("error.jsp");
    }
}
}