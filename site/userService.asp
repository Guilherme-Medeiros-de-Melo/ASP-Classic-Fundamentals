<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
            user = Request.Form("user")
            password = Request.Form("password")
            Response.write("nome" & user & "senha" & password)
            Dim connection

            Set connection = Server.CreateObject("ADODB.Connection")
            
            connection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db_controller.mdb") & ";"

            Set add = Server.CreateObject("ADODB.Recordset")

            add.Open "Select * from Users;", connection, 3, 3

            add.AddNew
                add("user") = user
                add("password") = password
            
            add.Update

            add.Close
            connection.Close

            Set add = Nothing
            Set connection = Nothing
        %>
</html>