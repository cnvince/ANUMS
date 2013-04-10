package com;

public class CalculatorBean 
{
	private double firstnum;      //�洢��һ����
	private double secondnum;     //�洢�ڶ�����
	private double thirdnum;      //�洢���
	private String op;            //�洢�����
	
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
	public double calculator()         //������������м��㲢���ؽ��
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
