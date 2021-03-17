<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="./assets/bootstrap.css" rel="stylesheet">
<link href="./assets/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="order-container">
		<div class="card">
			<h3 class="card-header text-center">
				<strong>Add Items</strong>
			</h3>
			<div class="card-body container">
				<form action="#" method="post">
					<div class="form-row">
						<div class="col">
							<div class="md-row">
								<label>Item Code</label><br>
								<input type="text" name="iCode" class="form-control border border-secondary" placeholder="Item Code">
							</div>
						</div>
						<div class="col">
							<div class="md-row">
								<label>Item Name</label><br>
								<input type="text" name="iName" class="form-control border border-secondary" placeholder="Item Name">
							</div>
						</div>				
					</div>
					<div class="form-row">
						<div class="col">
							<div class="md-row">
								<label>Item Price</label><br>
								<input type="text" name="iPrice" class="form-control border border-secondary" placeholder="Item Price">
							</div>
						</div>
						<div class="col">
							<div class="md-row">
								<label>Item Description</label><br>
								<textarea rows="3" class="form-control border border-secondary" name="iDescription" placeholder="Decription" cols=""></textarea>
							</div>
						</div>				
					</div><br>
					
					<div class="md-form mt-0">
						<input type="text" class="btn btn-outline-success form-control border border-success " name="btnSave" value="Save">
						
					</div>
					
				</form>
				
			</div>
		</div>
	</div>

</body>
</html>