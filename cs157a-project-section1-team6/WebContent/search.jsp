<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Search cocktail</title>
		<link href="bootstrap.css" rel="stylesheet" type="text/css">
	</head>
	<body>
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
			<table class="table table-bordered table-striped" style="width: 70%">
				<tr>
					<th style="width: 15%">Cocktail id</th>
					<th style="width: 15%">Cocktail Name</th>
					<th style="width: 15%">Alcohol Content</th>
					<th style="width: 15%">Price</th>
				</tr>
				<%
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktails_deliveries?serverTimezone=EST5EDT");
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