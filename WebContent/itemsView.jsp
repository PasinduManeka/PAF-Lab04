<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Item View </title>
<link href="./assets/bootstrap.css" rel="stylesheet">
<link href="./assets/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<%@page import="java.sql.DriverManager" %>
	<%@page import="java.sql.ResultSet" %>
	<%@page import="java.sql.Statement" %>
	<%@page import="java.sql.Connection" %>
	
	<%
	String url = "jdbc:mysql://localhost:3306/paf";
	String User = "root";
	String password = "";
	Connection con;
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		System.out.println("Database connection failed.");
	}
	
	Statement stmt;
	ResultSet rs;
	
	%>
	
 	<div class="order-container">
 		<div class="card">
 			<h3 class="card-header text-center">Items View</h3>
 			<div class="">
 			<div class="card-body container">
 				<table class="table table-dark text-center ">
 					<thead >
 						<tr>
 							<th>ID</th>
 							<th>Item Code</th>
 							<th>Item Name</th>
 							<th>Item Price</th>
 							<th>Item Description</th>
 							<th>Actions	</th>
 						</tr>
 					</thead>
 					<%
 					try{
 						con=DriverManager.getConnection(url,User,password);
 						stmt=con.createStatement();
 						
 						String sql = "select* from items";
 						
 						rs=stmt.executeQuery(sql);
 						while(rs.next()){
 					%>
 							
 					<tbody>
 						<tr>
 							<td><%=rs.getString("itemID") %></td>
 							<td><%=rs.getString("itemCode") %></td>
 							<td><%=rs.getString("itemName") %></td>
 							<td><%=rs.getString("itemPrice") %></td>
 							<td><%=rs.getString("itemDesc") %></td>
 							<td><div class="form-row">
 									<div class="col"><div class="md-row"><form action="updateItems.jsp" method="post">
 									<input type="hidden" name="itemID" value=<%=rs.getString("itemID") %>>
 									<input type="submit" class="btn btn-outline-warning border border-warning" value="Update">
 								</form></div></div><br>
 								<div class="col"><div class="md-row"><form action="delete" method="post">
 									<input type="hidden" name="itemID" value="<%=rs.getString("itemID") %>">
 									<input type="submit" class="btn btn-outline-danger border border-danger" value="Delete">
 								</form></div></div>
 								</div>
 							</td>
 						</tr>
 					</tbody>
 					<%
 						}
 					}catch(Exception e){
 						e.printStackTrace();
 					}
 					%>
 					
 				</table>
 			</div>
 			</div>
 		</div>
 	</div>
</body>
</html>