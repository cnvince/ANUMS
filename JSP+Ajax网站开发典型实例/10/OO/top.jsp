<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*"%>
<html>
<head>
<title>top</title>
<script language="JavaScript">
function findObj(n, d) {
	var p,i,x;
	if(!d) d=document;
	if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
		if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=findObj(n,d.layers[i].document);
	if(!x && d.getElementById) x=d.getElementById(n); return x;
}
// usage: showHideLayers('Layer1','','show','Layer2','','hide')
function showHideLayers() {
	var i,p,v,obj,args=showHideLayers.arguments;
	for (i=0; i<(args.length-2); i+=3)
		if ((obj=findObj(args[i]))!=null) {
			v=args[i+2];
			if (obj.style) { obj=obj.style; v=(v=='show')?'block':(v=='hide')?'none':v; }
			//obj.visibility=v;
			//alert(v);
			obj.display = v;
		}
}
var selectedMenu = 'grbg';
var selectedItems = 'grbgMenu';
var selectedItem = 'dbsy';
//����ҳ��Ԫ�ص�CSS
//eleName ҳ��Ԫ������
//className Ҫ�л���CSS����
function setClass(eleName,clsName) {
	document.all(eleName).className = clsName;
	selectedMenu = document.all(eleName);
}

// �˵�ת��
function changeMenu(topMenuName, menuName, firstItem, href) {
	var obj1 = findObj(selectedMenu)
	obj1.className = "tab2";
	var obj = findObj(topMenuName);
	selectedMenu = topMenuName;
	obj.className = "tab1";

	var obj3 = findObj(selectedItems);
	obj3.style.display = 'none';
	var obj4 = findObj(menuName);
	selectedItems = menuName;
	obj4.style.display = 'block';

	changeItem(firstItem, href);
}




function load() {
	var obj1 = findObj('grbg');
	obj1.className = "tab1";
	var obj2 = findObj('grbgMenu');
	obj2.style.display = 'block';
	var obj3 = findObj('dbsy');
	//changeItem2('dbsy', 'awaiting2/index.jsp');
}
//window.alert(selectedMenu.id);


</script>
</head>


<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0"
	onLoad="javascript:load();" >
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<div style="position:absolute; right:0; top:0;" >
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="top:0; left:0;"height="95">
	
	<tr>
		<td background="top1.gif" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			height="58" >
			<tr>
			
			  <td width="80%" colspan=2><img src="top.gif" border="0"></td>
			
				<td  valign="top">
<%
 String  str=(String)session.getAttribute("name");
 String sql="select * from oa_user where zhangh='"+str+"'";
 SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
 String Add_time = formatter.format(new java.util.Date()); 
 ResultSet rs=con.getRs(sql);
 rs.next();
 String name=rs.getString("name");
 String s="<span style='font-size:12;text-align:center'>���"+name+Add_time+"</span>";
 out.print(s);
%>
</td>
			</tr>
		</table>
	  </td>
	</tr>
	
	<tr>
	
	  <td colspan="0">
	  	    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="head_bg" >
			<tr bgcolor=2A4F98>
			   <td width="50" align="right">||</td>
			   <td>
			   
			       <table width="390" border="0" cellpadding="0" cellspacing="0" >
				     <tr align="center" valign="bottom" id="topMenu">
				     
				    	<td id="grbg" height="19" width="70" class="tab2" nowrap
							onClick="javascript:changeMenu('grbg', 'grbgMenu', 'dbsy', 'home2/index.jsp');">
						<span style="font-size:15;cursor:hand">���˰칫</span>|</td>
				    					    	
				    
				    	<td id="wltx" height="19" width="70" class="tab2" nowrap
							onClick="javascript:changeMenu('wltx', 'wltxMenu', 'jstx', 'message2/index.jsp');">
						<span style="font-size:15;cursor:hand">����ͨѶ</span>|</td>
				    					    	
				    
				    	<td id="ggxx" height="19" width="70" class="tab2" nowrap
							onClick="javascript:changeMenu('ggxx', 'ggxxMenu', 'ggl', 'bbs2/index.jsp');">
						<span style="font-size:15;cursor:hand">������Ϣ</span>|</td>
				    					    	
				    
				    	<td id="gzl" height="19" width="70" class="tab2" nowrap
							onClick="javascript:changeMenu('gzl', 'gzlMenu', 'wdgz', 'workflow2/work/index.jsp');">
						<span style="font-size:15;cursor:hand">�칫����</span>|</td>
				    					    	
				    
				    	<td id="fzbg" height="19" width="70" class="tab2" nowrap
							onClick="javascript:changeMenu('fzbg', 'fzbgMenu', 'clgl', 'vehicle2/index.jsp?packageXid=8');">
						<span style="font-size:15;cursor:hand">�����칫</span>|</td>
				    					    	
				    
				    	<td id="rlzy" height="19" width="70" class="tab2" nowrap
							onClick="javascript:changeMenu('rlzy', 'rlzyMenu', 'qjgl', 'leave/index.jsp');">
						<span style="font-size:15;cursor:hand">������Դ</span>|</td>
				    					    	
				    
				     </tr>
	             </table>	
			   </td>
			   <td align="right">
			       <table border="0" cellpadding="0" cellspacing="0" >
				     <tr align="right" valign="bottom">
					   <td height="20" background="images/top/icon/find.gif">&nbsp;&nbsp;&nbsp;					   </td>			   
					   <td>&nbsp;</td>
					   <td>&nbsp;</td>
				     </tr>
				 </table>
			   </td>
		  </tr>
	    </table>	  
	  </td>
  </tr>
	<tr>
		<td bgcolor="#EEF0EF" height="19">
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			height="19">
			<tr>
				<td  width="50"></td>
				<td>
				<table height="19" border="0" cellpadding="0" cellspacing="0"
					bgcolor="#EEF0EF"
					class="T_song12bk1" id="tbmenu">

       <tr id="grbgMenu" style="display:none">
            
              <td width="84" height="17" id="dbsy" align="right" valign="middle">�ҵ���ҳ&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="gzjh" align="right" valign="middle">
                     <a href="rwindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C">�����ƻ�&nbsp;</a></td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
              <td width="84" height="17" id="gzrw" align="right" valign="middle">
                     <a href="wg.html" target="middle" style="TEXT-DECORATION:none;color:346E7C">��������&nbsp;</a></td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
              <td width="84" height="17" id="xmgl" align="right" valign="middle">
			 <a href="xmindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C"> ��Ŀ����&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="rcap" align="right" valign="middle">
			 <a href="rcindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C"> �ճ̰���&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="gzrz" align="right" valign="middle">
			  <a href="rzindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C">������־&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="grsz" align="right" valign="middle">
			  <a href="grindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C">��������&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
                                
       </tr>

       <tr id="wltxMenu" style="display:none">
            
              <td width="84" height="17" id="jstx" align="right" valign="middle">��ʱͨѶ&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="dzyj" align="right" valign="middle">�����ʼ�&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="dxzx" align="right" valign="middle">��������&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="txl" align="right" valign="middle">ͨѶ¼&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
                                
       </tr>

       <tr id="ggxxMenu" style="display:none">
            
              <td width="84" height="17" id="ggl" align="right" valign="middle">���Ź���&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="qylt" align="right" valign="middle">��      ̳&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="zsgl" align="right" valign="middle">֪ʶ����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="zxdc" align="right" valign="middle">���ߵ���&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="wjgl2" align="right" valign="middle">�ʾ����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="wzlj" align="right" valign="middle">��ַ����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="ybqh" align="right" valign="middle">�ʱ�����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
                                
       </tr>

       <tr id="gzlMenu" style="display:none">
            
              <td width="84" height="17" id="wdgz" align="right" valign="middle">�ҵĹ���&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="fwgl" align="right" valign="middle">���Ĺ���&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="swgl" align="right" valign="middle">���Ĺ���&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="zdyk" align="right" valign="middle">�Զ����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="wjgl" align="right" valign="middle">�ļ�����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="lcgl" align="right" valign="middle">���̹���&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
                                
       </tr>

       <tr id="fzbgMenu" style="display:none">
            
              <td width="84" height="17" id="clgl" align="right" valign="middle">��������&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="hygl" align="right" valign="middle">�������&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="zcgl" align="right" valign="middle">�ʲ�����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="tsgl" align="right" valign="middle">ͼ�����&nbsp;</td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
                                
       </tr>

       <tr id="rlzyMenu" style="display:none">
            
              <td width="84" height="17" id="qjgl" align="right" valign="middle">
			<a href=qjindex.html target=middle style="TEXT-DECORATION:none;color:346E7C">  ��ٹ���&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="ccgl" align="right" valign="middle">
			 <a href=ccindex.html target=middle style="TEXT-DECORATION:none;color:346E7C"> �������&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="jbgl" align="right" valign="middle">
			 <a href=jbindex.html target=middle style="TEXT-DECORATION:none;color:346E7C"> �Ӱ����&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="kqgl" align="right" valign="middle">
			 <a href="kqindex.html" target=middle style="TEXT-DECORATION:none;color:346E7C"> ���ڹ���&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="rsda" align="right" valign="middle">
			  <a href="rsindex.html" target=middle style="TEXT-DECORATION:none;color:346E7C">���µ���&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="khgl" align="right" valign="middle">
			 <a href="khindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C"> ���˹���&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="ldht" align="right" valign="middle">
			<a href="ltindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C">  �Ͷ���ͬ&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
            
              <td width="84" height="17" id="zpgl" align="right" valign="middle">
			  <a href="zpindex.html" target="middle" style="TEXT-DECORATION:none;color:346E7C">��Ƹ����&nbsp;</a>
			  </td>    
			    <td width="15">&nbsp;<img src="images/top/line_sp2.gif" height="16" align="absbottom" ></td>    
                                
       </tr>
			</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>