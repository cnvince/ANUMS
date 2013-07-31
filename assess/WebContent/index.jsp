<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<script src="js/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function() {
		 checkCookie();
		
	});
	function checkCookie() {
		var id = getCookie("assess_account");
		if (id != null && id != "") {
			$(".clientid").text(id);
		} else {
			id=getUID();
			/* alert("yes"); */
			setCookie("assess_account", id, 365);
			$(".clientid").text(id);
		}
		$(".user").attr("value",id);
	};
	function getCookie(c_name) {
		var c_value = document.cookie;
		var c_start = c_value.indexOf(" " + c_name + "=");
		if (c_start == -1) {
			c_start = c_value.indexOf(c_name + "=");
		}
		if (c_start == -1) {
			c_value = null;
		} else {
			c_start = c_value.indexOf("=", c_start) + 1;
			var c_end = c_value.indexOf(";", c_start);
			if (c_end == -1) {
				c_end = c_value.length;
			}
			c_value = unescape(c_value.substring(c_start, c_end));
		}
		return c_value;
	}
	function setCookie(c_name,value,exdays)
	{
	/* alert("test"); */
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
	}
	/* generate a unqiue ID */
	function getUID()
	{
		return ((new Date()).getTime() + "" + Math.floor(Math.random() *
				100)).substr(0, 18);
	}
</script>
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<div class="container">
		<section id="content">
		<form action="assess.jsp" method="get">
			<h1>ANUMS</h1>
			Thank you for you cooperation
			Your client ID is <a class="clientid" id="user"></a>
			<input type="hidden" class="user" id="name" name="user" value="">
			<div>
				<input type="submit" value="Start" />
			</div>
		</form>
		<!-- form --> </section>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>