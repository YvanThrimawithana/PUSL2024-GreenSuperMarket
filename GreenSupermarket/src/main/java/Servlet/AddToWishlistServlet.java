package Servlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/addToWishlist")
public class AddToWishlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        // You may want to validate userEmail and productId before proceeding

        Wishlist.addToWishlist(userEmail, productId);
        

        // You can redirect to a success page or send a JSON response as needed
        response.sendRedirect("wishlist.jsp");
    }
}
