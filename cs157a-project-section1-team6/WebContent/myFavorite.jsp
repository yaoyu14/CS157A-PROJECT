<%@ page import="homePage.controller.UserNameVal" import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<body style="background:#F0B27A no-repeat;">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>My Favorite Cocktail List :)</h1>



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
		
		ResultSet rt = stmt.executeQuery(" SELECT * FROM cocktails A JOIN  favorite B ON A.cocktail_id = B.cocktails_id" +
				" WHERE B.user_id = (SELECT user_id FROM users WHERE username = "+ UserNameVal.userName + ")");
		
		while (rt.next()) {

			out.println(rt.getString(1) + ". " +  rt.getString(2) + ", " + "Alcohol Content: "+ rt.getString(3) + "%" +", Price: $" + rt.getString(4) + "<br/><br/>" );
		}
	
		rt.close();
		stmt.close();
		con.close();
	} catch (SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
	}
%>
	
	
	
</body>
</html>