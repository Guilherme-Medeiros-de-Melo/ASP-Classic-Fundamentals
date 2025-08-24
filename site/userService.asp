<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
        class userService
            Dim connection
            Private Sub Class_Initialize()	
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
	        End Sub
            
            Sub addUser(user, password)
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
                
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

                aspLog("Users got")
            End Sub

            Sub updateUser()
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"

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

                aspLog("Users got")
            End Sub

            Sub deleteUser(userId)
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")

                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
                
                connection.Execute("Delete from Users Where id="&userId&";")
                aspLog("Users got")
            End Sub

            Function getUsers()
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")

                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
                
                Set getUsers = connection.Execute("select * from Users;")
                aspLog("Users got")
            End Function

            function aspLog(value)
                response.Write("<script language=javascript>console.log(`'" & value & "'`); </script>")
            end function

        End Class
        %>
</html>