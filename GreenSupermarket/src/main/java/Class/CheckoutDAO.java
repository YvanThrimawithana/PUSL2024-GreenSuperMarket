package Class;

import GetterSetters.CartItems;
import GetterSetters.CheckoutItems;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yvant
 */
public class CheckoutDAO {
    
    public static void insertOrder(String userEmail, String productName, double prodPrice, int prodQuantity) {
        String url = "jdbc:mysql://localhost:3306/GreenSupermarketDB";
        String username = "root";
        String password = "4851";

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            // SQL query to insert order information into the "Orders" table
            String insertOrderSql = "INSERT INTO Orders (c_email, prod_name, prod_price, prod_quantity) VALUES (?, ?, ?, ?)";

            try (PreparedStatement insertOrderStatement = connection.prepareStatement(insertOrderSql)) {
                // Set the values for the prepared statement
                insertOrderStatement.setString(1, userEmail);
                insertOrderStatement.setString(2, productName);
                insertOrderStatement.setDouble(3, prodPrice);
                insertOrderStatement.setInt(4, prodQuantity);

                // Execute the query to insert the data into the "Orders" table
                insertOrderStatement.executeUpdate();
            }

            // SQL query to delete data from the "CartItems" table
            String deleteCartItemsSql = "DELETE FROM Cart WHERE c_email = ?";

            try (PreparedStatement deleteCartItemsStatement = connection.prepareStatement(deleteCartItemsSql)) {
                // Set the values for the prepared statement
                deleteCartItemsStatement.setString(1, userEmail);
                

                // Execute the query to delete data from the "CartItems" table
                deleteCartItemsStatement.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }
    }

    public static List<CheckoutItems> getCheckout(String userEmail) {
        List<CheckoutItems> mainlist = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

            String sql = "SELECT * FROM Orders WHERE c_email = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, userEmail);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {

                        CheckoutItems check = new CheckoutItems();
                        check.setOrderId(resultSet.getInt("order_id"));
                        check.setProdName(resultSet.getString("prod_name"));
                        check.setProdQuantity(resultSet.getInt("prod_quantity"));
                        check.setProdPrice(resultSet.getDouble("prod_price"));

                        mainlist.add(check); // Add the CheckoutItems object to the list
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return mainlist;
    }

     public static void clearOrder(String userEmail) {
        String url = "jdbc:mysql://localhost:3306/GreenSupermarketDB";
        String username = "root";
        String password = "4851";

        // Example SQL query to clear the order table for the specified user
        String sql = "DELETE FROM Orders WHERE c_email = ?";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userEmail);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }
    }
}
