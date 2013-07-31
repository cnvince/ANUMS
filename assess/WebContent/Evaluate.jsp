<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(
		function()
		{
			$('#filename').click(function()
					{
						windows.alert("test");
					})
		}
		);
</script>
<title>Evaluate</title>
</head>
<body>
 <fieldset>
        <legend>Upload File</legend>
        <form action="/Evaluate.do" method="post" enctype="multipart/form-data">
            <label for="fileName">Select File: </label>
            <input id="path" type="text" name="path" size="30"><br/>
            <input id="fileName" type="file" name="fileName" size="30"/><br/>            
            <input type="submit" value="Upload"/>
        </form>
    </fieldset>
</body>
</html>