<%@ page language="java" import="java.util.*" %> 
<%@ page  import="java.text.*" %> 
 <% 
  
   //Calendar cal=Calendar.getInstance(); 
   //cal.set(2008,5,29);
   //int da=cal.get(Calendar.DAY_OF_WEEK)-1;
   //out.print(da);

  //final String dayNames[] = { "������", "����һ", "���ڶ�", "������", "������", "������", "������" };
  String s = "2008-05-25";
  SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
  Calendar calendar = Calendar.getInstance();
  Date date = new Date();
        try {
               date = sdfInput.parse(s);
           } catch (ParseException e) {
              e.printStackTrace();
           }
  calendar.setTime(date);
  int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK)-1;
  if(dayOfWeek<0)dayOfWeek=0;
 //out.println(dayNames[dayOfWeek]);
 out.print(dayOfWeek);
%> 
