<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="./css/component.css" rel="stylesheet" type="text/css" media="all"/>
<script language="javascript" type="text/javascript" src="./js/jquery-1.9.0.min.js"></script>
<title>RiskManagement</title>
<style type="text/css">
	h1{
		font-size: 25px;
		padding: 20px 0px 10px 40px;
		display: block;
		border-bottom:1px solid #E4E4E4;
		margin: -10px -15px 30px -10px;
		color: dark;
	}
	.hidden{
    	display: none;
	}
	.display{
	    widows: inherit;
	    height: inherit;
	}
</style>
</head>
<body>

<!-- header start -->
<div class="header">
  	  	<div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="home.jsp">主页</a></li>
						
						<% String pname = (String)request.getServletContext().getAttribute("pname"); 
							String rname = (String)request.getServletContext().getAttribute("rname");
						%>
						<li><a href="showproject.jsp"><%=pname %></a></li>	
						<li><a href="#" onclick="show('member')">项目成员</a>
						<li><a href="#" onclick="show('riskList')">风险列表</a>
						<script>
							function show(id){
								document.getElementById('member').className="hidden";
								document.getElementById('riskList').className="hidden";
								document.getElementById(id).className="display";
							}
						</script>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
						<%
						    String uname = (String)request.getServletContext().getAttribute("uname");
						%>
							<li><a href="home.jsp" target="_blank"><%=uname %></a></li>
							<li><a href="/RiskManagement/loginout" target="_blank">登出</a></li>
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
	  	
	</div>
<!-- header end -->

<div class="wrap">
<!-- title -->
<h1><%= (String)request.getServletContext().getAttribute("pname")%></h1>
<!-- title -->
<!-- member -->
<div id="member" >
<div class="component">
	<table>
		<thead>
				<tr>
                    <th>id</th>
					<th>名字</th>
					<th>角色</th>
				</tr>
			</thead>
			<% 
				String[] mids = (String[])request.getServletContext().getAttribute("mids");
				String[] mnames=(String[])request.getServletContext().getAttribute("mnames");
				String[] mroles=(String[])request.getServletContext().getAttribute("mroles");
				%>
				<tbody>
				<% 
				if (mids.length > 0) {
					for (int i=0;i < mids.length;i++) {
							
			%>		
				<tr>
                    <td><%=mids[i] %></td>
                    <td><%=mnames[i] %></td>
                    <td><%=mroles[i] %></td>
                </tr>
						
			<%
					}
				} 
			%>
			<tbody>
		</table>
	</div>
</div>

<!-- member -->
<!-- risklist -->
<div id="riskList" class="hidden">
	<div class="mybutton">
		<a href="/RiskManagement/addrisk.jsp" style="color: #000">添加风险</a>
	</div>
	<br>
	<div class="component">
	<table>
		<thead>
				<tr>
                    <th>名称</th>
					<th>危险程度</th>
					<th>状态</th>
					<th>查看</th>
				</tr>
			</thead>
			<% 
				String[] rids = (String[])request.getServletContext().getAttribute("rids");
				String[] names=(String[])request.getServletContext().getAttribute("rnames");
				String[] affects=(String[])request.getServletContext().getAttribute("affects");
				String[] states=(String[])request.getServletContext().getAttribute("states");
				%>
				<tbody>
				<% 
				if (rids.length > 0) {
					for (int i=0;i < rids.length;i++) {
						String rid=rids[i];
						String name=names[i];
							//String rid=Integer.toString(risklist.get(i).getRid());
			%>		
				<tr>
                    <td><a href="/RiskManagement/showRisk?rid=<%=rids[i]%>"><%=names[i] %></a></td>
                    <td><%=affects[i] %></td>
                    <td><%=states[i] %></td>
                    <td><a href="/RiskManagement/showRisk?rid=<%=rids[i]%>">查看</a></td>
                </tr>
						
			<%
					}
				} 
			%>
			</tbody>
		</table>
	</div>
</div>
<!-- risklist -->
 </div>
</body>
</html>