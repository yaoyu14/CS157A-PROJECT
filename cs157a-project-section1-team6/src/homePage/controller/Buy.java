package homePage.controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.LoginModel;


@WebServlet("/buy")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public int containsId = 27;
	MyValues myNewVal;
	UserNameVal user = null;
	
	public void setUser(UserNameVal user) {
		this.user = user;
	}
	

    public Buy() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public MyValues getContainsId() {
		return myNewVal;
	}
	public void setContainsId(MyValues myNewVal) {
		this.myNewVal = myNewVal;
	}
    
    //test
    
    public int Buying(int myContainsId) throws ClassNotFoundException {
        System.out.println("This is the userNAme: "+ UserNameVal.userName  );
        String SQL_STATMENT = "INSERT INTO orders" +
                "  (order_id, created_date, price) " +
  " SELECT (?), Now(), "+
  " (SELECT SUM(price) * quantity FROM cocktails x JOIN contains y USING(cocktail_id) WHERE y.order_id = ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/Cocktails_Deliveries?serverTimezone=EST5EDT", "root", "rootAc045065");
        		//useSSL=TRUE?
            // Step 2:Create a statement using connection object.
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_STATMENT)) {
        		
        	MyValues myVal = new MyValues();
        	System.out.println("MY VAL"+ myVal);
            preparedStatement.setInt(1, myVal.getContainsId());    
            preparedStatement.setInt(2, myVal.getContainsId());
            //AddedCocktails myCount = new AddedCocktails();
            //preparedStatement.setInt(3, myVal.getContainsId());
            
            //MyValues myVal = new MyValues();
        	//myVal.setContainsId(36);
            myVal.setContainsId(myVal.getContainsId() + 1);
            
            System.out.println("KKKKKKKKKKKKKKKKK" + myVal.getContainsId());


            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
            System.out.println("HELLOOO TEST2");
        }
        return result;
    }
    
    public int userID(int myContainsId) throws ClassNotFoundException {
        int status = -1;

        String SQL_STATMENT= "INSERT INTO Buys" +
                "  (user_id, order_id) SELECT ( (SELECT user_id FROM users WHERE username = " + UserNameVal.userName +" )  ), (?) ";
        
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("This is the userNAme: "+ UserNameVal.userName  );
        try (Connection connection = DriverManager
        	.getConnection("jdbc:mysql://localhost:3306/Cocktails_Deliveries?serverTimezone=EST5EDT", "root", "rootAc045065");

            // Step 2:Create a statement using connection object
        
            PreparedStatement preparedStatement = connection
            .prepareStatement(SQL_STATMENT)) {
    	 	MyValues myVal2 = new MyValues();
          //  preparedStatement.setInt(1, UserNameVal.userName);
            preparedStatement.setInt(1, myVal2.getContainsId());
            //preparedStatement.setString(2, LoginUser.getPassword());

            System.out.println("testingUser");
            System.out.println(preparedStatement);
            //ResultSet rs = preparedStatement.executeQuery();
            preparedStatement.executeUpdate();
            //System.out.println(rs);
            
            
            
//            if(rs.next()) {
//            	
//            	if(validateAdmin(LoginUser)) {
//            	status = 2;
//            	}else {
//            		status = 1;
//            	}
//            }

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
    
    //test

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("signUpSuccess.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//TODO
		try {
			Buying(containsId);
			userID(containsId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("HELLOOO TEST");
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("buying.jsp");
		dispatcher.forward(request, response);
	}

}