<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="row justify-content-center">
            <h1 class="mb-5 text-center">LUMINOUS REGISTER</h1>
            <hr/>
            <div class="mt-5 mb-5 col-6 align-items-center justify-content-center">
                <div class="row">
                    <div class="col">
                        <c:if test="${not empty message}">
                            <div class="alert alert-dismissible alert-danger">
                                <h3>${message}</h3>
                            </div>
                        </c:if>
                    </div>
                </div>
                <form method="post" action="/member/register">
                    <div class="row">
                        <div class="col justify-content-center">
                            <label for="input-username">아이디</label>
                            <input type="text" name="username" class="form-control" id="input-username"style="width: 500px; height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-password">비밀번호</label>
                            <input type="password" name="password" class="form-control" id="input-password" style="width: 500px; height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-nickname">닉네임</label>
                            <input type="text" name="nickname" class="form-control" id="input-nickname" style="width: 500px; height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <button class="btn btn-primary" type="submit" style="width: 500px; height: 50px; margin-bottom: 20px; background-color: #fe62b6; border-color: #fe62b6">회원가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
