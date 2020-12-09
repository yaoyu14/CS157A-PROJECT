package homePage.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/favorite")
public class MyFavorite extends HttpServlet {
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
	

    public MyFavorite() {
        super();

        System.out.println("I AM INSIDE THE favorite class");
        // TODO Auto-generated constructor stub
    }
    
    //adding logic testing
       
    public int 	addToFavorite(int myContainsId) throws ClassNotFoundException {
        int status = -1;

        String SQL_STATMENT= "INSERT INTO Favorite" +
                "  (user_id, cocktails_id) SELECT ( (SELECT user_id FROM users WHERE username = " + UserNameVal.userName +" )  ), (?) ";
        
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("This is the userNAme: "+ UserNameVal.userName  );
        try (Connection connection = DriverManager
        	.getConnection("jdbc:mysql://localhost:3306/Cocktails_Deliveries?serverTimezone=EST5EDT", "root", "rootAc045065");

            // Step 2:Create a statement using connection object
        
            PreparedStatement preparedStatement = connection
            .prepareStatement(SQL_STATMENT)) {

            preparedStatement.setInt(1, myContainsId);
            
            System.out.println("testing Favorite");
            System.out.println(preparedStatement);
            //ResultSet rs = preparedStatement.executeQuery();
            preparedStatement.executeUpdate();

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
//TODO 
        String favoriteCocktailName = request.getParameter("favoriteCocktailName");

        int inum = Integer.parseInt(favoriteCocktailName);
 
		try {
			addToFavorite(inum);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  
		RequestDispatcher dispatcher = request.getRequestDispatcher("myFavorite.jsp");
		dispatcher.forward(request, response);
	}

}
