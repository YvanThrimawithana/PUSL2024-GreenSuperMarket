package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "NewFeedBack", urlPatterns = { "/NewFeedBack" })
public class NewFeedBack extends HttpServlet {

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
        request.setAttribute("userEmail", uEmail);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve form data
            String userEmail = request.getParameter("uemail");
            String feedbackRating = request.getParameter("FeedbackRating");
            String userFeedback = request.getParameter("ufeedback");

            // Get the user's email from the session
            HttpSession session = request.getSession();
            String sessionEmail = (String) session.getAttribute("userEmail");

            // Validate session and form data
            if (sessionEmail != null && sessionEmail.equals(userEmail) && feedbackRating != null && userFeedback != null) {
                // Insert the data into the database
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                   

                    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851")) {
                        String sql = "INSERT INTO Feedback (c_email, f_status, f_text) VALUES (?, ?, ?)";
                        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                            preparedStatement.setString(1, userEmail);
                            preparedStatement.setString(2, feedbackRating);
                            preparedStatement.setString(3, userFeedback);

                            int rowsAffected = preparedStatement.executeUpdate();

                            if (rowsAffected > 0) {
                                // Successful insertion
                                out.println("<script>alert('FeedBack Sent !');</script>");// Redirect to a success page
                            } else {
                                // Handle insertion failure
                                  out.println("<script>alert('Error !');</script>"); // Redirect to an error page
                            }
                        }
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    // Handle database connection or SQL exception
                    response.sendRedirect("error.html"); // Redirect to an error page
                }
            } else {
                // Invalid session or form data
                response.sendRedirect("error.html"); // Redirect to an error page
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
