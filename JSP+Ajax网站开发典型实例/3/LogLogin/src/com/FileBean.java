package com;

import java.io.*;
import java.util.*;

public class FileBean 
{
	File f=new File("c:\\log.txt");    //获得可以操作c:\\log.txt文件的File对象
	
	public void writerFile(String content) throws Exception    //该方法把登陆信息写入文件中
	{
			FileWriter fw=new FileWriter(f,true);
			BufferedWriter bw=new BufferedWriter(fw);
							
			bw.write(content);bw.newLine();
			bw.flush();
			bw.close();
			fw.close();
	}
	public Vector readFile() throws Exception                  //该方法把登陆信息从文件中读取出来
	{
			Vector v=new Vector();
			String s="";
			FileReader fr=new FileReader(f);
			BufferedReader br=new BufferedReader(fr);
						
	        while((s=br.readLine())!=null)
	        {
				v.addElement(s);
	        }
			br.close();
			
			return v;
	}
}




