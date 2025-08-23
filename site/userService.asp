<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
            action = Request.Form("action")

            if action = "addUser" then 
                addUser()
            elseif action = "updateUser" then
                updateUser()
            elseif action = "deleteUser" then
                deleteUser()
            elseif action = "getUser" then
                getUser()
            end if
            
            Sub addUser()
                user = Request.Form("user")
                password = Request.Form("password")

                Dim connection

                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"

                Set add = Server.CreateObject("ADODB.Recordset")

                add.Open "Select * from Users;", connection, 3, 3

                add.AddNew
                    add("user") = user
                    add("password") = password
                
                add.Update

                Response.write("user: " & user & " added")

                add.Close
                connection.Close

                Set add = Nothing
                Set connection = Nothing
            End Sub

            Sub updateUser()
                Response.write("user: " & user & "updated")
            End Sub

            Sub deleteUser()
                Response.write("user: " & user & "deleted")
            End Sub

            Sub getUser()
                Response.write("user list got")
            End Sub
        %>
</html>