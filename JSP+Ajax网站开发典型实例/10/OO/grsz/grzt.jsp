<HTML>
<HEAD>
<TITLE>�û�״̬�޸�</TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate(){
   createXMLHttpRequest();
   var status1=document.getElementById("radStatus1").checked;
   var status2=document.getElementById("radStatus2").checked;
   var status3=document.getElementById("radStatus3").checked;
   var status;
   if(status1==true)
      status="��ְ";
   if(status2==true)
      status="����";
   if(status3==true)
      status="�ݼ�"; 
  var str="status="+status;
   var url="grzt1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("״̬�޸ĳɹ�");}
    }
}
</script>
</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
        <td class="guide"><img src="guide.gif" align="absmiddle">
		�����趨&gt;&gt;�޸ĸ���״̬</td>
  </tr>
</table>
<form name="form1" method="post" action="">
    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="maintable">
		<tr > 
			<td align="center" valign="middle"> 
				<p>
				<table width="70%">
					<tr bgcolor="E4EAF4">
				
						<td align="center">
<label>
							<input type="radio" name="radStatus" value="1" id="radStatus1" >
							��ְ</label>
					
				
						<td align="center">
<label>
							<input type="radio" name="radStatus" id="radStatus2"  value="2" >
							����</label>
					
				
						<td align="center">
<label>
							<input type="radio" name="radStatus" id="radStatus3" value="3" >
							�ݼ�</label>
					
				
					
				</table>
				
		  </td>
		</tr>
	</table>
<input type=button value=�趨״̬ onclick=validate()>
</form>
</BODY>
</HTML>
