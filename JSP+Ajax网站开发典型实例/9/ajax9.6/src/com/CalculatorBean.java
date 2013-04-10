package com;

public class CalculatorBean 
{
	public double calculator(String firstnum,String op,String secondnum)        
	{
		double thirdnum=0.0;
		if(op.equals("+"))
			thirdnum=Double.parseDouble(firstnum)+Double.parseDouble(secondnum);
		if(op.equals("-"))
			thirdnum=Double.parseDouble(firstnum)-Double.parseDouble(secondnum);
		if(op.equals("*"))
			thirdnum=Double.parseDouble(firstnum)*Double.parseDouble(secondnum);
		if(op.equals("/"))
			thirdnum=Double.parseDouble(firstnum)/Double.parseDouble(secondnum);
		return thirdnum;
	}
}
