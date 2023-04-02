<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MyPage</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="row justify-content-center">
            <h1 class="mb-5 text-center">LUMINOUS "${result.username}"님의 PAGE</h1>
            <hr/>
            <div class="mt-5 mb-5 col-5 align-items-center justify-content-center">
                <form>
                    <div class="row">
                        <div class="col justify-content-center">
                            <input type="hidden" value="${result.id}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col justify-content-center">
                            <label for="input-username">아이디</label>
                            <input type="text" name="username" class="form-control" id="input-username" value="${result.username}" style="height: 50px; margin-bottom: 20px" value="${result.username}" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-nickname">닉네임</label>
                            <input type="text" name="nickname" class="form-control" id="input-nickname" style="height: 50px; margin-bottom: 20px"value="${result.nickname}" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="input-role">등급</label>
                            <input type="text" name="role" class="form-control" id="input-role" style="height: 50px; margin-bottom: 20px" value="${result.role}" readonly>
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-5">
                        <button class="btn btn-primary" onclick="location.href='/member/update/${result.id}'" style="width: 500px; height: 50px; margin-bottom: 20px; background-color: #fe62b6; border-color: #fe62b6">회원정보 수정</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-5">
                        <button class="btn btn-outline-primary"  onclick="location.href='/member/delete/${result.id}'" style="width: 500px; height: 50px; margin-bottom: 20px; color: #fe62b6; border-color: #fe62b6">회원정보 탈퇴</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
