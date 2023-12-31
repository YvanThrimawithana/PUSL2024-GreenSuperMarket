/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
    public static void insertOrder(String Email, String ProductName, double prod_price, int prod_quantity){
        String url = "jdbc:mysql://localhost:3306/GreenSupermarketDB";
        String username = "root";
        String password = "4851";

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            // SQL query to insert order information into the database
            String sql = "INSERT INTO Orders (c_email, prod_name, prod_price, prod_quantity) VALUES (?, ?, ?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Set the values for the prepared statement
                statement.setString(1, Email);
                statement.setString(2, ProductName);
                statement.setDouble(3, prod_price);
                statement.setInt(4, prod_quantity);

                // Execute the query to insert the data
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }
    }
      public static List<CheckoutItems> getCheckout(String UserEmail) {
           List<CheckoutItems> mainlist = new ArrayList<>();
         try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");

        String sql = "SELECT * FROM Orders WHERE c_email = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, UserEmail);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                  
                    CheckoutItems check = new CheckoutItems();
                    check.setOrderId(resultSet.getInt("order_id"));
                    check.setProdName(resultSet.getString("prod_name"));
                    check.setProdQuantity(resultSet.getInt("prod_quantity"));
                    check.setProdPrice(resultSet.getDouble("prod_price"));
                  

                    mainlist.add(check); // Add the WishlistItems object to the list
                }
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    return mainlist;
}
}
