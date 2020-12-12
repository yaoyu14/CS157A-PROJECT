package admin.function;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.model.AdminModel;


public class AdminFunction {

    private static final String INSERT_COCKTAILS = "INSERT INTO Cocktails" + "  (ctName, AlcoholContent, price) VALUES " +
        " (?, ?, ?);";

    private static final String SELECT_COCKTAIL_BY_ID = "SELECT * FROM Cocktails WHERE cocktail_id =?";
    private static final String SELECT_ALL_COCKTAILS = "SELECT * FROM Cocktails";
    private static final String DELETE_COCKTAILS = "DELETE FROM Cocktails WHERE cocktail_id = ?;";
    private static final String UPDATE_COCKTAILS = "UPDATE Cocktails SET ctName = ?,AlcoholContent = ?, price =? WHERE cocktail_id = ?;";

    public AdminFunction() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", "root", "1017081623");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertCocktail(AdminModel cocktails) throws SQLException {
        System.out.println(INSERT_COCKTAILS);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COCKTAILS)) {
            preparedStatement.setString(1, cocktails.getctName());
            preparedStatement.setInt(2, cocktails.getAlcoholContent());
            preparedStatement.setInt(3, cocktails.getPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public AdminModel selectCocktail(int cocktail_id) {
        AdminModel cocktails = null;
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COCKTAIL_BY_ID);) {
            preparedStatement.setInt(1, cocktail_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String ctName = rs.getString("ctName");
                int AlcoholContent = rs.getInt("AlcoholContent");
                int price = rs.getInt("price");
                cocktails = new AdminModel(cocktail_id, ctName, AlcoholContent, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cocktails;
    }

    public List < AdminModel > selectAllCocktails() {

        List < AdminModel > cocktails = new ArrayList < > ();
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COCKTAILS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int cocktail_id = rs.getInt("cocktail_id");
                String ctName = rs.getString("ctName");
                int AlcoholContent = rs.getInt("AlcoholContent");
                int price = rs.getInt("price");
                cocktails.add(new AdminModel(cocktail_id, ctName, AlcoholContent, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cocktails;
    }

    public boolean deleteCocktail(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_COCKTAILS);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCocktail(AdminModel cocktail) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_COCKTAILS);) {
            statement.setString(1, cocktail.getctName());
            statement.setInt(2, cocktail.getAlcoholContent());
            statement.setInt(3, cocktail.getPrice());
            statement.setInt(4, cocktail.getCocktail_id());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
