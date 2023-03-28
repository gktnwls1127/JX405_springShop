<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="row justify-content-center">
            <h1 class="mb-5 text-center">LUMINOUS PRODUCT</h1>
            <hr/>
            <div class="mt-5 mb-5 col-6 align-items-center justify-content-center">
                <form action="/product/upsert" method="post" enctype="multipart/form-data">
                    <div class="row mb-3">
                        <div class="col justify-content-center">
                            <input class="form-control" type="hidden" id="productId" name="attemptId">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col justify-content-center">
                            <label for="productName" class="form-label">Product Name</label>
                            <input class="form-control" name="name" type="text" id="productName">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col justify-content-center">
                            <label for="inputGroupSelect01" class="form-label">Product Category</label>
                            <select class="form-select" name="categoryId" id="inputGroupSelect01">
                                <option selected>Category Choose...</option>
                                <c:forEach var="category" items="${categoryList}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col justify-content-center">
                            <label for="price" class="form-label">Product Price</label>
                            <input class="form-control" type="text" name="price" id="price">
                        </div>
                    </div>
<%--                    <div class="row mb-3">--%>
<%--                        <div class="col justify-content-center">--%>
<%--                            <label for="color" class="form-label">Product Color</label>--%>
<%--                            <input class="form-control" type="checkbox" id="color">--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="row mb-3">
                        <div class="col justify-content-center">
                            <label for="description" class="form-label">Product Description</label>
                            <textarea class="form-control" type="text" name="description" id="description"></textarea>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col justify-content-center">
                            <label for="formFile" class="form-label">Product Image</label>
                            <input class="form-control" type="file" name="image" id="formFile">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col justify-content-center">
                            <button type="submit" class="btn btn-primary">작성하기</button>
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
