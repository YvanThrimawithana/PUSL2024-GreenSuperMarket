package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "update_user_profile", urlPatterns = {"/update_user_profile"})
public class update_user_profile extends HttpServlet {

 

    // JDBC variables for opening, closing and managing connection
    private static Connection connection;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String uEmail = (String) session.getAttribute("userEmail");
        
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

        String getPhoneNumberQuery = "SELECT c_phone FROM CustomerDetails WHERE c_email=?";
        try (PreparedStatement getPhoneNumberStmt = con.prepareStatement(getPhoneNumberQuery)) {
            getPhoneNumberStmt.setString(1, uEmail);
            ResultSet resultSet = getPhoneNumberStmt.executeQuery();

            if (resultSet.next()) {
                String phoneNumber = resultSet.getString("c_phone");
                request.setAttribute("userPhoneNumber", phoneNumber);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        
            e.printStackTrace();
        }
        request.setAttribute("userEmail", uEmail);
        processRequest(request, response);
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Check if the session has the email attribute
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");            
            try {
               
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");

                // Query to retrieve user information based on email
                String query = "SELECT c_pno, c_pwd FROM CustomerDetails WHERE c_email = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, userEmail);

                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            // User found, retrieve information
                            String userPhoneNumber = resultSet.getString("c_pno");
                            String currentPassword = resultSet.getString("c_pwd");

                            // Get user's current password input and new password input from the request
                            String inputCurrentPassword = request.getParameter("upwd");
                            String inputNewPassword = request.getParameter("unpwd");

                            // Check if the current password matches the password saved in the database
                            if (currentPassword.equals(inputCurrentPassword)) {
                                // Update the user's password in the database
                                String updateQuery = "UPDATE CustomerDetails SET c_pwd = ? WHERE c_email = ?";
                                try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                                    updateStatement.setString(1, inputNewPassword);
                                    updateStatement.setString(2, userEmail);
                                    updateStatement.executeUpdate();
                                }

                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Password Updated</title>");
                                out.println("</head>");
                                out.println("<body>");
                                out.println("<h1>Password updated successfully</h1>");
                                out.println("</body>");
                                out.println("</html>");
                            } else {
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Password Mismatch</title>");
                                out.println("</head>");
                                out.println("<body>");
                                out.println("<h1>Current password does not match</h1>");
                                out.println("</body>");
                                out.println("</html>");
                            }

                            // Set user information as request attributes for JSP
                            request.setAttribute("userEmail", userEmail);
                            request.setAttribute("userPhoneNumber", userPhoneNumber);
                        } else {
                            // User not found
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<title>User Not Found</title>");
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<h1>User not found</h1>");
                            out.println("</body>");
                            out.println("</html>");
                            return;
                        }
                    }
                }

                // Forward the request to the JSP page
                request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
            } catch (ClassNotFoundException | SQLException e) {
                // Handle exceptions (log or display error message)
                e.printStackTrace();
            } finally {
                // Close the connection
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Update User Profile Servlet";
    }
}
