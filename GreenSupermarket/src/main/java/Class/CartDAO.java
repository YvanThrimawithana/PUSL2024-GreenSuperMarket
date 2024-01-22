/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Class;

import GetterSetters.CartItems;
import GetterSetters.UpdatedCart;
import GetterSetters.wishlistitems;
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
public class CartDAO {
     public static void addtoCart(String userEmail, int productId) {
        try (Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");) {
            String query = "INSERT INTO Cart (c_email, prod_id) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, userEmail);
                preparedStatement.setInt(2, productId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
        }
    }
     
    
      public static List<CartItems> getCart(String UserEmail) {

    List<CartItems> mainlist = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");

        String sql = "SELECT "
                + "    I.prod_id,"
                + "    I.prod_name,"
                + "    I.prod_price,"
                + "    I.prod_quantity,"
                + "    I.prod_category,"
                + "    I.prod_image "
                + "FROM "
                + "    Inventory I "
                + "        INNER JOIN "
                + "    Cart W ON W.prod_id = I.prod_id "
                + "WHERE "
                + "    W.c_email = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, UserEmail);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                  
                    CartItems cart = new CartItems();
                    cart.setId(resultSet.getInt("prod_id"));
                    cart.setName(resultSet.getString("prod_name"));
                    cart.setPrice(resultSet.getDouble("prod_price"));
                    cart.setQuantity(resultSet.getInt("prod_quantity"));
                    cart.setCategory(resultSet.getString("prod_category"));
                    cart.setImage(resultSet.getString("prod_image"));

                    mainlist.add(cart); // Add the WishlistItems object to the list
                }
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    return mainlist;
}
       public static void removeCart(int productId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851")) {
            String query = "DELETE FROM Cart WHERE prod_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, productId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
        }
    }
       
      
    public static final String DB_URL = "jdbc:mysql://localhost:3306/GreenSupermarketDB";
    public static final String USER = "root";
    public static final String PASSWORD = "4851";

    public static void updateCart(String userEmail, int cartQuantity, int productId) {
        try {
            // Create a database connection
            Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            // Update orders table with cart data
String updateQuery = "UPDATE Cart \n" +
                     "SET cart_quantity = ? \n" +
                     "WHERE c_email = ? \n" +
                     "  AND prod_id = ?;";
            try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                updateStatement.setInt(1, cartQuantity);
                updateStatement.setString(2, userEmail);
                updateStatement.setInt(3, productId);
                updateStatement.executeUpdate();
            }
            
            UpdatedCart updatedCart = null;
            String retrieveQuery = "SELECT * FROM Cart WHERE c_email = ? AND prod_id = ?";
            try (PreparedStatement selectStatement = connection.prepareStatement(retrieveQuery)) {
                selectStatement.setString(1, userEmail);
                selectStatement.setInt(2, productId);
                try (ResultSet resultSet = selectStatement.executeQuery()) {
                    if (resultSet.next()) {
                        updatedCart = new UpdatedCart(
                                resultSet.getString("c_email"),
                                resultSet.getInt("prod_id"),
                                resultSet.getInt("cart_quantity")
                        );
                    }
                }
            }

            // Delete the same quantity from the inventory table
            String deleteQuery = "UPDATE Inventory SET prod_quantity = prod_quantity - ? WHERE prod_id = ?";
            try (PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {
                deleteStatement.setInt(1, cartQuantity);
                deleteStatement.setInt(2, productId);
                deleteStatement.executeUpdate();
            }

            // Close the database connection
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception based on your application's requirements
        }
    }

        
       
    
}
