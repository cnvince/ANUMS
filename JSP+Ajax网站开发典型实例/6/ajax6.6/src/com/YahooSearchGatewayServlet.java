package com;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.*;
import javax.servlet.http.*;

public class YahooSearchGatewayServlet extends HttpServlet {
    private static final String YAHOO_SEARCH_URL = 
        "http://api.search.yahoo.com/WebSearchService/V1/webSearch?appid=thunderboltsoftware"
        + "&type=all";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String url = YAHOO_SEARCH_URL + "&" + request.getQueryString();     
        HttpURLConnection con = (HttpURLConnection)new URL(url).openConnection();   //连接Web服务
        con.setDoInput(true);
        con.setDoOutput(true);       
        con.setRequestMethod("GET");       
        //Send back the response to the browser
        response.setStatus(con.getResponseCode());
        response.setContentType("text/xml");       //设置内容类型
        BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream())); //读取获得的信息
        String input = null;
        OutputStream responseOutput = response.getOutputStream();       
        while((input = reader.readLine()) != null) {
            responseOutput.write(input.getBytes());   //向客户端输出信息
        }
    
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}
