<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
        class taskService
            Dim connection
            Private Sub Class_Initialize()	
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
	        End Sub
            
            Sub addTask(userId, description, dueDate)
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
                
                Set rs = Server.CreateObject("ADODB.Recordset")
                rs.Open "Select * from Tasks;", connection, 3, 3

                rs.AddNew
                    rs("userId") = userId
                    rs("description") = description
                    rs("dueDate") = dueDate
                
                rs.Update

                Response.write("task: " & description & " added")

                rs.Close
                connection.Close

                Set rs = Nothing
                Set connection = Nothing

                aspLog("task added")
            End Sub

            Sub updateTask(taskId, description, dueDate)
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")
                
                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"

                Set rs = Server.CreateObject("ADODB.Recordset")
                rs.Open "Select * from tasks Where id=" & taskId & ";", connection, 3, 3

                rs.UpdateBatch
                    rs("id") = taskId
                    rs("description") = description
                    rs("dueDate") = dueDate

                rs.Update

                rs.Close
                connection.Close

                Set rs = Nothing
                Set connection = Nothing

                aspLog("task updated")
            End Sub

            Sub deleteTask(taskId)
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")

                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
                
                connection.Execute("Delete from Tasks Where id="&taskId&";")
                
                aspLog("task deleted")
            End Sub

            Function getTasks()
                Dim connection	
                Set connection = Server.CreateObject("ADODB.Connection")

                connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"
                
                Set gettasks = connection.Execute("select * from Tasks;")
                
                aspLog("tasks got")
            End Function

            function aspLog(value)
                response.Write("<script language=javascript>console.log(`'" & value & "'`); </script>")
            end function

        End Class
        %>
</html>