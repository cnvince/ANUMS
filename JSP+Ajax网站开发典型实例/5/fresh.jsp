<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�Զ�ˢ��</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <script language="javascript">
       var XMLHttpReq;//����XMLHttpRequest����       
      function createXMLHttpRequest() {
              if(window.XMLHttpRequest) { //Mozilla �����
                     XMLHttpReq = new XMLHttpRequest();
              }
              else if (window.ActiveXObject) { // IE�����
                     try {
                           XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                     } catch(e){
                           try {
                              XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                           } catch (e) {}
                     }
              }
       }
      //����������
       function sendRequest() {
              createXMLHttpRequest();
              var url = "Random.jsp";
              XMLHttpReq.open("GET", url, true);
              XMLHttpReq.onreadystatechange = processResponse;//ָ����Ӧ����
              XMLHttpReq.send(null);  // ��������
       }
       // ��������Ϣ����
       function processResponse() {
       if (XMLHttpReq.readyState == 4) { // �ж϶���״̬
              if (XMLHttpReq.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
                      var str =XMLHttpReq.responseText;
                      document.getElementById("show").innerHTML=(str+"��");
                      setTimeout("sendRequest()", 726);
              } else { //ҳ�治����
                    window.alert("���������ҳ�����쳣��");
              }
         }
      }     
</script>
  <body onload =sendRequest()><br>
  <center>
    <b>ʵʱ��������</b><br><br>
    <div id="show"></div>
  </center>
</body>    
</html>
