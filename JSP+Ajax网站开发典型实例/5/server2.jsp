<%@ page language="java" pageEncoding="gb2312"%>
<%
   String fail="不及格，继续努力哟！";
   String pass="及格，不过仍需努力啊！";
   String good="良好，不错嘛！";
   String veryGood="优秀，要保持哦！";
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
           out.println("你的输入数字太大或太小！");
         }
      }catch(Exception e)
      {
        out.println("你的输入不合法！");
      }

%>