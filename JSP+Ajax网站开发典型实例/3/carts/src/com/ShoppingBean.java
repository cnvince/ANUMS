package com;

public class ShoppingBean
{
	private int id;
	private String name;
	private double num;
	
	public ShoppingBean(){}
	
	public ShoppingBean(int id,String name,double num)
	{
		this.id=id;
		this.name=name;
		this.num=num;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getNum() {
		return num;
	}
	public void setNum(double num) {
		this.num = num;
	}	
}