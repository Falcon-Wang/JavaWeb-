<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新信息保存</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String rsnum = request.getParameter("taskid");
	String rsname = request.getParameter("taskname");
	String rswho = request.getParameter("taskowner");
	String rsdesc = request.getParameter("taskintro");
	//System.out.println(rsnum);
	
	//连接数据库
	String user = "root";
	String pwd = "YongHeng61";
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	String url = "jdbc:mysql://localhost/inter?useSSL=false&serverTimezone = Hongkong";
	Connection conn = DriverManager.getConnection(url,user,pwd);
	
	if(conn!=null){
		Statement stmt = conn.createStatement();
		String sqlexec = "UPDATE task set taskName='"+rsname+"',releasePerson='"+rswho+"',Time='"+new Date().toLocaleString()+"',debrief='"+rsdesc+"'WHERE taskId="+rsnum+"";
		
		//System.out.println(sqlexec);
		
		int linesum = stmt.executeUpdate(sqlexec);
		if(linesum > 0){
			out.println("修改成功");
			response.setHeader("refresh","1;url=Welcome.jsp");
		}else{
			out.println("修改失败");
		}
	
	}
%>
</body>
</html>