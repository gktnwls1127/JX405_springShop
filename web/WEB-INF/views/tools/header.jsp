<%@ page import="com.bit.shop.model.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <style>
        .offcanvas-backdrop {
            top: 200px
        }

        a {
            color: black;
            text-decoration-line: none;
        }

        .nav-link {
            color: black !important;
        }

    </style>
    <%
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        pageContext.setAttribute("logIn", logIn);
    %>
</head>
<body>
<div style="padding: 20px; display: flex; justify-content: space-between;">
    <%-- 로고 --%>
    <a href="/"><img src="/resources/images/logo.png" style="height: 100px !important;"/></a>
    <%-- 우상단 메뉴--%>
    <div style="display:flex;">
        <%-- 검색--%>
        <a class="m-3" style="padding-right:4px; border: none; background-color: white; color: #fe62b6"
           data-bs-toggle="offcanvas"
           data-bs-target="#offcanvasTop"
           aria-controls="offcanvasTop">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-search-heart"
                 viewBox="0 0 16 16">
                <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
                <path d="M13 6.5a6.471 6.471 0 0 1-1.258 3.844c.04.03.078.062.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1.007 1.007 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5ZM6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"/>
            </svg>
        </a>
        <%-- 로그인--%>
        <c:choose>
            <c:when test="${logIn eq null}">
                <div class="dropdown-center text-end m-2" style="padding-top: 3px">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                       aria-expanded="false" data-bs-offset="10,20">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             class="bi bi-person-circle" viewBox="0 0 16 16" style="color: #fe62b6">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd"
                                  d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg>
                            <%--                    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">--%>
                    </a>
                    <ul class="dropdown-menu text-small">
                        <li><a class="dropdown-item" href="/member/login">LogIn</a></li>
                        <li><a class="dropdown-item" href="/member/register">Register</a></li>
                    </ul>
                </div>

            </c:when>
            <c:otherwise>
                <c:if test="${logIn.role eq 'ROLE_USER'}">
                    <div class="dropdown-center text-end m-2" style="padding-top: 3px">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle"
                           data-bs-toggle="dropdown"
                           aria-expanded="false" data-bs-offset="10,20">
                            <img src="/resources/images/basicprofile.jpg" alt="mdo" width="24" height="24"
                                 class="rounded-circle" border="2px" style="border-color: #fe62b6">
                        </a>
                        <ul class="dropdown-menu text-small">
                            <li><a class="dropdown-item" href="/member/myPage/${logIn.id}">MyPage</a></li>
                            <li><a class="dropdown-item" href="/member/orderList/${logIn.id}">OrderList</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/member/logout">LogOut</a></li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${logIn.role eq 'ROLE_SELLER'}">
                    <div class="dropdown-center text-end m-2" style="padding-top: 3px">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle"
                           data-bs-toggle="dropdown"
                           aria-expanded="false" data-bs-offset="10,20">
                            <img src="/resources/images/basicprofile.jpg" alt="mdo" width="24" height="24"
                                 class="rounded-circle" border="2px" style="border-color: #fe62b6">
                        </a>
                        <ul class="dropdown-menu text-small">
                            <li><a class="dropdown-item" href="/member/myPage/${logIn.id}">MyPage</a></li>
                            <li><a class="dropdown-item" href="/member/orderList/${logIn.id}">OrderList</a></li>
                            <li><a class="dropdown-item" href="/product/productList/${logIn.id}/1">ProductList</a></li>
                            <li><a class="dropdown-item" href="/product/upsert">Product Register</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/member/logout">LogOut</a></li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${logIn.role eq 'ROLE_ADMIN'}">
                    <div class="dropdown-center text-end m-2" style="padding-top: 3px">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle"
                           data-bs-toggle="dropdown"
                           aria-expanded="false" data-bs-offset="10,20">
                            <img src="/resources/images/basicprofile.jpg" alt="mdo" width="24" height="24"
                                 class="rounded-circle" border="2px" style="border-color: #fe62b6">
                        </a>
                        <ul class="dropdown-menu text-small">
                            <li><a class="dropdown-item" href="/member/myPage/${logIn.id}">MyPage</a></li>
                            <li><a class="dropdown-item" href="/admin/adminPage">adminPage</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/member/logout">LogOut</a></li>
                        </ul>
                    </div>
                </c:if>

            </c:otherwise>


        </c:choose>

        <!-- 좋아요 -->
        <a href="/like/showLike/${logIn.id}/1" class="m-3" style="border: none; background-color: white; color: #fe62b6">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-bookmark-heart" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
                <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
            </svg>
        </a>


        <%-- 카트--%>
        <a href="/cart/showCart/${logIn.id}" class="m-3" style="border: none; background-color: white; color: #fe62b6">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart"
                 viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                <%--                <span class="position-absolute top-5 start-80 translate-middle badge rounded-pill bg-danger">--%>
                <%--                99+--%>
                <%--                <span class="visually-hidden">unread messages</span>--%>
                </span>
            </svg>
        </a>
    </div>


    <%-- 검색 offcanvas--%>
    <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel"
         style="top: 200px">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasTopLabel">Luminous Product Search</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <form class="d-flex" action="/product/search" method="get">
                <input class="form-control me-sm-2" type="search" placeholder="Search" name="keyword">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit"
                        style="background-color: #fe62b6 !important;" onclick="location.href='/product/searchPage'">
                    Search
                </button>
            </form>
        </div>
    </div>
</div>

<%--하단 카테고리 상단바--%>
<div class="container-fluid">
    <header class="d-flex flex-wrap align-items-center justify-content-center py-3 mb-4 border-bottom">
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li class="nav-item">
                <a class="nav-link active" href="/product/category/1">TOP
                    <span class="visually-hidden">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/2">OUTER</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/3">DRESS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/4">PANTS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/5">SKIRT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/6">BAG</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/7">SHOES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/category/8">ACC</a>
            </li>
        </ul>
    </header>
</div>
</body>
</html>
