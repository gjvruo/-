<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="domain.BasketItem" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="CEce" content="width=device-width, initial-scale=1.0">
	<title>login</title>
	<!-- Loading Bootstrap -->
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="./css/flat-ui.css" rel="stylesheet">
    <link href="./css/demo.css" rel="stylesheet">
	<link rel="shortcut icon" href="./images/favicon.ico">
    <!-- 
    <style>
    body
	{
		/*背景色设定*/
		background-color: #66B3FF;
	}
	#tabs
	{
		width: 48%;
		/*透明度设定*/
		opacity: 0.5;
		float: left;
	}
	#tabs1
	{
		width: 50%;
		/*透明度设定*/
		opacity: 0.5;
		float: right;
	}
	</style>
     -->
</head>
<body>
<div class="container">
	<!-- <div class="col-md-5"> -->
	<div class="demo-headline">
        <h1 class="demo-logo">
          Online Book Store
          <small>Nothing but for display</small>
        </h1>
    </div>
    <%HttpSession s = request.getSession();%>
    <div class="row demo-row">
        
          <div class="navbar navbar-inverse">
          	<div class="navbar-header">
	          	<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-collapse-01"></button>
          	</div>            
            <div class="navbar-collapse collapse navbar-collapse-01">
              <ul class="nav navbar-nav navbar-left">
                <li>
                  <a href="./homepage.jsp">
                    Homepage
                    <span class="navbar-unread">1</span>
                  </a>
                </li>
                
                <li>
                  <a href="allbooks.jsp">
                    View Books
                  </a>
                </li>
                
                <li>
                	<a href="">Statistics</a>
                	<ul>
                  		<li><a href="sbookShow.action">Statistics for the books</a></li>
                  	</ul>
                </li>
                
                <li class="active">
                  <a href="basket.jsp">
                    Basket
                    <span class="navbar-unread">1</span>
                  </a>
                  <ul>
                  	<%
                  	List<BasketItem> basketBuf = (List<BasketItem>) session.getAttribute("basket");
                  	if (basketBuf == null)
                  	{
                  		out.println("<li><a>");
                  		out.println("Void");
                  		out.println("</a></li>");
                  	}
                  	else
                  	{
                  		for (int i = 0; i < basketBuf.size(); i++)
                      	{
                      		out.println("<li><a>");
                      		out.println(basketBuf.get(i).getISBN());
                      		out.println(", ");
                      		out.println(basketBuf.get(i).getCount());
                      		out.println("</a></li>");
                      	}
                  	}
                  	%>
                  </ul> 
                </li>
                
                <li>
                  <a href="changeinfo.jsp">
                    Change User Info
                  </a>
                </li>
                
                <li>
                  <a href="orderShow.action">
                    View Orders
                  </a>
                </li>
                
                <li>
                	<a href="logout.action">
                	Logout(<%=s.getAttribute("username") %>)
                	</a>
                </li>
              </ul>
            </div><!--/.nav -->
          </div>
        
      </div>
    <div>
    	<div class="row">
    		<div class="col-md-8">
    			<p class="lead">The Basket</p>
    		</div>
    		<div class="col-md-2">
    			<a href="bargain.action" class="btn btn-success btn-wide">
  					Submit
				</a>
    			
    		</div>
    		<div class="col-md-2">
    			<a href="#fakelink" class="btn btn-default btn-wide">
  					Cancel
				</a>
    		</div>
    	</div>
    <%
    int countBuf = ((List<BasketItem>)session.getAttribute("basket")).size();
    int buf = 0;
    while (countBuf > 0)
    {
    	out.println("<div class='row demo-row' style = 'width:100%'>");
    	// BUG: <4
    	for (int i = 0; i < Math.min(3, countBuf); i++)
    	{
    		BasketItem bookBuf = (BasketItem)((List<BasketItem>)session.getAttribute("basket")).get(buf + i);
    		out.println("<div class='col-md-4'>");
    		out.println("<div class='pallete-item' style = 'width:100%'><dl class='palette palette-emerald'><dt>ISBN:");
    		out.println(bookBuf.getISBN());
    		out.println("</dt></dl>");
    		out.println("<dl class='palette palette-asbestos'><dt>Count:");
    		out.println(bookBuf.getCount());
    		
    		out.println("</dt></dl></div>");
    		out.println("</div>");
    	}
    	countBuf = countBuf - 3;
    	buf = buf + 3;
    	out.println("</div>");
    }
    %>
    </div>
</div>
	<!-- Load JS here for greater good =============================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/flat-ui.min.js"></script>
</body>
</html>