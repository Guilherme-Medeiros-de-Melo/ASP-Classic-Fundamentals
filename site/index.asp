<html>
	<head>
		<title>User Control</title>
		<style>
			* {
				box-sizing: border-box;
			}
			table, th, td {
				border: 1px solid black;
				border-collapse: collapse;
				padding-left: 5px;
				padding-right: 5px;
				padding-top: 3px;
  				padding-bottom: 3px;
			}

			div {
				width: 50%;
			}

			th {
				width: 30%;
			}
		</style>
	</head>
	<body>
		<%
		Set connection = Server.CreateObject("ADODB.Connection")
                
        connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"

		Dim userList

		Set userList = connection.Execute("select * from Users;")
		%>
		<div style="width: 20%; text-align: center; float: left;">
			<ul>
				<p>USERS</p>
				<a href="addUser.asp">Add</a>
				<a href="addUser.asp">Update</a>
				<a href="addUser.asp">Delete</a>
				<p/>
				<table style="width: 100%;">
					<tr>
						<th>Id</th>
						<th>User</th>
						<th>Password</th>
						<th style="width:10%;">Action</th>
					</tr>
						<%
						Do Until userList.EOF%>
							<tr>
								<td><%response.write(userList.fields(0).value)%></td>
								<td><%response.write(userList.fields(1).value)%></td>
								<td><%response.write(userList.fields(2).value)%></td>
								<td>
									<form action="userService.asp" method="post">
										<input type="hidden" name="action" value="updateUser"/>
										<input type="hidden" name="userId" value="<%response.write(userList.fields(0).value)%>"/>
										<input type="submit" value="Update"></input>
									</form>
								</td>
							</tr>
						<%
							userList.MoveNext
						Loop
						%>
					</tr>
				</table>
			</ul>
		</div>
		<div style="width: 20%; text-align: center; float: left;">
			<ul>
				<p>USER TASKS</p>
				<a href="addTask.asp">Add</a>
				<a href="addTask.asp">Update</a>
				<a href="addTask.asp">Delete</a>
				<p/>
				<table style="width: 100%;">
					<tr>
						<th>Id</th>
						<th>User</th>
						<th>Password</th>
						<th style="width:10%;">Action</th>
					</tr>
						<%
						Do Until userList.EOF%>
							<tr>
								<td><%response.write(userList.fields(0).value)%></td>
								<td><%response.write(userList.fields(1).value)%></td>
								<td><%response.write(userList.fields(2).value)%></td>
								<td><a href="test.html">Update</a></td>
							</tr>
						<%
							userList.MoveNext
						Loop
						%>
					</tr>
				</table>
			</ul>
		</div>
	</body>
</html>