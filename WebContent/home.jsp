<%@ page language="java" import="java.util.*,riskManager.model.Project" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="./css/home.css" rel="stylesheet" type="text/css" media="all"/>
	<title>RiskManagement</title></head>
	<meta name="author" content="annuus"/>
</head>

<body>
<div class="header">
    <div class="headertop_desc">
	    <div class="wrap">
			<div class="nav_list">
				<ul>
					<li><a href="home.jsp">主页</a></li>
				</ul>
			</div>
			<div class="account_desc">
				<ul>
					<%
					String uname = (String)request.getServletContext().getAttribute("uname");
					%>
					<li><a href="#" target="_blank"><%=uname %></a></li>
					<li><a href="/RiskManagement/loginout" target="_blank">登出</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>

<div class="main">


<div id="section">
    <h1>项目列表</h1>
        <ul id = "prolist" style="font-size:20px">
		    <% 
			String[] pids =(String[]) request.getServletContext().getAttribute("pids");
			String[] pnames = (String[]) request.getServletContext().getAttribute("pnames");
			String[] mangers = (String[]) request.getServletContext().getAttribute("mangers");
			if (pids!=null) {
				for (int i=0;i < pids.length;i++) {
					String name=pnames[i];
					String pid=pids[i];
		    %>
						
		            <li><a href="/RiskManagement/showproject.action?pid=<%=pid %>"><%=name %></a></li>
						
		    <%
				}
			} 
		    %>
	    </ul>
</div>
<script>
	    window.onload = function(){
		    var obj_lis = document.getElementById("prolist").getElementsByTagName("li");
		    for(i=0;i<obj_lis.length;i++){
			    obj_lis[i].onclick = function(){
				request.setAttribute("pid",Integer.parseInt(pid));
			    }
		    }
	    }
</script>
<div class="create">
        <%
		String role = (String)request.getServletContext().getAttribute("role"); 
		if (role.equals("manager")) {
	    %>
	    <!-- button new project begin-->
	    <input type="submit" value="创建项目" onclick="location.href='newproject.jsp'">
	    <!-- button new project end -->
	    <%
	    } 
	    %>
</div>
    
</div>
</body>
</html>