<%@ page language="java" pageEncoding="gb2312"%>
<%
   String fail="�����񣬼���Ŭ��Ӵ��";
   String pass="���񣬲�������Ŭ������";
   String good="���ã������";
   String veryGood="���㣬Ҫ����Ŷ��";
   String scoreStr=request.getParameter("score").trim();
   double score=-1;
   try{
      score=Double.parseDouble(scoreStr);
         if(score<=100&&score>=85)
         {
           out.println(veryGood);
         }else if(score<85&&score>=70)
         {
           out.println(good);
         }else if(score<70&&score>=60)
         {
           out.println(pass);
         }else if(score<60&&score>=0)
         {
           out.println(fail);
         }else
         {
           out.println("�����������̫���̫С��");
         }
      }catch(Exception e)
      {
        out.println("������벻�Ϸ���");
      }

%>