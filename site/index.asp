<html>
	<head>
		<title>User Control</title>
	</head>
	<body>
		<%
			response.write("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=DESKTOP-HO7UDGJ\SQLEXPRESS;")
		%>
		<div style="text-align: center">
			<ul>
				<p>USERS<p>
				<a href="addUser.asp">Add</a>
				<a href="addUser.asp">Update</a>
				<a href="addUser.asp">Delete</a>
			</ul>
			<ul>
				<p>USER TASKS</p>
				<a href="addTask.asp">Add</a>
				<a href="addTask.asp">Update</a>
				<a href="addTask.asp">Delete</a>
			</ul>
		</div>
	</body>
</html>