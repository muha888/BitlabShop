<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<%@include file="navbar.jsp"%>
<body>


<div class="container mt-3 text-center">
    <div class="row">
        <div class="col">
            <h2>Welcome to <%=title%></h2>
            <p>Electronic devices with high quality</p>
        </div>
    </div>
</div>

<div class="container mt-3 text-center">
    <div class="row">
        <%ArrayList<Item> items =  (ArrayList<Item>) request.getAttribute("items");
            if(items != null){
                for(Item it : items){

        %>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <%= it.getName()%>
                </div>
                <div class="card-body">
                    <img src="<%=it.getPhotoUrl()%>" class="card-img-top" alt="..." style="width: 150px;">
                    <h5 class="card-title"> <%=it.getPrice()%></h5>
                    <p class="card-text"> <%=it.getDescription()%></p>
                    <button class="btn btn-success">Buy Now</button>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
