<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除任务</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String getTaskId = request.getParameter("deltaskid");
	
	//连接数据库
	String user = "root";
	String pwd = "YongHeng61";
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	String url = "jdbc:mysql://localhost/inter?useSSL=false&serverTimezone = Hongkong";
	Connection conn = DriverManager.getConnection(url,user,pwd);
	
	if(conn!=null){
		Statement stmt=conn.createStatement();
		String id = request.getParameter("taskid");
		String delstr = "DELETE FROM task WHERE taskId=" + getTaskId;
		
		int linesum = stmt.executeUpdate(delstr);
		if(linesum > 0){
			out.println("数据删除成功");
			response.setHeader("refresh","1;url=Welcome.jsp");
		}else{
			out.println("数据删除失败");
		}
	}
%>
</body>
</html>