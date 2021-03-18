<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Items</title>
<link href="./assets/bootstrap.css" rel="stylesheet">
<link href="./assets/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<%
	int id = Integer.parseInt(request.getParameter("itemID"));
	String url="jdbc:mysql://localhost:3306/paf";
	String user="root";
	String pass="";
	Connection con;

	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		System.out.println("Database doesn't connect."+e);
	}

	Statement stmt;
	ResultSet rs;


%>


	<div class="order-container">
		<div class="card">
			<h3 class="card-header text-center"><strong>Update Items</strong></h3>
			<div class="card-body container">
<%
	try{
		con=DriverManager.getConnection(url,user,pass);
		stmt=con.createStatement();
	
		String  sql = "select* from items where itemID='"+id+"'";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
%>
				<form action="update" method="post">
				<input type="hidden" name="itemID" value=<%=rs.getString("itemID")%>>
					<div class="form-row">
						<div class="col">
							<div class="md-row">
								<label>Item Code</label><br>
								<input type="text" name="iCode" class="form-control border border-secondary" value=<%=rs.getString("itemCode")%>>
							</div>
						</div>
						<div class="col">
							<div class="md-row">
								<label>Item Name</label><br>
								<input type="text" name="iName" class="form-control border border-secondary" value=<%=rs.getString("itemName")%>>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<div class="md-row">
								<label>Item Price</label><br>
								<input type="text" name="iPrice" class="form-control border border-secondary" value=<%=rs.getString("itemPrice")%>>
							</div>
						</div>
						<div class="col">
							<div class="md-row">
								<label>Item Description</label><br>
								<textarea rows="3" class="form-control border border-secondary" name="iDescription"  cols=""><%=rs.getString("itemDesc")%></textarea>
							</div>
						</div>				
					</div><br>
					<div class="md-form mt-0">
						<input type="submit" class="btn btn-outline-warning form-control border border-warning " name="btnSave" value="Update">
					</div>
				</form>
				<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}%>
			</div>
		</div>
	</div>

</body>
</html>