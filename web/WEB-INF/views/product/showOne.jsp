<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/product/showOne.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/js/product/showOne.js"></script>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row justify-content-center align-items-center">
        <input class="productId" type="hidden" value="${result.id}">
        <div class="col-lg-6">
            <div class="row justify-content-center mt-5 mb-5">
                <img class="productImg" src="/resources/${result.image}">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="row align-items-center mt-5 mb-3">
                <h3 class="col-11">${result.name}</h3>
                <!-- 좋아요 버튼 -->
                <div class="likeButton col">
                    <input type="hidden" value="${like.id}" class="likeId">
                    <c:choose>
                        <c:when test="${like eq null}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                 class="bi bi-heart" viewBox="0 0 16 16">
                                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815
                                2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878
                                10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"></path>
                            </svg>
                        </c:when>
                        <c:otherwise>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                 class="bi bi-heart-fill" viewBox="0 0 16 16"
                                 style="color: #fe62b6; border-color: #ff009c">
                                <path fill-rule="evenodd"
                                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                            </svg>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="mb-3">
                <span class="productPrice"><b><fmt:formatNumber pattern="₩ #,###" value="${result.price}"/></b></span>
            </div>

            <!-- 수량 버튼 -->
            <div class="mb-5">
                <a class="minus" style="display: inline-block; vertical-align: baseline; font-size: 20px">−</a>
                <input id="input-quantity" class="numBox" name="quantity" size="2" value="1" type="text"
                       style="width: 50px; height: auto; text-align: center; vertical-align: baseline;">
                <a class="plus" style="display: inline-block; vertical-align: baseline;">+</a>
            </div>

            <!--장바구니 버튼 -->
            <div class="mb-5">
                <div class="btn btn-outline-info text-center col-12" onclick="addCart(${result.id}, ${logInId})"
                     style="font-size: 16px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-basket2" viewBox="0 0 16 16">
                        <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z"/>
                        <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z"/>
                    </svg>
                    장바구니에 넣기
                </div>
            </div>

            <!-- 아코디언 -->
            <hr class="mb-5"/>
            <div class="accordion mb-5" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            배송 안내
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li class="m-3">배송지:&nbsp;
                                    <span>South Korea</span>
                                </li>
                                <ul class="list">
                                    <li class="m-2"><span>무료배송, ₩50,000+</span></li>
                                    <li class="m-2"><span>출고일부터: 3 - 5 영업일 (월-금) 기준</span></li>
                                    <li class="m-2"><span class="cursor-pointer"
                                                          style="font-weight: bold; text-decoration: underline;">교환, 환불 정책</span>
                                    </li>
                                    <li class="m-2"><span class="cursor-pointer"
                                                          style="font-weight: bold; text-decoration: underline;">배송 정책</span>
                                    </li>
                                </ul>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            제품 상세사항
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li class="m-2">상황 : 휴가</li>
                                <li class="m-2">아이웨어 모양 : 캣 아이</li>
                                <li class="m-2">아이웨어 유형 : 풀 림 안경</li>
                                <li class="m-2">소재 : PC</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<hr/>

<!-- 추천 제품 rand() -->
<div class="container">
    <h1 class="m-5">RECOMMEND ITEMS</h1>
    <hr class="mb-5"/>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <c:forEach var="items" items="${recommendItem}">
            <div class="col" onclick="location.href='/product/showOne/${items.id}'">
                <div class="card">
                    <img src="/resources/${items.image}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"
                            style=" overflow: hidden; text-overflow: ellipsis; line-height: 1.4em; height: 2.8em; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">${items.name}</h5>
                        <p class="card-text">₩${items.price}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
