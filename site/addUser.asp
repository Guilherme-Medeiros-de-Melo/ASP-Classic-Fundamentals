<html>
	<head>
		<title>User Control</title>
	</head>
	<body>
		<%
		userId = Request.Form("userId")
		action = Request.Form("action")
		%>
		<div style="text-align: left; position: absolute;">
			<ul>
				<p>ADD/UPDATE USER<p>
				<form action="userServiceAux.asp" method="post">
					<%if action = "updateUser" Then%>
					<input type="hidden" name="action" value="updateUser"/>
					<input type="hidden" name="userId" value="<%=userId%>"/>
					<%else%>
					<input type="hidden" name="action" value="addUser"/>
					<%end if%>
					<p> 
						<label for="user">Nome:</label><br>
						<input id="user" name="user"/> 
					</p>
					<p> 
						<label for="password">Password:</label><br>
						<input id="password" name="password"/> 
					</p>
					<p> 
						<label for="role">User Role:</label><br>
						<input type="radio" id="role" name="role" value="User">
						<label for="role">User</label><br>
						<input type="radio" id="role" name="role" value="Manager">
						<label for="role">Manager</label><br>
						<input type="radio" id="role" name="role" value="Admin">
						<label for="role">Admin</label>
					</p>
					<button type="submit">Submit</button> 
				</form>
			</ul>
		</div>
	</body>
</html>