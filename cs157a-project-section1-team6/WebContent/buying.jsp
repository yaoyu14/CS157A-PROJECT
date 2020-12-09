<%@ page import="homePage.controller.UserNameVal" import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
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
String db = "Cocktails_Deliveries";
String user;
user = "root";
String password = "1017081623";

try {

java.sql.Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", user, password);
//out.println(db + " database successfully opened.<br/><br/>");

//out.println("Initial entries in table \"hw1\": <br/>");
Statement stmt = con.createStatement();

ResultSet rt = stmt.executeQuery(" SELECT * FROM cocktails A JOIN  contains B ON A.cocktail_id = B.cocktail_id JOIN orders C ON C.order_id = B.order_id WHERE B.order_id = (SELECT MAX(order_id) FROM contains) " );
out.println("You Ordered: " );


while (rt.next()) {
//String name = rt.getString(2);
//out.println("<html> <input type=\"submit\" name=\"button1\" value=\"=add\" /> </html>");
out.println(rt.getString(2) + " Price $" + rt.getString(4) + " x "+ rt.getString(7) + "<br/><br/>" );
}

out.println("Total Price:" );

ResultSet rs = stmt.executeQuery(" SELECT * FROM orders B WHERE B.order_id = (SELECT MAX(order_id) FROM contains)" );

while (rs.next()) {

out.println(" $" + rs.getString(3) + "<br/><br/>" );
}


rt.close();
rs.close();

stmt.close();
con.close();
} catch (SQLException e) {
out.println("SQLException caught: " + e.getMessage());
}
%>



</body>
</html>