<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>

	<%
	String user_id = request.getParameter("user_id");

    int x = 0;
    if(user_id!=null){
      try{
        x = Integer.parseInt(user_id);
       }catch(Exception e){
       }

    }
    //int user_id = Integer.parseInt(request.getParameter("user_id"));
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	String query;

	try {
		Class.forName("com.mysql.jdbc.Driver");

		con = DriverManager
	        	.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", "root", "1017081623");
      
		query = "SELECT * FROM users where user_id = ?";
		ps = con.prepareStatement(query);
        	ps.setString(1, user_id);
      

            System.out.println(ps);
			rs = ps.executeQuery();           
            if(rs.next()) {
            	query = "UPDATE users set username = ?, password = ?, address = ? WHERE user_id = ?";
            	ps = con.prepareStatement(query);
            	ps.setString(1, username);
            	ps.setString(2, password);
            	ps.setString(3, address);
            	ps.setString(4, user_id);
            	
            	ps.executeUpdate();
            }
	}
	
	
	catch(Exception e){
		e.printStackTrace();
	}

	%>
	<form name = "form1" method = post action = "profile.jsp">
		<table>
			<tr>
				<td>ID</td>
				<td><input name = "user_id" type = "text">
				</td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input name = "username" type = "text">
				</td>
				
			</tr>
			<tr>
				<td>Password</td>
				<td><input name = "password" type = "password">
				</td>
				
			</tr>
			<tr>
				<td>Address</td>
				<td><input name = "address" type = "text">
				</td>
				
			</tr>
			<tr>
				<td><input type = "submit" name = "btn" type = text value = "Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>