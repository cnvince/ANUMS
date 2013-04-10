<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%!int counter = 1;%>
<%
        String task = request.getParameter("task");   //获得参数值
        String res = "";       
        if (task.equals("create")) {
            res = "<percent>1</percent>";
            counter = 1;
        }
        else {
            String percent = "";
            switch (counter) {
                case 1: percent = "10"; break;
                case 2: percent = "20"; break;
                case 3: percent = "30"; break;
                case 4: percent = "40"; break;
                case 5: percent = "50"; break;
                case 6: percent = "60"; break;
                case 7: percent = "70"; break;
				case 8: percent = "80"; break;
                case 9: percent = "90"; break;
                case 10: percent = "100"; break;
            }
            counter++;     
            res = "<percent>" + percent + "</percent>";
        }
        response.setContentType("text/xml");  //设置内容类型
        response.setHeader("Cache-Control", "no-cache");
        out.println("<response>");
        out.println(res);
        out.println("</response>");  
  %>
