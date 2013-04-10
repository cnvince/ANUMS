<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>
<%
	double firstnum;
	double secondnum;
	String op;
	try
	{
	firstnum=Double.parseDouble(request.getParameter("firstnum"));
	secondnum=Double.parseDouble(request.getParameter("secondnum"));
	}
	catch(Exception e)
	{
		firstnum=0;
		secondnum=0;
	}
	op=request.getParameter("op");
	if(op==null||op.equals("null")||op.equals(""))
		op="+";
	CalculatorBean cb=new CalculatorBean(firstnum,secondnum,op);

%>
<html>
  <head>
<script language="javascript">
function check()
{
	if(f.firstnum.value=="")
	{
		alert("不能有空！");
		return false;
	}
	if(f.secondnum.value=="")
	{
		alert("不能有空！");
		return false;
	}
	if(isNaN(f.firstnum.value))
	{
		alert("必须是数字");
		return false;
	}
	if(isNaN(f.secondnum.value))
	{
		alert("必须是数字");
		return false;	
	}
	if(f.op.options.selectedIndex==3&&f.secondnum.value.substring(0,1)==0)
	{
		alert("除数不能为0");
		return false;
	}
}
</script>
  </head>
  <body>
  <center>简单计算器</center>
  <form action="index.jsp" method="post" name="f" onsubmit="return check()">
<table width="60%" align="center">
<tr><td><input type="text" name="firstnum" value="<%=cb.getFirstnum() %>"></td><td><select name="op"><option value="+" <% if(cb.getOp().equals("+")) out.print("selected"); %>>加</option><option value="-" <% if(cb.getOp().equals("-")) out.print("selected"); %>>减</option><option value="*" <% if(cb.getOp().equals("*")) out.print("selected"); %>>乘</option><option value="/" <% if(cb.getOp().equals("/")) out.print("selected"); %>>除</option></select></td><td><input type="text" name="secondnum" value="<%=cb.getSecondnum() %>"></td><td><input type="submit" value="计算"></td><td><input type="text" readonly="true" value="<%=cb.calculator() %>"></td></tr>
</table>
</form>
  </body>
</html>
