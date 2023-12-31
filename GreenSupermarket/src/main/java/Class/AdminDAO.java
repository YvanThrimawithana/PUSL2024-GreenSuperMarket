/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Class;

import GetterSetters.AdminPanelItems;
import GetterSetters.FeedbackItems;
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
public class AdminDAO {
     public static List<FeedbackItems> getFeedbackItems() {
        List<FeedbackItems> mainlist = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

            String sql = "SELECT c_email, f_status, f_text\n" +
                            "FROM Feedback\n" +
                            "ORDER BY f_id DESC;";

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
//                    String userEmail = resultSet.getString("c_email");
//                    String feedbackStatus = resultSet.getString("f_status");
//                    String feedbackText = resultSet.getString("f_text");

                    FeedbackItems fbitem = new FeedbackItems();
                    fbitem.setUserEmail(resultSet.getString("c_email"));
                    fbitem.setFeedbackStatus(resultSet.getString("f_status"));
                    fbitem.setFeedbackText(resultSet.getString("f_text"));

                    mainlist.add(fbitem);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }

        return mainlist;
    }
    
     public static List<AdminPanelItems> getProducts() {
        List<AdminPanelItems> mainlist = new ArrayList<>();
        
                try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenSupermarketDB", "root", "4851");

            String sql = "SELECT * FROM Inventory";

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
//                    String userEmail = resultSet.getString("c_email");
//                    String feedbackStatus = resultSet.getString("f_status");
//                    String feedbackText = resultSet.getString("f_text");

                    AdminPanelItems item = new AdminPanelItems();
                    item.setProdId(resultSet.getInt("prod_id"));
                    item.setProdName(resultSet.getString("prod_name"));
                    item.setProdPrice(resultSet.getDouble("prod_price"));
                    item.setProdQuantity(resultSet.getInt("prod_quantity"));
                    item.setProdCategory(resultSet.getString("prod_category"));
                    item.setProdImage(resultSet.getString("prod_image"));


                    mainlist.add(item);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
     
     
     
     
     return mainlist;
     }
    
}
