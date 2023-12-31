package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Servlet.SelectItem;


public class SelectItemDAO {

    private static final String jdbcURL = "jdbc:mysql://localhost:3306/GreenSuperMarketdb";
    private static final String dbUser = "root";
    private static final String dbPassword = "4851";

    public static SelectItem getSelectItemById(int itemId) {
        SelectItem item = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM Inventory WHERE prod_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, itemId);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int Id = resultSet.getInt("prod_id");
                String Name = resultSet.getString("prod_name");
                double Price = resultSet.getDouble("prod_price");
                String Image = resultSet.getString("prod_image");
                int Quantity = resultSet.getInt("prod_quantity");


                item = new SelectItem(Id, Name, Price,Image, Quantity);
                
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return item;
    }
}
