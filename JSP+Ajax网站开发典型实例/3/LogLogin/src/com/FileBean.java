package com;

import java.io.*;
import java.util.*;

public class FileBean 
{
	File f=new File("c:\\log.txt");    //��ÿ��Բ���c:\\log.txt�ļ���File����
	
	public void writerFile(String content) throws Exception    //�÷����ѵ�½��Ϣд���ļ���
	{
			FileWriter fw=new FileWriter(f,true);
			BufferedWriter bw=new BufferedWriter(fw);
							
			bw.write(content);bw.newLine();
			bw.flush();
			bw.close();
			fw.close();
	}
	public Vector readFile() throws Exception                  //�÷����ѵ�½��Ϣ���ļ��ж�ȡ����
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




