<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<title>��ʾ�û���ѡ��</title>
    <style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
</head>
<body>
<center>
<%
request.setCharacterEncoding("gb2312");
String msg="";
String sex=request.getParameter("sex");
String[] fruit=request.getParameterValues("fruit");
int len=fruit.length;
if(sex==null){
msg="��ѡ���Ա�<br>";
}
if(sex.equals("��")){
msg="������ã�<br>";
}
if(sex.equals("Ů")){
msg="Ůʿ��ã�<br>";
}
if(len==0){
msg=msg+"��ѡ����ϲ����ˮ��!";
}
else{
out.print("<p>лл��Ĳ���</p><br>");
msg=msg+"��ѡ���ˣ�";
for(int i=0;i<len;i++){
msg=msg+fruit[i]+"/";
}
}
out.print(msg);
%>
<center>
</body>
</html>
