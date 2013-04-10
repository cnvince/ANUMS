<html>
<head>
<title>
查找日程安排
</title>
</head>
<BODY topmargin="0" bgcolor="FBFDFC">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC"> <img src="guide.gif"  align="absmiddle">
      考勤管理&gt;&gt;考勤查询</td>
	  <td align="right" class="guide" >&nbsp;</td>
  </tr>
</table>
<br> 
<hr> 
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="maintable">
  <form name="form1" method="post" action="kaoc1.jsp">
        <tr> 
      <td height="26" colspan="4" bgcolor="D0DCED">&nbsp;</td>
    </tr>
    <tr bgcolor="E1E9F4"> 
      <td width="11%" class="deep">人员名称</td>
      <td width="39%" class="tint"><input type="text" size="15" name="user" id="user">
</td>
      <td width="11%" class="deep">选择时间</td>
      <td width="39%" class="tint">
<select  name="year" id="year">
<option  value=2007>2007</option>
<option selected value=2008>2008</option>
<option  value=2009>2009</option>
<option  value=2010>2010</option>
<option  value=2011>2011</option>
<option  value=2012>2012</option>
<option  value=2013>2013</option>
<option  value=2014>2014</option>
<option  value=2015>2015</option>
</select>年
<select  name="month" id="month">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option selected value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>月</td>
    </tr>
   <tr><td><input type=submit value="提交"></td><td><input type=reset value=重置></td></tr> 
</table>
</body>
</html>