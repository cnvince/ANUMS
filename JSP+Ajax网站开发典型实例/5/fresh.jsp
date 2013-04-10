<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>自动刷新</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <script language="javascript">
       var XMLHttpReq;//创建XMLHttpRequest对象       
      function createXMLHttpRequest() {
              if(window.XMLHttpRequest) { //Mozilla 浏览器
                     XMLHttpReq = new XMLHttpRequest();
              }
              else if (window.ActiveXObject) { // IE浏览器
                     try {
                           XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                     } catch(e){
                           try {
                              XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                           } catch (e) {}
                     }
              }
       }
      //发送请求函数
       function sendRequest() {
              createXMLHttpRequest();
              var url = "Random.jsp";
              XMLHttpReq.open("GET", url, true);
              XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
              XMLHttpReq.send(null);  // 发送请求
       }
       // 处理返回信息函数
       function processResponse() {
       if (XMLHttpReq.readyState == 4) { // 判断对象状态
              if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                      var str =XMLHttpReq.responseText;
                      document.getElementById("show").innerHTML=(str+"人");
                      setTimeout("sendRequest()", 726);
              } else { //页面不正常
                    window.alert("您所请求的页面有异常。");
              }
         }
      }     
</script>
  <body onload =sendRequest()><br>
  <center>
    <b>实时在线人数</b><br><br>
    <div id="show"></div>
  </center>
</body>    
</html>
