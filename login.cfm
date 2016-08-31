<html>

<head>
<link rel="shortcut icon" href="../favicon.ico">
<meta name="viewport" content="user-scalable=no, width=device-width" />
<title>ColdFusion Administrator Mobile Login</title>
<script src="js/jquery.js"></script>
<script>
$(document).ready(function() {

	$("#loginForm").submit(function(e) {
		var username = $.trim($("#username").val());
		var password = $.trim($("#password").val());
		var s = "";
		if(username == '') s += "Username is required.<br/>";
		if(password == '') s += "Password is required.<br/>";
		if(s != '') {
			$("#status").html(s);
			e.preventDefault();
		}
	})
})
</script>
<style>
#loginDiv {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
}
body, p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
}
#status {
	font-weight: bold;
}
</style>
</head>

<body>

<div id="loginDiv">
<img src="images/loginlogo.png" title="ColdFusion">
<div id="status">
<cfif structKeyExists(url, "loginerror") and url.loginerror is true>
Login Failed<br/>
</cfif>
</div>
<form action="index.cfm" id="loginForm" method="post">
<input type="text" name="username" id="username"  placeholder="Username"><br/>
<input type="password" name="password" id="password" placeholder="Password"><br/>
<input type="submit" value="Login">
</form>
</div>