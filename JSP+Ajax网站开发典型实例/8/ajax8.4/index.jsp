<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String province=request.getParameter("province");//接受参数值
String city="";
if(province.equals("hn"))
	city="郑州市<br>开封市<br>洛阳市<br>平顶山市<br>安阳市<br>鹤壁市<br>新乡市<br>焦作市<br>濮阳市<br>许昌市<br>漯河市<br>三门峡市<br>南阳市<br>商丘市<br>信阳市<br>周口市<br>驻马店市<br>济源市";
if(province.equals("gd"))
	city="广州市<br>深圳市<br>珠海市<br>汕头市<br>韶关市<br>佛山市<br>江门市<br>湛江市<br>茂名市<br>肇庆市<br>惠州市<br>梅州市<br>汕尾市<br>河源市<br>阳江市<br>清远市<br>东莞市<br>中山市<br>潮州市<br>揭阳市<br>云浮市";
if(province.equals("js"))
	city="南京市<br>无锡市<br>徐州市<br>常州市<br>苏州市<br>南通市<br>连云港市<br>淮安市<br>盐城市<br>扬州市<br>镇江市<br>泰州市<br>宿迁市";
out.print(city);
%>

