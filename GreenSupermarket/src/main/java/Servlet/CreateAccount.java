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

@WebServlet(name = "CreateAccount", urlPatterns = { "/CreateAccount" })
public class CreateAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("Uemail");
            String name = request.getParameter("Uname");
            String password = request.getParameter("Upwd");
            String confirmPassword = request.getParameter("Urpwd");
            String phoneNumber = request.getParameter("pno");

            if (!password.equals(confirmPassword)) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Create Account Response</title>");
                out.println("<script>alert('Passwords do not match');</script>"); // Display alert for passwords mismatch
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Create Account Response</h1>");
                out.println("<p>Passwords do not match</p>");
                out.println("</body>");
                out.println("</html>");
                return; // Exit the method if passwords don't match
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");

                // Check if the email already exists
                String checkEmailQuery = "SELECT COUNT(*) AS total_count\n" +
                            "FROM (\n" +
                            "    SELECT c_email AS email FROM CustomerDetails\n" +
                            "    UNION\n" +
                            "    SELECT admin_email AS email FROM AdminDetails\n" +
                            ") AS combined\n" +
                            "WHERE email = ?;";
                try (PreparedStatement checkEmailStmt = con.prepareStatement(checkEmailQuery)) {
                    checkEmailStmt.setString(1, email);
                    ResultSet emailResultSet = checkEmailStmt.executeQuery();
                    emailResultSet.next();
                    int emailCount = emailResultSet.getInt(1);

                    if (emailCount > 0) {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Create Account Response</title>");
                        out.println("<script>alert('Email already exists');</script>"); // Display alert for existing email
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Create Account Response</h1>");
                        out.println("<p>Email already exists</p>");
                        out.println("</body>");
                        out.println("</html>");
                        return; // Exit the method if email already exists
                    }
                }

                String insertQuery = "INSERT INTO CustomerDetails (c_email, c_name, c_pwd, c_pno) VALUES (?, ?, ?, ?)";

                try (PreparedStatement pst = con.prepareStatement(insertQuery)) {
                    pst.setString(1, email);
                    pst.setString(2, name);
                    pst.setString(3, password);
                    pst.setString(4, phoneNumber);

                    int rowCount = pst.executeUpdate();

                    if (rowCount > 0) {
                        // Data inserted successfully, create HttpSession
                        HttpSession session = request.getSession();
                        
                        session.setMaxInactiveInterval(24 * 60 * 60);

                        // Store user's email in the session
                        session.setAttribute("userEmail", email);
                        
                        System.out.println("Session ID: " + session.getId());
                        System.out.println("Creation Time: " + session.getCreationTime());
                        System.out.println("Last Accessed Time: " + session.getLastAccessedTime());

                        // Redirect the user to another page (e.g., home.jsp)
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Create Account Response</title>");
                        out.println("<script>window.location.href='home.jsp';</script>"); // Perform client-side redirect
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Create Account Response</h1>");
                        out.println("<p>Account created successfully</p>");
                        out.println("</body>");
                        out.println("</html>");
                    } else {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Create Account Response</title>");
                        out.println("<script>alert('Failed to insert data');</script>"); // Display alert for insertion failure
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Create Account Response</h1>");
                        out.println("<p>Failed to insert data</p>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Create Account Response</title>");
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>"); // Display alert for general error
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Create Account Response</h1>");
                out.println("<p>Error: " + e.getMessage() + "</p>");
                out.println("</body>");
                out.println("</html>");
                e.printStackTrace();
            }
        }
    }
}
