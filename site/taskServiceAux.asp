<html>
	<head>
		<!--#include file="taskService.asp"-->
		<title>User Control</title>
	</head>
	<body>
		<%
		Dim taskServ
		Set taskServ = new taskService
        
		action = Request.Form("action")
        userId = Request.Form("userId")
		taskId = Request.Form("taskId")
		description = Request.Form("description")
        dueDate = Request.Form("dueDate")
		addedDate = Request.Form("addedDate")

		if action = "addTask" then 
                taskServ.addTask userId, description, dueDate
        elseif action = "updateTask" then
                taskServ.updateTask taskId, description, dueDate
        elseif action = "deleteTask" then
                taskServ.deleteTask taskId
        elseif action = "getTask" then
                taskServ.getTask
        end if

        Response.Redirect "http://localhost/index.asp"
		%>
	</body>
</html>