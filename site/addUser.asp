<html>
	<head>
		<title>User Control</title>
	</head>
	<body>
		<div style="text-align: left; position: absolute;">
			<ul>
				<p>ADD USER<p>
				<form action="userService.asp" method="post">
					<p> 
						<label for="user">Nome:</label><br>
						<input id="user" name="user"/> 
					</p>
					<p> 
						<label for="password">Password:</label><br>
						<input id="password" name="password"/> 
					</p>
					<button type="submit">Submit</button> 
				</form>
			</ul>
		</div>
	</body>
</html>