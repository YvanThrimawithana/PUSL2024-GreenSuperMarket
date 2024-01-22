package Class;

import GetterSetters.OrderItems;
import GetterSetters.PaymentItems;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO {

    // JDBC URL, username, and password of MySQL server
    public static final String JDBC_URL = "jdbc:mysql://localhost:3306/GreenSupermarketDB";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "4851";

    // Method to place an order
    public static void placeOrder(String userEmail) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            // Retrieve items from the Cart for the specific customer
            String insertQuery = "INSERT INTO Orders (c_email, prod_name, prod_quantity, prod_price) " +
                    "SELECT c.c_email, i.prod_name, c.cart_quantity, " +
                    "(c.cart_quantity * (i.prod_price / 100)) AS total_price " +
                    "FROM Cart c JOIN Inventory i ON c.prod_id = i.prod_id " +
                    "WHERE c.c_email = ?";

            // Optionally, update the Inventory table to reflect reduced quantity
            String updateQuery = "UPDATE Inventory i JOIN Cart c ON i.prod_id = c.prod_id " +
                    "SET i.prod_quantity = i.prod_quantity - c.cart_quantity " +
                    "WHERE c.c_email = ?";

            // Delete items from the Cart after the order is placed
            String deleteQuery = "DELETE FROM Cart WHERE c_email = ?";

            // Set up and execute the SQL statements within a transaction
            connection.setAutoCommit(false);

            try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
                 PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
                 PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {

                // Set parameters for the queries
                insertStatement.setString(1, userEmail);
                updateStatement.setString(1, userEmail);
                deleteStatement.setString(1, userEmail);

                // Execute the SQL statements
                insertStatement.executeUpdate();
                updateStatement.executeUpdate();
                deleteStatement.executeUpdate();

                // Commit the transaction
                connection.commit();
            } catch (SQLException e) {
                // Rollback the transaction in case of an exception
                connection.rollback();
                e.printStackTrace();  // Handle the exception according to your needs
            } finally {
                // Restore auto-commit mode
                connection.setAutoCommit(true);
            }

        } catch (SQLException e) {
            e.printStackTrace();  // Handle the exception according to your needs
        }
    }

    // Close the database connection
    private void closeConnection(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle the exception according to your needs
        }
    }

    public static List<OrderItems> getOrderDetails(String UserEmail) {
       
        List <OrderItems> mainlist =  new ArrayList<>();
         try  {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");
            String sql = "SELECT order_id, prod_name, prod_quantity, prod_price FROM Orders WHERE c_email = ?";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, UserEmail);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        // Create an OrderItems object and add it to the list
                        OrderItems orderItem = new OrderItems();
                        orderItem.setOrderId(resultSet.getInt("order_id"));
                        orderItem.setProductName(resultSet.getString("prod_name"));
                        orderItem.setQuantity(resultSet.getInt("prod_quantity"));
                        orderItem.setPrice(resultSet.getDouble("prod_price"));

                        mainlist.add(orderItem);
                        orderItem.setTotalPrice(orderItem.getTotalPrice()+resultSet.getDouble("prod_price"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception according to your needs
        }

        return mainlist;
    }
public static void confirmPayment(String userEmail) {
    Connection connection = null;

    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

        // Call the stored procedure to transfer details to the payment table
        String storedProcedure = "{CALL CreatePaymentForUser(?)}";

        try (CallableStatement callableStatement = connection.prepareCall(storedProcedure)) {
            // Set the user email as a parameter
            callableStatement.setString(1, userEmail);

            // Execute the stored procedure
            callableStatement.execute();
        }

        // Commit the changes
        connection.commit();
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
    } finally {
        // Close the connection
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle the exception appropriately
            }
        }
    }
}
     
     
public static List<PaymentItems> getPaymentDetails(HttpServletRequest request) {
    List<PaymentItems> mainList = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851")) {
            // Retrieve customer email from the session
            String customerEmail = (String) request.getSession().getAttribute("userEmail");

            if (customerEmail != null) {
                String sql = "SELECT * FROM Payment WHERE c_email = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, customerEmail);

                    // Processing the result set
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        while (resultSet.next()) {
                            int paymentId = resultSet.getInt("payment_id");
                            int orderId = resultSet.getInt("order_id");
                            String paymentStatus = resultSet.getString("payment_status");
                            Timestamp paymentDate = resultSet.getTimestamp("payment_date");
                            double totalCost = resultSet.getDouble("total_cost");

                            // Create PaymentItems object and add to the list
                            PaymentItems paymentItem = new PaymentItems(paymentId, orderId, customerEmail, paymentStatus, paymentDate, totalCost);
                            mainList.add(paymentItem);
                        }
                    }
                }
            } else {
                // Handle the case when customerEmail is null (user not logged in)
                System.out.println("User not logged in");
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace(); // Handle the exception based on your application's requirements
    }

    return mainList;
}

}
