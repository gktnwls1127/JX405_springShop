<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>좋아요한 상품</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/js/like/likeList.js"></script>
    <style>
        .rwd-table {
            margin: auto;
            width: 95%;
            border-collapse: collapse;
        }

        .rwd-table tr:first-child {
            background: #fe62b6;
            color: #fff;
        }

        .rwd-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: white;
        }

        /*.rwd-table tr:nth-child(odd):not(:first-child) {*/
        /*    background-color: #ebf3f9;*/
        /*}*/

        .rwd-table th {
            display: none;
        }

        .rwd-table td {
            display: block;
        }

        .rwd-table td:first-child {
            margin-top: .5em;
        }

        .rwd-table td:last-child {
            margin-bottom: .5em;
        }

        .rwd-table td:before {
            /*content: attr(data-th) ": ";*/
            font-weight: bold;
            width: 120px;
            display: inline-block;
            color: #000;
        }

        .rwd-table th,
        .rwd-table td {
            text-align: left;
        }

        .rwd-table {
            color: #333;
            border-radius: .4em;
            overflow: hidden;
        }

        .rwd-table tr {
            border-color: #fe62b6;
        }

        .rwd-table th,
        .rwd-table td {
            padding: .5em 1em;
        }

        @media screen and (max-width: 1200px) {
            .rwd-table tr:nth-child(2) {
                border-top: none;
            }

            .rwd-table th:first-child,
            .rwd-table td:first-child {
                font-weight: bold;
                color: black;
            }

            .rwd-table td a {
                text-decoration: none;
                color: black;
            }
        }

        @media screen and (min-width: 1000px) {
            .rwd-table tr:hover:not(:first-child) {
                background-color: rgba(237, 169, 211, 0.3);
                /*background-color: #83F4B4;과 동일 opacity*/
            }

            .rwd-table td:before {
                display: none;
            }

            .rwd-table td a {
                text-decoration: none;
                color: black;
            }

            .rwd-table th,
            .rwd-table td {
                display: table-cell;
                padding: .25em .5em;
            }

            .rwd-table th:first-child,
            .rwd-table td:first-child {
                font-weight: bold;
                padding-left: 0;
            }

            .rwd-table th:last-child,
            .rwd-table td:last-child {
                padding-right: 0;
            }

            .rwd-table th,
            .rwd-table td {
                padding: 1em !important;
            }
        }

        .update,
        .delete {
            border: none;
            width: 100px;
            color: #fff;
            font-weight: bold;
            margin: 2px;
        }
    </style>
</head>
<body>
<%@include file="../tools/header.jsp" %>
<div class="container">
    <div style="margin: 50px" class="row align-items-center">
        <div class="col">


            <table class="rwd-table">
                <tbody>
                <tr>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Like Button</th>
                </tr>
                <c:forEach items="${likeList}" var="items">
                    <tr class="KOTRA-fontsize-80">
                        <td>${items.name}</td>
                        <td><img src="/resources/${items.image}" width="80px"></td>
                        <td>${items.price}</td>
                        <td>${items.categoryName}</td>
                        <td>${items.description}</td>
                        <td class="text-center">
                            <div class="likeButton col">
                                <input type="hidden" value="${items.id}" class="likeId"/>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                     class="bi bi-heart-fill" viewBox="0 0 16 16"
                                     style="color: #fe62b6; border-color: #ff009c">
                                    <path fill-rule="evenodd"
                                          d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                </svg>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="${pagingAddr}/1">&laquo</a>
                            </li>
                            <c:forEach var="i" begin="${paging.start}" end="${paging.end}">
                                <c:choose>
                                    <c:when test="${i eq paging.current}">
                                        <li class="page-item active disabled">
                                            <a class="page-link" href="${pagingAddr}/${i}">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="${pagingAddr}/${i}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li>
                                <a class="page-link" href="${pagingAddr}/${paging.totalPage}">&raquo</a>
                            </li>
                        </ul>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="../tools/footer.jsp" %>
</body>
</html>
