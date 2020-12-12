package user.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import login.model.LoginModel;

public class LoginUser {
	
	//todo another method this methond will return boolean
    public boolean validateAdmin(LoginModel LoginUser) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
        	.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", "root", "1017081623");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("SELECT * FROM users WHERE username = ? and user_id in (SELECT user_id FROM admin WHERE admin_id = 1);")) {
            preparedStatement.setString(1, LoginUser.getUsername());
            //preparedStatement.setString(2, LoginUser.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }

    public int validate(LoginModel LoginUser) throws ClassNotFoundException {
        int status = -1;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
        	.getConnection("jdbc:mysql://localhost:3306/Cocktails_Deliveries?serverTimezone=EST5EDT", "root", "1017081623");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ? ")) {
            preparedStatement.setString(1, LoginUser.getUsername());
            preparedStatement.setString(2, LoginUser.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
            	
            	if(validateAdmin(LoginUser)) {
            	status = 2;
            	}else {
            		status = 1;
            	}
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
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
