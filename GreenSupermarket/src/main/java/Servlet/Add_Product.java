package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "Add_Product", urlPatterns = {"/Add_Product"})
@MultipartConfig(maxFileSize = 16177215) // Max file size up to 16MB
public class Add_Product extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Form data
        String productName = request.getParameter("p_name");
        String productCategory = request.getParameter("p_category");
        double productPrice = Double.parseDouble(request.getParameter("p_price"));
        int productQuantity = Integer.parseInt(request.getParameter("p_quantity"));
        int productId = Integer.parseInt(request.getParameter("p_id"));

        // Get the file part
        Part filePart = request.getPart("p_image");
        String fileName = getSubmittedFileName(filePart);

        // Specify the absolute path to save the file
        String absolutePath = "E:\\GreenSupermarketSite\\GreenSupermarket\\src\\main\\webapp\\assets\\images\\" + fileName;

        // Create the directory if it doesn't exist
        File uploadDir = new File(absolutePath).getParentFile();
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // This will create parent directories as needed
        }

        filePart.write(absolutePath);

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

            // SQL query to insert data into the 'products' table with file path
            String sql = "INSERT INTO Inventory (prod_id, prod_name, prod_category, prod_price, prod_quantity, prod_image) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            statement.setString(2, productName);
            statement.setString(3, productCategory);
            statement.setDouble(4, productPrice);
            statement.setInt(5, productQuantity);
            statement.setString(6, "assets/images/" + fileName); // Save the relative file path in the database

            // Execute the query
            statement.executeUpdate();

            // Close resources
            statement.close();
            connection.close();

            response.sendRedirect("admin-inventory.jsp"); // Redirect to a success page
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

            // Set the content type to HTML
            response.setContentType("text/html;charset=UTF-8");

            // Get the PrintWriter
            try (PrintWriter out = response.getWriter()) {
                // Write the error message directly to the response
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error Page</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h2>Error Page</h2>");
                out.println("<p>An error occurred: " + e.getMessage() + "</p>");
                out.println("</body>");
                out.println("</html>");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String headerPart : header.split(";")) {
            if (headerPart.trim().startsWith("filename")) {
                return headerPart.substring(headerPart.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
