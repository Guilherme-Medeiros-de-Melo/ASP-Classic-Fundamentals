<html>
	<head>
		<!--#include file="userService.asp"-->
		<!--#include file="taskService.asp"-->
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

			th {
				width: 30%;
			}
		</style>
	</head>
	<body>
		<%
		Dim userServ
		Set userServ = new userService

		Dim userList
		Set userList = userServ.getUsers

		Dim taskServ
		Set taskServ = new taskService

		Dim taskList
		Set taskList = taskServ.getTasks
		%>
		<div style="width: 40%; text-align: center; float: left;">
			<ul>
				<p>USERS</p>
				<form action="addUser.asp" method="post">
					<input type="submit" value="Add User">
				</form>
				<p/>
				<table style="width: 100%;">
					<tr>
						<th style="width:10%;">Id</th>
						<th>User</th>
						<th>Password</th>
						<th>Role</th>
						<th style="width:10%;">Action</th>
					</tr>
						<%
						Do Until userList.EOF%>
							<tr>
								<td><%response.write(userList.fields(0).value)%></td>
								<td><%response.write(userList.fields(1).value)%></td>
								<td><%response.write(userList.fields(2).value)%></td>
								<td><%response.write(userList.fields(3).value)%></td>
								<td>
									<form action="addUser.asp" method="post">
										<input type="hidden" name="action" value="updateUser"/>
										<input type="hidden" name="userId" value="<%response.write(userList.fields(0).value)%>"/>
										<input type="submit" value="Update"></input>
									</form>
									<form action="userServiceAux.asp" method="post">
										<input type="hidden" name="action" value="deleteUser"/>
										<input type="hidden" name="userId" value="<%response.write(userList.fields(0).value)%>"/>
										<input type="submit" value="Delete"></input>
									</form>
								</td>
							</tr>
						<%
							userList.MoveNext
						Loop
						%>
				</table>
			</ul>
		</div>
		<div style="width: 40%; text-align: center; float: left;">
			<ul>
				<p>USER TASKS</p>
				<a href="addTask.asp">Add Task</a>
				<p/>
				<table style="width: 100%;">
					<tr>
						<th style="width:10%;">Id</th>
						<th>User Id</th>
						<th>Description</th>
						<th>Added Date</th>
						<th>Due Date</th>
						<th style="width:10%;">Action</th>
					</tr>
						<%
						Do Until taskList.EOF%>
							<tr>
								<td><%response.write(taskList.fields(0).value)%></td>
								<td><%response.write(taskList.fields(1).value)%></td>
								<td><%response.write(taskList.fields(2).value)%></td>
								<td><%response.write(taskList.fields(3).value)%></td>
								<td><%response.write(taskList.fields(4).value)%></td>
								<td>
									<form action="addUser.asp" method="post">
										<input type="hidden" name="action" value="updateUser"/>
										<input type="hidden" name="userId" value="<%response.write(taskList.fields(0).value)%>"/>
										<input type="submit" value="Update"></input>
									</form>
									<form action="userServiceAux.asp" method="post">
										<input type="hidden" name="action" value="deleteUser"/>
										<input type="hidden" name="userId" value="<%response.write(taskList.fields(0).value)%>"/>
										<input type="submit" value="Delete"></input>
									</form>
								</td>
							</tr>
						<%
							taskList.MoveNext
						Loop
						%>
				</table>
			</ul>
		</div>
	</body>
</html>