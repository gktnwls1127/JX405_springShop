<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원정보 수정</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="row justify-content-center">
            <h1 class="mb-5 text-center">LUMINOUS "${result.username}"님의 PAGE</h1>
            <hr/>
            <div class="mt-5 mb-5 col-6 align-items-center justify-content-center">
                <form method="post" action="/member/update">
                    <div class="row">
                        <div class="col justify-content-center">
                            <input type="hidden" value="${result.id}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col justify-content-center">
                            <label for="input-username">아이디</label>
                            <input type="text" name="username" class="form-control" id="input-username"style="height: 50px; margin-bottom: 20px" value="${result.username}" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-password">새 비밀번호</label>
                            <input type="password" name="password" class="form-control" id="input-password" style="height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-oldPassword">현재 비밀번호</label>
                            <input type="password" name="oldPassword" class="form-control" id="input-oldPassword" style="height: 50px; margin-bottom: 20px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-nickname">닉네임</label>
                            <input type="text" name="nickname" class="form-control" id="input-nickname" style="height: 50px; margin-bottom: 20px"value="${result.nickname}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <button class="btn btn-primary" type="submit" style="width: 500px;  height: 50px; margin-bottom: 20px; background-color: #fe62b6; border-color: #fe62b6">수정하기</button>
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
