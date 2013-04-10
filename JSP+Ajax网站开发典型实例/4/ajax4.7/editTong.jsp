<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>
<html>
<head>
<script language="javascript">
function check()
{
	if(f.name.value=="")
	{
		alert("姓名必须填写！");
		return false;
	}
	if(f.age.value!="")
	{
		if(isNaN(f.age.value))
		{
			alert("年龄必须是数字格式！");
			return false;
		}
	}
	if(f.phone.value!="")
	{
		if(isNaN(f.phone.value))
		{
			alert("电话必须是数字格式！");
			return false;
		}
	}
	if(f.qq.value!="")
	{
		if(isNaN(f.qq.value))
		{
			alert("QQ必须是数字格式！");
			return false;
		}
	}
}
</script>
</head>
<body>
<% 
TongBean tb=(TongBean)session.getAttribute("tongOne"); 
 %>
  <center><h2>修改信息</h2></center><br>
<form action="DBServlet.html?type=update" method="post" name="f" onsubmit="return check()">
<center>
<input type="hidden" name="id" value="<%=tb.getId() %>">
姓名：<input type="text" name="name" value="<%=tb.getName() %>"><br>
年龄：<input type="text" name="age" value="<%=tb.getAge() %>"><br>
性别：<input type="text" name="sex" value="<%=tb.getSex() %>"><br>
地址：<input type="text" name="address" value="<%=tb.getAddress() %>"><br>
电话：<input type="text" name="phone" value="<%=tb.getPhone() %>"><br>
Q Q: <input type="text" name="qq" value="<%=tb.getQq() %>"><br>
电邮：<input type="text" name="email" value="<%=tb.getEmail() %>"><br>
<input type="submit" value="修改" >
</center>
</form>
</body>
</html>
