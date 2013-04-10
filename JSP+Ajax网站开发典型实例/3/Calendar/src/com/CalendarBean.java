package com;

public class CalendarBean 
{
	int curryear;    //�洢��ǰ���
	int currmonth;   //�洢�����·�
	int currday;     //�洢��ǰ��
	String days[];   //�洢��ǰ�µ�����
	
	public CalendarBean(){}
	public int getCurrmonth() {
		return currmonth;
	}
	public void setCurrmonth(int currmonth) {
		this.currmonth = currmonth;
	}
	public int getCurryear() {
		return curryear;
	}
	public void setCurryear(int curryear) {
		this.curryear = curryear;
	}
	public String[] getDays() {
		return days;
	}
	public void setDays(String[] days) {
		this.days = days;
	}
	public int getCurrday() {
		return currday;
	}

	public void setCurrday(int currday) {
		this.currday = currday;
	}
	

}
