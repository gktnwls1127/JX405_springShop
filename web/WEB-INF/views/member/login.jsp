<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LogIn</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<diV class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="row justify-content-center">
            <h1 class="mb-5 text-center">LUMINOUS LOGIN</h1>
            <hr/>
            <div class="mt-5 mb-5 col-5 align-items-center justify-content-center">
                <form method="post" action="/member/auth" >
                    <div class="row">
                        <div class="col justify-content-center">
                            <label for="input-username">아이디</label>
                            <input type="text" name="username" class="form-control" id="input-username"
                                   style="width: 500px; height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col justify-content-center">
                            <label for="input-password">비밀번호</label>
                            <input type="password" name="password" class="form-control" id="input-password"
                                   style="width: 500px; height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col justify-content-center">
                            <button type="submit" class="btn btn-primary mt-3"
                                    style="width: 500px; height: 50px; margin-bottom: 20px; background-color: #fe62b6; border-color: #fe62b6">로그인
                            </button>
                        </div>
                    </div>
<%--                    <div class="row">--%>
<%--                        <div class="col justify-content-center">--%>
<%--                            <button class="btn btn-outline-info" onclick="location.href='/member/register'" style="width: 500px; height: 50px; color: #fe62b6; border-color: #fe62b6">회원가입--%>
<%--                                하기</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </form>
                ${message}
            </div>
        </div>

    </div>
</diV>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
