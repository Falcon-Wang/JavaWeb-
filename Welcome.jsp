<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>
<script type="text/javascript">
	function del(id){
		if(confirm("确定删除此任务吗？"))
		{
			location.href="deleteTask.jsp?deltaskid="+id;
		}
	}
</script>
</head>
<body>
<%
	String userName = (String)session.getAttribute("logName");
	out.println("<font size='5' color='red'>用户 "+userName+"您好！欢迎使用任务管理系统！</font>");
%>
<hr color='purple' size='2' />
<div align="right"><a href="login.html">退出</a></div>
<p></p>
<p></p>
<p></p>
<h1 align="center">任务信息列表</h1>
<div align="center"><a href="addtask.html">添加新任务</a></div>
<table border="1" width="90%" align="center">
	<tr>
		<th><font color="blue">任务编号</font></th>
		<th><font color="blue">任务名称</font></th>
		<th><font color="blue">任务发布者</font></th>
		<th><font color="blue">任务发布时间</font></th>
		<th><font color="blue">任务简介</font></th>
		<th><font color="blue">任务操作</font></th>
	</tr>
	<%
	//链接数据库
	String user = "root";
	String pwd = "YongHeng61";
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	String url = "jdbc:mysql://localhost/inter?useSSL=false&serverTimezone = Hongkong";
	Connection conn = DriverManager.getConnection(url,user,pwd);
	
	if(conn!=null){
		Statement stmt = conn.createStatement();
		String query = "SELECT * FROM task";
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			int taskid = rs.getInt("taskId");
			String taskName = rs.getString("taskName");
			String taskOwner = rs.getString("releasePerson");
			String taskTime = rs.getString("Time");
			String debrief = rs.getString("debrief");
			
			out.println("<tr align='center'>");
			out.println("<td>" + taskid + "</td>");
			out.println("<td>" + taskName + "</td>");
			out.println("<td>" + taskOwner + "</td>");
			out.println("<td>" + taskTime + "</td>");
			out.println("<td>" + debrief + "</td>");

			out.println("<td><a href=taskUpdate.jsp?updatetaskid="+taskid+">修改</a>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:del("+taskid+")'"+">删除</a></td>");
			out.println("</tr>");
		}
		rs.close();
		conn.close();
	}
	%>
</table>
</body>
</html>