package com;

public class CalculatorBean 
{
	private double firstnum;      //存储第一个数
	private double secondnum;     //存储第二个数
	private double thirdnum;      //存储结果
	private String op;            //存储运算符
	
	public CalculatorBean(){}
	
	public CalculatorBean(double firstnum,double secondnum,String op)
	{
		this.firstnum=firstnum;
		this.secondnum=secondnum;
		this.op=op;
	}
	public double getFirstnum() {
		return firstnum;
	}
	public void setFirstnum(double firstnum) {
		this.firstnum = firstnum;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	public double getSecondnum() {
		return secondnum;
	}
	public void setSecondnum(double secondnum) {
		this.secondnum = secondnum;
	}
	public double getThirdnum() {
		return thirdnum;
	}
	public void setThirdnum(double thirdnum) {
		this.thirdnum = thirdnum;
	}
	public double calculator()         //根据运算符进行计算并返回结果
	{
		if(this.op.equals("+"))
			this.thirdnum=this.firstnum+this.secondnum;
		if(this.op.equals("-"))
			this.thirdnum=this.firstnum-this.secondnum;
		if(this.op.equals("*"))
			this.thirdnum=this.firstnum*this.secondnum;
		if(this.op.equals("/"))
			this.thirdnum=this.firstnum/this.secondnum;
		return this.thirdnum;
	}
}
