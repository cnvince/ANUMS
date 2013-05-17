<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.broker.Controller"%>
<%@page import="com.results.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.datatype.*"%>
<%@page import="com.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*" %>
<%@page import="java.io.BufferedReader"%>
<%@include file="head.html"%>
<link href="css/theme" rel="stylesheet" type="text/css" media="screen">
<%@ include file="/css/loader.css"%>
<%@ include file="/css/table.css"%>
 <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('select.scoreslect').change(function(){
		if($(this).val()!=-1)
			$(this).parent().parent().children().children('img').attr('src','images/Tick.png');
		else
			$(this).parent().parent().children().children('img').attr('src','images/cross.png');
	});
	$('input.nquery').click(function(){
		/* set a global value to check if the documents are all judged */
		var check=true;
		/* check the value of the score */
		$('tr.docDes').each(function()
				{
					if($(this).children().children('select').val()==-1)
						{
							window.alert('Please finish the judgement of this page first! Thank you.');
							check=false;
							return;
						}
				});
		/* when form is validated, submit the form */
		if(check==true)
			{
				$('form.judgeform').submit();
			}
	});
});
function popupaddpackage(urlToOpen) {
	var window_width = screen.availWidth / 2;
	var window_height = screen.availHeight / 2;
	var window_left = (screen.availWidth / 2) - (window_width / 2);
	var window_top = (screen.availHeight / 2) - (window_height / 2);
	var winParms = "Status=yes" + ",resizable=yes" + ",height="
			+ window_height + ",width=" + window_width + ",left="
			+ window_left + ",top=" + window_top;
	var newwindow = window.open(urlToOpen, '_blank', winParms);
	newwindow.focus();
}
</script>
<%
	//current evaluation query
	int queryIndex=-1;
	if(request.getAttribute("index")!=null)
	{
		queryIndex=Integer.parseInt(request.getAttribute("index").toString());
	}
	else
	{
		//initial queries
		ArrayList<String> queries=new ArrayList<String>();
		String fileName = "/queries.txt";
		InputStream ins = application.getResourceAsStream(fileName);
		//read from file
		BufferedReader reader = new BufferedReader(new InputStreamReader(ins));
        StringBuilder sb = new StringBuilder();
        String cquery;

        while((cquery = reader.readLine())!= null){
            queries.add(cquery.trim());
        }
        //put into session
        request.setAttribute("queries", queries);
        //set current index=0;
        queryIndex=0;
        reader.close();
	}
	//get all queries
	ArrayList<String> Queries=(ArrayList<String>)(request.getAttribute("queries"));
	String query = Queries.get(queryIndex);
	
	ArrayList<Result> results = new ArrayList<Result>();
	Controller controller = new Controller();
	long start=System.currentTimeMillis();
	results = controller.fetchResult(query, ALGORITHM.JUDGE);
	if((queryIndex+1)<=Queries.size()-1)
		queryIndex++;
	request.setAttribute("index", queryIndex);
	long end=System.currentTimeMillis();
	float sTime=(end-start)/1000;
%>
</head>
<body>
	<%@include file="banner.html"%>
	<form class='judgeform' action="dcoumentJudge.jsp">
	<table>
		<tr>
			<td></td>
			<th scope="col">Current query:<p><strong><%=query %></strong></p></th>
			<th scope="col">Search Time:<%=sTime %>s</th>
			<th scope="col"><input type="button" class="nquery" value="Next Query"></th>
		</tr>
		<tr>
			<td>Complete</td>
			<th scope="col">Title</th>
			<th scope="col">Source</th>
			<th scope="col">Relevance</th>
		</tr>
		<%for(int i=0;i<results.size();i++)
		{
			Result result=results.get(i);
		%>
		<tr class="docDes">
			<th scope="row"><img alt="" src="images/cross.png" ></th>
			<td><%=result.getTitle()%><input type="hidden" name='url' class="url" value=<%=result.getLink() %>>
			<input type="button" value="Click to see the page"
		onClick="popupaddpackage('<%=result.getLink() %>')">
			</td>
			<td><%=result.getSourceName() %></td>
			<td><select name="relevance" class="scoreslect">
					<option value=-1>-Select-</option>
					<option  selected="selected" value=0>Non-Relevant</option>
					<option value=1>On-topic but useless</option>
					<option value=2>Somewhat useful</option>
					<option value=3>Useful</option>
					<option value=4>Comprehensively useful</option>
					<option value=5>Exactly the intended page</option>
			</select></td>
		</tr>
		<%} %>
	</table>
	</form>
</body>
</html>
