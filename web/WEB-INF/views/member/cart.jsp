<%--
  Created by IntelliJ IDEA.
  User: BTC-N01
  Date: 2023-03-22
  Time: 오후 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container-fluid">
    <div class="row h-100">
        <div class="col-8" style="border: 1px solid black">
            <div style="border: 2px #fe62b6; width: 600px; margin: 10px">
               <h3>CART</h3>
            </div>
            <hr/>
            왼쪽
        </div>
        <div class="col-4 " style="border: 1px solid black">
            <div style="border-top: 2px #fe62b6; width: 600px; margin: 10px">
                <h3>SUMMARY</h3>
            </div>
            <hr/>
            오른쪽
        </div>
    </div>
</div>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
