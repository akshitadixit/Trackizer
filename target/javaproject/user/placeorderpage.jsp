<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/trackizer", "root" , "root" ); Statement st=con.createStatement(); 
    %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Order</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../template/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../template/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../template/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../template/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../template/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="../images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="placeorder.jsp">
					<span class="login100-form-title">
						Place Order
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Username cannot be empty">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-users" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Source cannot be empty">
						<input class="input100" type="text" name="src" placeholder="Source">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-building-o" aria-hidden="true"></i>
						</span>
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Destination cannot be empty">
						<input class="input100" type="text" name="dest" placeholder="Destination">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-building" aria-hidden="true"></i>
						</span>
					</div>

                    <%
                        Random ran = new Random();
                    %>

                    <div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="bill" value= '<%=(ran.nextInt(5000 - 1000) + 1000) +".00"%>' readonly="readonly">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-rupee" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Select retailer">
						<input class="input100" list="retailers" name="retailer">
						<datalist id="retailers">
							<% 
                        String sql= "select username from retailer;"; 
                        ResultSet i=st.executeQuery(sql);
                        while(i.next())
                        { 
                    		%>
							<option value='<%=i.getString("username")%>'>
							<% } %>
						</datalist>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i>
						</span>
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Make Payment!">
						<input class="input100" type="checkbox" name="payment">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Confirm
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="../template/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../template/vendor/bootstrap/js/popper.js"></script>
	<script src="../template/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../template/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../template/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="../js/main.js"></script>

</body>
</html>