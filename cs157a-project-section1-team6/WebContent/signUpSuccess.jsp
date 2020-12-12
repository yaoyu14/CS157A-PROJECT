<%@ page import="java.sql.*"  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="user.login.*"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home page</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<body style="background:#F0B27A no-repeat;"> 
	<a href="logout.jsp">Logout</a>
	<h1>Welcome to Cocktails Shop!</h1>
	<table class="table table-bordered table-striped" style="width: 70%">
		<tr>
			<th style="width: 15%">Cocktail id</th>
			<th style="width: 15%">Cocktail Name</th>
			<th style="width: 15%">Alcohol Content</th>
			<th style="width: 15%">Price</th>
		</tr>
<%
	String db = "Cocktails_Deliveries";
	String user;
	user = "root";
	String password = "1017081623";
	try {
		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", user, password);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM cocktails_deliveries.cocktails");
		while (rs.next()) {
			String name = rs.getString(2);
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<%
		}
		ResultSet rs2 = stmt.executeQuery(" SELECT * FROM users WHERE username = " );	
		while (rs2.next()) {
			out.println(" USER ID: " + rs2.getString(1) + "<br/><br/>" );
		}
		rs.close();
		rs2.close();
		stmt.close();
		con.close();
	} catch (SQLException e) {
		//out.println("SQLException caught: " + e.getMessage());
	}
%>
		</table>
		<form action="${pageContext.request.contextPath}/addedcocktails" method="post">
			<label for="fname">Pick a Cocktail:</label>
			<input type="text"  name="cocktailName">
			<br>
			<label for="fname">quantity:</label>
			<input type="text"  name="numberofCocktails">
			<input type="submit" value="Add to cart" />
		</form>
		<form action="${pageContext.request.contextPath}/buy" method="post">
		<input type="submit" value="Checkout" />
		</form>
	</body>
</html>
