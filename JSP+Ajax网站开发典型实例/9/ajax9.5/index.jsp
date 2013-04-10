<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <script language="JavaScript" src="prototype1.6.js"></script>
    <script language="JavaScript" src="buffalo.js"></script>
    <script language="javascript">
    var endPoint="<%=request.getContextPath()%>/bfapp";
    var buffalo = new Buffalo(endPoint);
	var string_value;
    function getShopping() 
    {
        buffalo.remoteCall("ShoppingService.getShopping", [], fill);
    	var string_html="<table width='100%' border='1' align='center'>";
	    function fill(reply)
	    {
	    	string_value=reply.getResult();
	    	var temp_value=string_value.split(";");
	    	for(var j=0;j<temp_value.length-1;j++)
	    	{    		
	    		var newArray=temp_value[j].split(",");	    		
	    		string_html=string_html.concat("<tr>");	    		
	    		string_html=string_html.concat('<td width="25%"><center>'+newArray[1]+'</center></td><td width="25%"><center>'+newArray[2]+'</center></td><td width="25%"><center><a href="#" onclick=delShopping("'+newArray[0]+'")>删除商品</a></center></td>');	    		
	    		string_html=string_html.concat("</tr>");
	    	}
	    	$("shoppinglist").innerHTML=" ";
	    	$("shoppinglist").innerHTML=string_html.concat("</table>");
	    }
    }
    function buyShopping()
    {
    	if($("num").value=="")
    	{
    		alert("购买数量不能为空！");
    		return false;
    	}
    	else
    	{
	    	buffalo.remoteCall("ShoppingService.addShopping", [$("name").value,$("num").value], buyRtn);
	    	function buyRtn(replay)
	    	{
	    		var jg=replay.getResult();
	    		if(jg)
	    			getShopping();
	    	}
    	}
    }
    function delShopping(id)
    {
    	buffalo.remoteCall("ShoppingService.delShopping", [id], getShopping);
    }
    </script> 
  </head>
<body onLoad="getShopping()" background="bg.gif">
<center><h2>Buffalo框架实现简单购物车</h2></center>
  <table width="75%" border="1" align="center">
    <tr>
      <td colspan="2"><center>商品列表:
        <select name="name">
          <option value="apple">apple</option>
          <option value="Pear">Pear</option>
          <option value="Banana">Banana</option>
          <option value="orange">orange</option>
          <option value="Watermelon">Watermelon</option>
        </select>
		&nbsp;&nbsp;购买数量:<input type="text" name="num">&nbsp;&nbsp;
        <input type="button" value="购买" onClick="buyShopping()">
      </center></td>
      <td colspan="2"><center>下面是购物车中的商品</center></td>
    </tr>
  </table>
 <table width="75%" border="1" align="center">
     <tr><td width="25%"><center>商品名称</center></td>
      <td width="25%"><center>购买数量</center></td>
      <td width="25%"><center>删除商品</center></td>
    </tr>
 </table>
 <center> 
 <div id="shoppinglist" style="width:75%"></div>
 </center>
  </body>
</html>
