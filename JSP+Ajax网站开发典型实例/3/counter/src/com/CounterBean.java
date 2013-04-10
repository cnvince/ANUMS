package com;

import java.io.*;

public class CounterBean 
{

  private String filepath="C:\\";     //默认设置到C盘根目录下
  private String counter;

  public CounterBean() {}
  public String getCounter()        
  {
    try {
    	java.io.FileReader fr=new java.io.FileReader(filepath+"\\counter.txt");
    	java.io.BufferedReader br = new java.io.BufferedReader(fr);
    	String countno = br.readLine();

       java.io.FileWriter fw=new java.io.FileWriter(filepath+"\\counter.txt");
       java.io.PrintWriter pw=new java.io.PrintWriter(fw);
       pw.print(String.valueOf(Integer.parseInt(countno)+1) );
       pw.close();
       fw.close();
       counter=String.valueOf(Integer.parseInt(countno)+1);
       return counter;
    	}
	 catch(Exception e)
	 {
	      try{ 
	       java.io.FileWriter fw=new java.io.FileWriter(filepath+"\\counter.txt");
	       java.io.PrintWriter pw=new java.io.PrintWriter(fw);
	       pw.print("1");
	       pw.close();
	       fw.close();
	       counter="1";
	       return counter;
	     }
	     catch(Exception ee)
	     {
	       counter="1";
	       return counter;
	     }
	 }

  }
  public void setCounter(String counter) 
  {
    this.counter = counter;
  }

}

