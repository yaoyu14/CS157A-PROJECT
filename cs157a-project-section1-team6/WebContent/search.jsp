<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
	<head>
		<title>Search cocktail</title>	
		<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css"> 		<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script> 		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>	
	</head>
	<body>
	<a href="signUpSuccess.jsp">Home</a>
        <body style="background:#F0B27A no-repeat;"> 
		<br>
		<form action="" mothod="POST">
		<div class="container">
			<div class="form-group">
				<div class="col-sm-5">
					<div class="input-group">
						<input type="text" name="search" class="form-control" placeholder="Type for search cocktails" autocomplete="off">
						<div class="input-group-btn">
						   <button type="submit" value="Search" class="btn btn-primary">Search</button>
						</div>
					</div>
				</div>
			</div><br></br>
			<table class="table table-bordered table-striped">
				<tr>
					<th>Cocktail id</th>
					<th>Cocktail Name</th>
					<th>Alcohol Content</th>
					<th>Price</th>
				</tr>
				<%
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT", "root", "1017081623");
					String Query="SELECT * FROM cocktails_deliveries.cocktails where ctName like'%"+request.getParameter("search")+"%'";
					
					Statement stm=conn.createStatement();
					ResultSet rs=stm.executeQuery(Query);
					while(rs.next())
					{
						%>
						<tr>
							<td><%=rs.getInt("cocktail_id")%></td>
							<td><%=rs.getString("ctName")%></td>
							<td><%=rs.getDouble("alcoholContent")%></td>
							<td><%=rs.getDouble("price")%></td>
						</tr>
						<%
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
				%>
			</table>
		</div>
		</form>
	</body>
</html>