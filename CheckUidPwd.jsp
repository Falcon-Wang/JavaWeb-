<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>检查用户名-密码</title>
</head>
<body>
<%
//设置中文编码
request.setCharacterEncoding("UTF-8");

//接收Userlogin表单数据
String name = request.getParameter("userName");
String password = request.getParameter("pwd");

String Query = "SELECT * FROM users WHERE name='" + name +"' and password='" + password +"'" ;

//连接inter数据库
String user = "root";
String pwd = "YongHeng61";
String driver = "com.mysql.cj.jdbc.Driver";
Class.forName(driver);
String url = "jdbc:mysql://localhost/inter?useSSL=false&serverTimezone = Hongkong";
Connection conn = DriverManager.getConnection(url,user,pwd);

try{
	if(conn!=null){
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(Query);
		if(result.next()){
			session.setAttribute("logName",name);
			response.sendRedirect("Welcome.jsp");
			result.close();
			stmt.close();
			conn.close();
		}else{
			out.println("用户名或密码错误，请重新输入");
			response.setHeader("refresh", "1;url=userLogin.html");
		}
	}else{
		out.println("数据库连接失败");
	}	
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>