<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="row justify-content-center">
            <h1 class="m-5 text-center">LUMINOUS PRODUCT</h1>
            <hr/>
            <div class="mt-5 mb-5 col-12">
                <form action="/product/upsert" method="post" enctype="multipart/form-data">
                    <div class="row  align-items-center">
                        <div class="col-4">
                            <div class="select_img" style="margin: 20px">
                                <c:choose>
                                    <c:when test="${product.image eq null}">
                                        <span>사진을 등록해주세요</span>
                                    </c:when>
                                    <c:otherwise>
                                        <img src=""/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row mb-3">
                                <div class="col justify-content-center">
                                    <input class="form-control" type="hidden" id="productId" name="attemptId"
                                           value="${product.id}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col justify-content-center">
                                    <label for="productName" class="form-label">Product Name</label>
                                    <input class="form-control" name="name" type="text" id="productName"
                                           value="${product.name}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col justify-content-center">
                                    <label for="inputGroupSelect01" class="form-label">Product Category</label>
                                    <select class="form-select" name="categoryId" id="inputGroupSelect01">
                                        <option selected value="${product.categoryId}">Category Choose...</option>
                                        <c:forEach var="category" items="${categoryList}">
                                            <option value="${category.id}">${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col justify-content-center">
                                    <label for="price" class="form-label">Product Price</label>
                                    <input class="form-control" type="text" name="price" id="price"
                                           value="${product.price}">
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
                                    <textarea class="form-control" type="text" name="description"
                                              id="description">${product.description}</textarea>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col justify-content-center">
                                    <label for="formImg" class="form-label">Product Image</label>
                                    <input class="form-control" type="file" name="file" id="formImg">
                                    <script>
                                        $(".select_img img").attr("src", "/resources/${product.image}").width(380);
                                        $("#formImg").change(function () {
                                            if (this.files && this.files[0]) {
                                                let reader = new FileReader;
                                                reader.onload = function (data) {
                                                    $(".select_img img").attr("src", data.target.result).width(380);
                                                }
                                                reader.readAsDataURL(this.files[0]);
                                            }
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col justify-content-center">
                                    <button type="submit" class="btn btn-primary col-12"
                                            style="background-color: #fe62b6; border-color: #fe62b6">작성하기
                                    </button>
                                </div>
                            </div>
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
