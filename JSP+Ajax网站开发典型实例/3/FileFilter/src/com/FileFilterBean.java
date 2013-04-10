package com;
import java.util.*;
import java.io.*;

public class FileFilterBean 
{
	public Vector show(String path,String filter)
	{
		Vector v=new Vector();
		String[] info;
		File f=new File(path);   //����ļ������
		
		if(f.isDirectory())     //�ж��Ƿ�Ϊ�ļ���
		{
			info =new String[f.list().length] ;
			info=f.list();
			for(int j=0;j<info.length;j++)
			{
				if(info[j].endsWith("."+filter))
					v.addElement(info[j]);
			}
		}
		else
			v.addElement(new String(path+" �����ļ���"));
		return v;
	}

}
