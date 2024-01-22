package Class;

import GetterSetters.InventoryItem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO {

    private static final String jdbcURL = "jdbc:mysql://localhost:3306/GreenSupermarketDB";
    private static final String dbUser = "root";
    private static final String dbPassword = "4851";

    public static List<InventoryItem> getInventoryItems() {
        List<InventoryItem> inventoryList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM Inventory";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("prod_id");
                String name = resultSet.getString("prod_name");
                double price = resultSet.getDouble("prod_price");
                int quantity = resultSet.getInt("prod_quantity");
                String category = resultSet.getString("prod_category");
                String image = resultSet.getString("prod_image");

                InventoryItem item = new InventoryItem(id, name, price, quantity, category, image);
                inventoryList.add(item);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return inventoryList;
    }
     public static List<InventoryItem> getvegetables() {
         List<InventoryItem> veglist = new ArrayList<>();
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM Inventory WHERE prod_category =\"Vegetables\" ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("prod_id");
                String name = resultSet.getString("prod_name");
                double price = resultSet.getDouble("prod_price");
                int quantity = resultSet.getInt("prod_quantity");
                String category = resultSet.getString("prod_category");
                String image = resultSet.getString("prod_image");

                InventoryItem item = new InventoryItem(id, name, price, quantity, category, image);
                veglist.add(item);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return veglist;
         
     }
      public static List<InventoryItem> getfruits() {
         List<InventoryItem> fruitlist = new ArrayList<>();
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM Inventory WHERE prod_category = \"Fruits\";";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("prod_id");
                String name = resultSet.getString("prod_name");
                double price = resultSet.getDouble("prod_price");
                int quantity = resultSet.getInt("prod_quantity");
                String category = resultSet.getString("prod_category");
                String image = resultSet.getString("prod_image");

                InventoryItem item = new InventoryItem(id, name, price, quantity, category, image);
                fruitlist.add(item);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return fruitlist;
         
     }
      public static List<InventoryItem> getmeats() {
         List<InventoryItem> meatlist = new ArrayList<>();
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM Inventory WHERE prod_category = \"Meat\";";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("prod_id");
                String name = resultSet.getString("prod_name");
                double price = resultSet.getDouble("prod_price");
                int quantity = resultSet.getInt("prod_quantity");
                String category = resultSet.getString("prod_category");
                String image = resultSet.getString("prod_image");

                InventoryItem item = new InventoryItem(id, name, price, quantity, category, image);
                meatlist.add(item);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return meatlist;
         
     }
      
}
