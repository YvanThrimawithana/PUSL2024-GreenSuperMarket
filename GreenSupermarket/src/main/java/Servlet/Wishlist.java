package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Servlet.wishlistitems;

public class Wishlist {
    public static void addToWishlist(String userEmail, int productId) {
        try (Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");) {
            String query = "INSERT INTO Wishlist (c_email, prod_id) VALUES (?, ?)";
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
//    public static List<WishlistBean> SearchWishlist(String CustomerId){//bean = datatype. wishlistt.searchwishlist
//        List<WishlistBean> mainlist = new ArrayList<>(); 
//        try (Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root","4851");) {
//            String query = "SELECT * FROM Wishlist WHERE c_email=?";
//            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//                preparedStatement.setString(1, CustomerId);
//                
//                try (ResultSet rs = preparedStatement.executeQuery()){
//                    while(rs.next()){
//                        WishlistBean wish = new WishlistBean();
//                        wish.setCustomerId(rs.getString("c_email"));
//                        wish.setProductId(rs.getInt("prod_id"));
//                        mainlist.add(wish);
//                    }
//                    
//                }
//            }
//        } catch (SQLException e) {
//            // Handle database errors
//            e.printStackTrace();
//        }
//        return mainlist;
//    }
//     Get wishlist for relevant user
   public static List<wishlistitems> getWishlist(String UserEmail) {

    List<wishlistitems> mainlist = new ArrayList<>();

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
                + "    Wishlist W ON W.prod_id = I.prod_id "
                + "WHERE "
                + "    W.c_email = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, UserEmail);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                  
                    wishlistitems wishitem = new wishlistitems();
                    wishitem.setId(resultSet.getInt("prod_id"));
                    wishitem.setName(resultSet.getString("prod_name"));
                    wishitem.setPrice(resultSet.getDouble("prod_price"));
                    wishitem.setQuantity(resultSet.getInt("prod_quantity"));
                    wishitem.setCategory(resultSet.getString("prod_category"));
                    wishitem.setImage(resultSet.getString("prod_image"));

                    mainlist.add(wishitem); // Add the WishlistItems object to the list
                }
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    return mainlist;
}
   public static void removeFromWishlist(int productId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851")) {
            String query = "DELETE FROM Wishlist WHERE prod_id = ?";
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
//