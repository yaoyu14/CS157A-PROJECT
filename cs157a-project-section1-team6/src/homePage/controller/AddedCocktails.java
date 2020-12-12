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
import javax.servlet.http.HttpSession;

import login.model.LoginModel;
import registration.model.RegistrationModel;


@WebServlet("/addedcocktails")
public class AddedCocktails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Buy myBuy = new Buy();
	MyValues myVal = new MyValues();

	
	MyValues myNewTest;
    public MyValues getAdded() {
		return myNewTest;
	}
	public void setAdded(MyValues added) {
		this.myNewTest = added;
	}
	
      //public int quantity = 2;

	//adding one 
	
	public void addOne() {
		
	}

    public AddedCocktails() {
        super();
        //myVal.setContainsId(54);
        //setAdded(this.myVal);
        //myBuy.setContainsId(myVal);
        System.out.println("I AM INSIDE THE added class");
        // TODO Auto-generated constructor stub
    }
    
    
    
    //adding logic testing
    
    public void gettingMax() throws ClassNotFoundException {
    	
    	String SQL_STATMENT = "SELECT MAX(order_id) FROM contains; ";
    	
    	Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/Cocktails_Deliveries?serverTimezone=EST5EDT", "root", "1017081623");
        		//useSSL=TRUE?
            // Step 2:Create a statement using connection object.
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_STATMENT)) {
            //preparedStatement.setInt(1, 1);
        	
        	System.out.println("I AM INSIDE THE FUNCTION");
        
        	//myVal.setContainsId(44);
        	myBuy.setContainsId(myVal);
        	//myBuy.myNewVal;
            //preparedStatement.setInt(1, myBuy.myNewVal.getContainsId());

            //quantity = fname3;
            setAdded(myVal);
            


            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            //result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return;
    }
       
    public int addToBuy(int fname2, int fname3) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO contains" +
            "  (order_id, cocktail_id, quantity) VALUES " +
            " (?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/Cocktails_Deliveries?serverTimezone=EST5EDT", "root", "1017081623");
        		//useSSL=TRUE?
            // Step 2:Create a statement using connection object.
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            //preparedStatement.setInt(1, 1);
        	
        	System.out.println("I AM INSIDE THE FUNCTION");
        	Buy myBuy = new Buy();
        	//myVal.setContainsId(44);
        	myBuy.setContainsId(myVal);
        	//myBuy.myNewVal;
            preparedStatement.setInt(1, myVal.getContainsId());
            preparedStatement.setInt(2, fname2);
            preparedStatement.setInt(3, fname3);
            //quantity = fname3;
            setAdded(myVal);
            


            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//TODO 
        String cocktailName = request.getParameter("cocktailName");
        String numberofCocktails = request.getParameter("numberofCocktails");

        int inum = Integer.parseInt(cocktailName);
        int inum2 = Integer.parseInt(numberofCocktails);
		try {
			addToBuy(inum, inum2);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  

		RequestDispatcher dispatcher = request.getRequestDispatcher("signUpSuccess.jsp");
		dispatcher.forward(request, response);
	}

}
