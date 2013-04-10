<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <script language="JavaScript" src="prototype1.6.js"></script>
    <script language="JavaScript" src="buffalo.js"></script>
    <script language="javascript">
    var endPoint="<%=request.getContextPath()%>/bfapp";
    var buffalo = new Buffalo(endPoint);
function check()
{
	if($("firstnum").value=="")
	{
		alert("不能有空！");
		return false;
	}
	else if($("secondnum").value=="")
	{
		alert("不能有空！");
		return false;
	}
	else if(isNaN($("firstnum").value))
	{
		alert("必须是数字");
		return false;
	}
	else if(isNaN($("secondnum").value))
	{
		alert("必须是数字");
		return false;	
	}
	else if($("op").options.selectedIndex==3&&$("secondnum").value.substring(0,1)==0)
	{
		alert("除数不能为0");
		return false;
	}
	else
	{
		buffalo.remoteCall("CalculatorService.calculator", [$("firstnum").value,$("op").value,$("secondnum").value], fill);
		function fill(reply)
		{
			$("thirdnum").value=reply.getResult();
		}
	}	
}  
   </script>
  </head>
<body background="bg.gif">
<center><h2>Buffalo框架实现简单计算器</h2></center>
<center>
<table width="60%" align="center">
<tr><td><input type="text" name="firstnum"></td><td><select name="op"><option value="+" >加</option><option value="-">减</option><option value="*">乘</option><option value="/">除</option></select></td><td><input type="text" name="secondnum"></td><td><input type="button" value="计算" onclick="check()"></td><td><input type="text" readonly="true" id="thirdnum"></td></tr>
</table>
</center>
</body>
</html>
