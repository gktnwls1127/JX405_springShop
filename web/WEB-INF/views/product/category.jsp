<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BTC-N01
  Date: 2023-03-24
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LUMINOUS</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <c:forEach var="item" items="${list}">
            <div class="col" onclick="location.href='/product/showOne/${item.id}'">
                <div class="card">
                    <img src="/resources/${item.image}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" style=" overflow: hidden; text-overflow: ellipsis; line-height: 1.4em; height: 2.8em; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">${item.name}</h5>
                        <p class="card-text">₩${item.price}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
