<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL,org.jdom.*,org.jdom.input.*" %>
<%
  //设置输出信息的格式及字符集        
        response.setContentType("text/html; charset=utf-8");
        response.setHeader("Cache-Control","no-cache");
        String param =request.getParameter("obj");  //接受参数值
        String domainmsg=null;
        URL url = null;
        BufferedReader in = null;
        InputStreamReader isr = null;
        InputStream is = null;
        HttpURLConnection huc = null;
        try
        {
            url = new URL("http://now.net.cn/domain/domaincheck.php?query="+param);
            huc = (HttpURLConnection)url.openConnection();   //打开HttpURL连接      
            is = huc.getInputStream();
            isr = new InputStreamReader(is);
            in = new BufferedReader(isr);
            String line = null;
            StringBuffer s = new StringBuffer(333);
            while((line = in.readLine()) != null) {
                line=line.trim();
                s.append(line);
            }
            domainmsg=s.toString();
            SAXBuilder builder = new SAXBuilder();
            Document doc = null;
            Reader in1= new StringReader(domainmsg);
            doc = builder.build(in1);
            Element root = doc.getRootElement();          
            String ss=root.getChild("result").getChildText("msg");
            out.print(ss); //向客户端输出信息
        }catch(Exception e){
           e.printStackTrace();
        }
        finally
        {
            try
            {
                huc.disconnect();
                is.close();
                isr.close();
                in.close();
            }
            catch(Exception e)
            {
               e.printStackTrace();
            }
        }
%>
