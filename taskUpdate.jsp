<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任务信息修改页面</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String getTaskId = request.getParameter("updatetaskid");
	
	//连接数据库
	String user = "root";
	String pwd = "YongHeng61";
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	String url = "jdbc:mysql://localhost/inter?useSSL=false&serverTimezone = Hongkong";
	Connection conn = DriverManager.getConnection(url,user,pwd);
	
	String taskName = null;
	String taskOwner = null;
	String taskDescribe = null;
	
	if(conn!=null){
		Statement stmt = conn.createStatement();
		String querystr = "SELECT * FROM task WHERE taskId=" + getTaskId;
		
		ResultSet rs = stmt.executeQuery(querystr);
		
		if(rs.next()){
			taskName = rs.getString("taskName");
			taskOwner = rs.getString("releasePerson");
			taskDescribe = rs.getString("debrief");
		}
		rs.close();
		stmt.close();
		conn.close();
	}
%>

<form action="updateSave.jsp" method="post" name="form1" id="form1">
	<p><font color=red>修改任务信息，不能为空</font></p>
	<p>
		任务编号:<input type="text" name="taskid" id="taskid" value="<%=getTaskId%>" disabled />
		<input type="hidden" name="taskid" id="taskid" value="<%=getTaskId%>" />
	</p>
	<p>
		任务名称:<input type="text" name="taskname" id="taskname" value="<%=taskName%>" />
	</p>
	<p>
		任务发布者:<input type="text" name="taskowner" id="taskowner" value="<%=taskOwner%>" />
	</p>
	<p>
	任务简介:
	<textarea name="taskintro" id="taskintro"><%=taskDescribe%></textarea>
	</p>
	<p>
	<input type="submit" name="btnexec" value="提交" />
	<input type="reset" name="btnreset" value="重置" />
	</p>
</form>
</body>
</html>