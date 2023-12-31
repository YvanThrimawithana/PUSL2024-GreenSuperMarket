/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
*/
package Servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 
@WebServlet("/Delete_Product")
public class Delete_Product extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameter from the form
        int productID = Integer.parseInt(request.getParameter("delete_p_id"));

 
 
        try {
            // Establish a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851")) {
 
                // Prepare SQL statement to delete the product by name
                String sql = "DELETE FROM Inventory WHERE prod_id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, productID);
 
                    // Execute the delete statement
                    int rowsAffected = preparedStatement.executeUpdate();
 
                    // Handle the result
                    if (rowsAffected > 0) {
                        response.sendRedirect("admin-inventory.jsp");
                    } else {
                        response.getWriter().println("Product not found or deletion failed.");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Unable to delete the product.");
        }
    }
}