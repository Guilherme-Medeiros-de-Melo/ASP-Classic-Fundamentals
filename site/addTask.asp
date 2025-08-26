<html>
	<head>
		<!--#include file="userService.asp"-->
		<title>User Control</title>
	</head>
	<body>
		<%
		Dim userServ
		Set userServ = new userService

		Dim userList
		Set userList = userServ.getUsers

		taskId = Request.Form("taskId")
		action = Request.Form("action")
		%>
		<div style="text-align: left; position: absolute;">
			<ul>
				<p>ADD/UPDATE TASK<p>
				<form action="taskServiceAux.asp" method="post">
					<%if action = "updateTask" Then%>
					<input type="hidden" name="action" value="updateTask"/>
					<input type="hidden" name="taskId" value="<%=taskId%>"/>
					<%else%>
					<input type="hidden" name="action" value="addTask"/>
					<%end if%>
					
					<%if action = "updateTask" then%>
					<%else%>
						<label for="userId">User:</label><br>
						<select id="userId" name="userId">
							<%Do until userList.EOF%>
							<option value="<%=userList.fields(0)%>"><%=userList.fields(1)%></option>
							<%
								userList.MoveNext
							Loop
							%>
						</select>
					<%End if%>

					<p> 
						<label for="description">Description:</label><br>
						<input id="description" name="description"/> 
					</p>
					<p> 
						<label for="dueDate">Due Date:</label><br>
						<input id="dueDate" type="date" name="dueDate"/> 
					</p>
					<button type="submit">Submit</button> 
				</form>
			</ul>
		</div>
	</body>
</html>