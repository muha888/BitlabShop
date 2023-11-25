package db;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "postgres");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Item> getAllItems(){
    ArrayList<Item> items = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM items");
            ResultSet resultSet = stmt.executeQuery();
            while(resultSet.next()){
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("names"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                item.setPhotoUrl(resultSet.getString("photo"));

                items.add(item);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return items;

    }
}
