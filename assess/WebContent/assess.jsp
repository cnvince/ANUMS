<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.assess.sql.*"%>
<%@page import="com.entity.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Collections" %>
<%@include file="head.html"%>
<link href="css/theme" rel="stylesheet" type="text/css" media="screen">
<%@ include file="/css/loader.css"%>
<%@ include file="/css/table.css"%>
<%@ include file="/css/button.css"%>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('select.scoreslect').change(
								function() {
									if ($(this).val() != -1) {
										$.post("record", {
											link : $(this).parent().children(
													'input').attr("value"),
											score : $(this).val()
											}
										);
										$(this).parent().parent().parent().children()
										.children('img').attr('src',
										'images/Tick.png');
									} else
										$(this).parent().parent().parent().children()
												.children('img').attr('src',
														'images/cross.png');
								});
						$('input.button')
								.click(
										function() {
											/* set a global value to check if the documents are all judged */
											var check = true;
											/* check the value of the score */
											$('div.scorefield')
													.each(
															function() {
																if ($(this)
																		.children(
																				'select')
																		.val() == -1) {
																	check = false;
																	return;
																}
															});
											/* when form is validated, submit the form */
											if (check == true) {
												$('form.judgeform').submit();
											} else
												window
														.alert('Please finish the judgement of this page first! Thank you.');

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
	Connector.Connect();
	Connection conn = Connector.getConnection();
	Statement stmt = conn.createStatement();
	String sql_ex = "SELECT COUNT(*) AS NUMBER FROM RESULT WHERE USERID=? AND SCORE=-1;";
	PreparedStatement statement;
	statement = conn.prepareStatement(sql_ex);
	String user = null;

	if (session.getAttribute("user") == null) {
		user = request.getParameter("user").toString();
		session.setAttribute("user",user );
	} else
		user = session.getAttribute("user").toString();
	System.out.println("userid:"+session.getAttribute("user"));
	statement.setString(1, user);
	ResultSet results = statement.executeQuery();
	int number = 0;
	/* store current query */
	String query = "";
	while (results.next()) {
		number = results.getInt("NUMBER");
	}
	statement.close();
	ArrayList<Document> documents = new ArrayList<Document>();
	/* judge if the userID do not exists */
	if (number == 0) {
		String sql_select = "SELECT Q_TERM FROM QUERIES WHERE ASSESSED =0 ORDER BY RAND( ) LIMIT 1;";
		ResultSet resultSet = stmt.executeQuery(sql_select);
		while (resultSet.next()) {
			query = resultSet.getString("Q_TERM");
		}
	//	set random select when all queries are assessed
		if (query==null||query=="")
		{
			sql_select = "SELECT Q_TERM FROM QUERIES ORDER BY RAND( ) LIMIT 1;";
			resultSet = stmt.executeQuery(sql_select);
			while (resultSet.next()) {
				query = resultSet.getString("Q_TERM");
			}
		}
		else {
			String sql_doc = "SELECT TITLE, LINK, SOURCE FROM QUERY_DOCUMENT WHERE Q_TERM=?";
			statement = conn.prepareStatement(sql_doc);
			statement.setString(1, query);
			ResultSet docset = statement.executeQuery();
			while (docset.next()) {
				String title = docset.getString("TITLE");
				String link = docset.getString("LINK");
				String source = docset.getString("SOURCE");
				String sql_res = "INSERT INTO RESULT (Q_TERM,LINK,USERID,RDATE,SCORE) VALUES(?,?,?,?,-1)";
				statement = conn.prepareStatement(sql_res);
				statement.setString(1, query);
				statement.setString(2, link);
				statement.setString(3, user);
				Calendar currenttime = Calendar.getInstance();
				Date sqldate = new Date(
						(currenttime.getTime()).getTime());
				statement.setDate(4, sqldate);
				statement.executeUpdate();
				Document document = new Document();
				document.setQ_term(query);
				document.setTitle(title);
				document.setLink(link);
				document.setSource(source);
				document.setScore(-1);
				documents.add(document);
			}

		}
	} else {
		String sql_doc = "SELECT RESULT.Q_TERM,TITLE,RESULT.LINK,SOURCE,SCORE"
				+ " FROM RESULT JOIN QUERY_DOCUMENT ON"
				+ " RESULT.LINK=QUERY_DOCUMENT.LINK AND "
				+ " RESULT.Q_TERM=QUERY_DOCUMENT.Q_TERM WHERE SCORE=-1 AND USERID=?;";
		statement = conn.prepareStatement(sql_doc);
		statement.setString(1, user);
		ResultSet docset = statement.executeQuery();
		while (docset.next()) {
			query = docset.getString("Q_TERM");
			String title = docset.getString("TITLE");
			String link = docset.getString("LINK");
			String source = docset.getString("SOURCE");
			int score = docset.getInt("SCORE");
			Document document = new Document();
			document.setQ_term(query);
			document.setTitle(title);
			document.setLink(link);
			document.setSource(source);
			document.setScore(score);
			documents.add(document);
		}
	}
	statement.close();
//	Connector.DisConnect();
//	set query to session
	session.setAttribute("query", query);
%>

<title>Document Evaluation -<%=query%></title>
</head>
<body>
	<%@include file="banner.html"%>
	<form class='judgeform' action="nextquery" method="post">
		<input type="hidden" name="query" class="query" value=<%=query%>>
		<table>
			<tr>
				<td></td>
				<th scope="col">Current query:
					<p>
						<strong><%=query%></strong>
					</p>
				</th>
				<th scope="col"><input type="button" class="button"
					value="Next Query"></th>
			</tr>
			<tr>
				<td>Complete</td>
				<th scope="col">Title</th>
				<th scope="col">Source</th>
				<th scope="col">Relevance</th>
			</tr>
			<%
			//random sort the documents
				Collections.shuffle(documents);
				for (Document document : documents) {
					String Title = document.getTitle();
					String Link = document.getLink();
					String Source = document.getSource();
					/* initial the resut in databse */
					String sql_score_intial = "";
			%>
			<tr class="docDes">
				<th scope="row"><img alt="" src="images/cross.png"></th>
				<td><%=Title%><input type="hidden" name='url' class="url"
					value=<%=Link%>> <input type="button"
					value="Click to see the page"
					onClick="popupaddpackage('<%=Link%>')"></td>
				<td><%=Source%></td>
				<td>
					<div class="scorefield">
						<input type="hidden" name="doclink" value=<%=Link%>> 
						<select
							name="relevance" class="scoreslect">
							<option value=-1 selected="selected">-Select-</option>
							<option value=0>Non-Relevant</option>
							<option value=1>On-topic but useless</option>
							<option value=2>Somewhat useful</option>
							<option value=3>Useful</option>
							<option value=4>Comprehensively useful</option>
						</select>
					</div>
				</td>
			</tr>
			<%	
				}
			%>
			<tr>
				<td><input type="button" class="button" value="Next Query">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
