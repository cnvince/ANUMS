package com;
import java.util.*;
import com.CalendarBean;

public class CalendarOP 
{
	private Calendar thisMonth; 
	private CalendarBean cb;
	
	public CalendarBean getCalendarBean(String month,String year)
	{
		 thisMonth=Calendar.getInstance();     //���һ���������
		 cb=new CalendarBean();	
		 cb.setCurryear(thisMonth.get(Calendar.YEAR));
		 cb.setCurrmonth(thisMonth.get(Calendar.MONTH)+1);

		String days[]=new String[42];
		
		if(month==null||month.equals("null")||month=="") 
			month=String.valueOf(thisMonth.get(Calendar.MONTH));

		thisMonth.set(Calendar.MONTH, Integer.parseInt(month) ); 
		
		if(year==null||year.equals("null")||year=="")
			year=String.valueOf(thisMonth.get(Calendar.YEAR));
		
		thisMonth.set(Calendar.YEAR, Integer.parseInt(year) ); 
		cb.setCurrday(thisMonth.get(Calendar.DAY_OF_MONTH));
		thisMonth.setFirstDayOfWeek(Calendar.SUNDAY); 
		thisMonth.set(Calendar.DAY_OF_MONTH,1); 

		int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1; 
		int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH); 

			for(int i=0;i<maxIndex;i++) 
			{ 
				days[firstIndex+i]=String.valueOf(i+1); 
			} 
			cb.setDays(days);
			return cb;
	}
	
	public int firstGetM()
	{
		Calendar c=Calendar.getInstance();
		c.setTime(new java.util.Date());
		return c.get(Calendar.MONTH);
	}
	
	public int firstGetY()
	{
		Calendar c=Calendar.getInstance();
		c.setTime(new java.util.Date());
		return c.get(Calendar.YEAR);
	}

}
