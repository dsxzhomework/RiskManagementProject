<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>
<title>RiskManagement</title>
</head>
<body>
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
						<li><a href="showrisk.jsp"><%=rname %></a></li>	
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

        <div class="basic-grey">
        <% 	
        	if(rname!=null){
        		int rid = (int)request.getServletContext().getAttribute("rid");
        		String content = (String)request.getServletContext().getAttribute("content");
        		int possibility = (int)request.getServletContext().getAttribute("possibility");
        		int affect = (int)request.getServletContext().getAttribute("affect");
        		String trigger = (String)request.getServletContext().getAttribute("trigger");
        		int state = (int)request.getServletContext().getAttribute("state");//
        		int provider = (int)request.getServletContext().getAttribute("provider");//uid
        		int tracker = (int)request.getServletContext().getAttribute("tracker");//uid
        %>
        <form action="/RiskManagement/showRisk" method="post">
        	<div>
            <span>风险名称</span>
            <span style="color:black;"><%=rname %></span>
            </div>
            <div style="clear:both;">
            <span>内容</span>
            <span style="color:black;"><%=content %></span>
            </div>
            <div style="clear:both;">
            <span>可能性</span>
           	<% 
            	if(possibility==0){%><span style="color:black;">低</span> <%}
            	else if(possibility==1){%><span style="color:black;">中</span> <%}
            	else{%><span style="color:red;">高</span> <%}           
            %>
            </div>
            <div style="clear:both;">
            <span>影响程度</span>
            <% 
            	if(affect==0){%><span style="color:black;">低</span> <%}
            	else if(affect==1){%><span style="color:black;">中</span> <%}
            	else{%><span style="color:red;">高</span> <%}           
            %>
            </div>
            <div style="clear:both;">
            <span>触发值/值域</span>
            <span style="color:black;"><%=trigger %></span>
            </div>
            <div style="clear:both;">
            <span>提交者</span>
            <span style="color:black;"><%=provider %></span>
            </div>
            <div style="clear:both;">
            <span>状态</span>
            <% 
            	if(state==0){%><span style="color:black;">未触发</span> <a href="/RiskManagement/changeState">已发生</a>	<%}
            	else if(state==1){%><span style="color:red;">已发生</span><a href="/RiskManagement/changeState">已解决</a><%}
            	else{%><span style="color:black;">已解决</span> <%}           
            %>
            </div>
            <div style="clear:both;">
            <span>跟踪者</span>
            <span style="color:black;"><%=tracker %></span>
        </form>
        <%} %>
        </div>
        <!-- test
        <div class="basic-grey">
        <form action="/RiskManagement/showRisk" method="post">
        	<div>
            <span>风险名称</span>
            <span style="color:black;">rname</span>
            </div>
            <div style="clear:both;">
            <span>内容</span>
            <span style="color:black;">content</span>
           	</div>
            <div style="clear:both;">
            <span>可能性</span>
           	<span style="color:black;">低</span>
           	<span style="color:blue;">中</span>
           	<span style="color:red;">高</span>       
            
            </div>
            <div style="clear:both;">
            <span>影响程度</span>
            <span style="color:black;">低</span>
            <span style="color:blue;">中</span>
            <span style="color:red;">高</span>         
            </div>
            <div style="clear:both;">
            <span>触发值/值域</span>
            <span style="color:black;">trigger</span>
            </div>
            <div style="clear:both;">
            <span>提交者</span>
            <span style="color:black;">provider</span>
            </div>
            <div style="clear:both;">
            <span>状态</span>
            <span style="color:black;">未触发</span> <a href="/RiskManagement/changeState">已发生</a>
           	<br><span style="color:red;">已发生</span><a href="/RiskManagement/changeState">已解决</a>
            <br><span style="color:black;">已解决</span>
            </div>
            <div style="clear:both;">
            <span>跟踪者</span>
            <span style="color:black;">tracker</span>
        </form>
        </div>
         -->
    </body>
</html>