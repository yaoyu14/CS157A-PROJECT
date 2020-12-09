
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>User successfully buying!</h1>

<%
	String db = "cs157a";
	String user;
	user = "root";
	String password = "rootAc045065";

	try {

		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", user, password);
		out.println(db + " database successfully opened.<br/><br/>");

		//out.println("Initial entries in table \"hw1\": <br/>");
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM cocktails_deliveries.cocktails");
		/*while (rs.next()) {
			String name = rs.getString(2);
			//out.println("<html> <input type=\"submit\" name=\"button1\" value=\"=add\" /> </html>");
			out.println(rs.getString(2) + " $" + rs.getString(3) + "<br/><br/>" );
		}*/
		
	   rs = stmt.executeQuery("SELECT * FROM cocktails_deliveries.seller");
		while (rs.next()) {
			String name = rs.getString(2);
			//out.println("<html> <input type=\"submit\" name=\"button1\" value=\"=add\" /> </html>");
			out.println(rs.getString(2) + "<br/><br/>" );
		}
		
		rs.close();
		stmt.close();
		con.close();
	} catch (SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
	}
	%>
		
	
</body>
</html>