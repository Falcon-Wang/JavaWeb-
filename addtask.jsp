<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增任务</title>
</head>
<body>
<%
//设置中文编码
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

//连接数据库
String user = "root";
String pwd = "YongHeng61";
String driver = "com.mysql.cj.jdbc.Driver";
Class.forName(driver);
String url = "jdbc:mysql://localhost/inter?useSSL=false&serverTimezone = Hongkong";
Connection conn = DriverManager.getConnection(url,user,pwd);

if(conn!=null){
	Statement stmt = conn.createStatement();
	String taskname = request.getParameter("taskname");
	String taskowner = request.getParameter("taskowner");
	String taskintro = request.getParameter("taskintro");
	String tasktime = (new Date()).toLocaleString();
	String insertsql = "INSERT INTO task(taskName,releasePerson,time,debrief) VALUES('"+taskname+"','"+taskowner+"','"+tasktime+"','"+taskintro+"')";
	
	int linesum = stmt.executeUpdate(insertsql);
	if(linesum > 0){
		out.println("任务添加成功");
		response.setHeader("refresh", "1;url=Welcome.jsp");
	}
}
%>
</body>
</html>