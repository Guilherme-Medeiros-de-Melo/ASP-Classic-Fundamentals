<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
            Dim connection
            Set connection = Server.CreateObject("ADODB.Connection")
                
            connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"

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

                Set rs = Server.CreateObject("ADODB.Recordset")
                rs.Open "Select * from Users;", connection, 3, 3

                rs.AddNew
                    rs("user") = user
                    rs("password") = password
                
                rs.Update

                Response.write("user: " & user & " added")

                rs.Close
                connection.Close

                Set rs = Nothing
                Set connection = Nothing
            End Sub

            Sub updateUser()
                userId = Request.Form("userId")

                Set rs = Server.CreateObject("ADODB.Recordset")
                rs.Open "Select * from Users Where id=" & userId & ";", connection, 3, 3

                rs.UpdateBatch
                    rs("user") = "UPDATED"
                    rs("password") = "UPDATED"
                
                rs.Update

                rs.Close
                connection.Close

                Set rs = Nothing
                Set connection = Nothing

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