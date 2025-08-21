<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
            'dbserver = ""
            'dbcatalog = ""
            'dblogin = ""
            'dbpassword = ""
            'connection string
            'Set conn = Server.CreateObject("ADODB.Connection")
            'conn.Open = "Provider=SQLOLEDB; Data Source=" & dbserver & ";Initial Catalog=" & dbcatalog & ";User Id=" & dblogin & ";Password=" & dbpassword

            nome = Request.Form("name")
            password = Request.Form("password")

            Dim connection

            Set connection = Server.CreateObject("ADODB.Connection")
            
            connection.Open "test"

            if connections.errors.count = 0 then

                Response.write "Connection OK"

            End if

            Set add = Server.CreateObject("ADODB.Recordset")

            add.Open "Users", connection, 3, 3

            add.AddNew

                add("name") = name
                add("password") = password
            
            add.Update
            add.Close
            connection.Close

            Set add = Nothing
            Set connection = Nothing
        %>
</html>