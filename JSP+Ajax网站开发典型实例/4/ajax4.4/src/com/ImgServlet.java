package com;
import java.io.IOException;
import java.awt.*;
import java.awt.image.*;
import javax.servlet.*;
import com.sun.image.codec.jpeg.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImgServlet extends HttpServlet 
{
	public ImgServlet() 
	{
		super();
	}
	
	public void init() throws ServletException 
	{
		super.init();
	}

	public void destroy() 
	{
		super.destroy(); 
	}

	private void createImage(ServletOutputStream out) 
	{
        int width = 100;    //设置图片宽度
        int height = 100;   //设置图片高度
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = bi.createGraphics();
        g.setBackground(Color.lightGray);  //设置图片背景颜色
        g.clearRect(0, 0, width, height);  
        g.setColor(Color.RED);
        g.drawString("welcome", 25, 50);   //在图片上画一个字符串
        g.dispose();
        bi.flush();
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bi);
        param.setQuality(1.0f, false);
        encoder.setJPEGEncodeParam(param);
        try {
            encoder.encode(bi);
        }
        catch(IOException ioe) {
            ioe.printStackTrace();
        }
    }	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg");
        createImage(response.getOutputStream());

	}

}
