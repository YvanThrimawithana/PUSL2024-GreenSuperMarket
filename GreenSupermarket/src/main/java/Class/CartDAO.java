/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Class;

import GetterSetters.CartItems;
import Servlet.wishlistitems;
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
    
}
