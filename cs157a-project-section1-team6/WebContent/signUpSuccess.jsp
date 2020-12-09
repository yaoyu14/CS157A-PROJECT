<%@ page import="homePage.controller.UserNameVal" import="java.sql.*"  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.login.*"%>
    
<!DOCTYPE html>
<html>
<head>
<body style="background:#F0B27A no-repeat;">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="logout.jsp">Logout</a>
<h1>Welcome to Cocktails Shop!</h1>

<%!
public void printt(){
	System.out.println("TESTING");
}
%>


<%
	String db = "Cocktails_Deliveries";
	String user;
	user = "root";
	String password = "rootAc045065";

	try {

		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", user, password);
		//out.println(db + " database successfully opened.<br/><br/>");

		//out.println("Initial entries in table \"hw1\": <br/>");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM cocktails_deliveries.cocktails");
		while (rs.next()) {
			String name = rs.getString(2);
			//out.println("<html> <input type=\"submit\" name=\"button1\" value=\"=add\" /> </html>");
			out.println(rs.getString(1) + " " + rs.getString(2) + " $" + rs.getString(4) + "<br/><br/>" );
		}
		
		rs.close();
		
		stmt.close();
		con.close();
	} catch (SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
	}
%>
<form action="${pageContext.request.contextPath}/addedcocktails" method="post">
<label for="fname">Pick a Cocktail:</label>

<input type="text"  name="cocktailName">
<input type="text"  name="numberofCocktails">
<input type="submit" value="Add" />
</form>


<form action="${pageContext.request.contextPath}/buy" method="post">
<input type="submit" value="Buy" />
</form>

<form action="${pageContext.request.contextPath}/favorite" method="post">
<label for="fname">Add your favorite Cocktails:</label>

<input type="text"  name="favoriteCocktailName">
<input type="submit" value="My Favoriteee" />

</form>

<form action="${pageContext.request.contextPath}/buy" method="post">
<input type="submit" value="Show My Favorites" />
</form>




</body>
</html>