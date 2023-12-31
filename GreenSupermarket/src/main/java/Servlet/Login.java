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

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("Uemail");
            String password = request.getParameter("Upwd");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

                // Check user credentials
                String checkUserCredentialsQuery = "SELECT * FROM CustomerDetails WHERE c_email=? AND c_pwd=?";
                try (PreparedStatement checkUserCredentialsStmt = con.prepareStatement(checkUserCredentialsQuery)) {
                    checkUserCredentialsStmt.setString(1, email);
                    checkUserCredentialsStmt.setString(2, password);
                    ResultSet userResultSet = checkUserCredentialsStmt.executeQuery();

                    if (userResultSet.next()) {
                        // Valid user credentials
                        handleUserLogin(request, response, email);
                        return;
                    }
                }

                // Check admin credentials
                String checkAdminCredentialsQuery = "SELECT * FROM AdminDetails WHERE admin_email=? AND admin_pwd=?";
                try (PreparedStatement checkAdminCredentialsStmt = con.prepareStatement(checkAdminCredentialsQuery)) {
                    checkAdminCredentialsStmt.setString(1, email);
                    checkAdminCredentialsStmt.setString(2, password);
                    ResultSet adminResultSet = checkAdminCredentialsStmt.executeQuery();

                    if (adminResultSet.next()) {
                        // Valid admin credentials
                        handleAdminLogin(request, response, email);
                        return;
                    }
                }

                // Invalid credentials, display JavaScript alert
                
                response.sendRedirect("login.jsp");
                out.println("<script>alert('Invalid email or password');</script>");
            } catch (ClassNotFoundException | SQLException e) {
                // Handle exceptions
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Login Response</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Login Response</h1>");
                out.println("<p>Error: " + e.getMessage() + "</p>");
                out.println("</body>");
                out.println("</html>");
                e.printStackTrace();
            }
        }
    }

    private void handleUserLogin(HttpServletRequest request, HttpServletResponse response, String email) throws IOException {
        // User login logic
        response.sendRedirect("home.jsp");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(24 * 60 * 60);
        session.setAttribute("userEmail", email);
        System.out.println("Session ID: " + session.getId());
        System.out.println("Creation Time: " + session.getCreationTime());
        System.out.println("Last Accessed Time: " + session.getLastAccessedTime());
    }

    private void handleAdminLogin(HttpServletRequest request, HttpServletResponse response, String adminEmail) throws IOException {
        // Admin login logic
        response.sendRedirect("admin-dashboard.jsp");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(24 * 60 * 60);
        session.setAttribute("adminEmail", adminEmail);
        System.out.println("Admin Session ID: " + session.getId());
        System.out.println("Creation Time: " + session.getCreationTime());
        System.out.println("Last Accessed Time: " + session.getLastAccessedTime());
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
