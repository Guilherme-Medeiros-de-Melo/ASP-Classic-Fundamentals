<html>
	<head>
		<!--#include file="userService.asp"-->
		<title>User Control</title>
	</head>
	<body>
		<%
		Dim userServ
		Set userServ = new userService
        
		action = Request.Form("action")
		userId = Request.Form("userId")
		user = Request.Form("user")
        password = Request.Form("password")
		role = Request.Form("role")

		if action = "addUser" then 
                userServ.addUser user, password, role
        elseif action = "updateUser" then
                userServ.updateUser userId, user, password, role
        elseif action = "deleteUser" then
                userServ.deleteUser userId
        elseif action = "getUser" then
                userServ.getUser
        end if

        Response.Redirect "http://localhost/index.asp"
		%>
	</body>
</html>