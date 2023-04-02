<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ORDER</title>
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
<div class="container-fluid">
    <div class="row">
        <%@include file="adminNav.jsp" %>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Order List</h1>
            </div>
            <div style="margin: 50px" class="row align-items-center">
                <div class="col">
                    <table class="rwd-table">
                        <tbody>
                        <tr>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>count</th>
                            <th>price</th>
                            <th>totalPrice</th>
                            <th>Seller Id</th>
                            <th>Control</th>
                        </tr>
                        <c:forEach items="${orderList}" var="items">
                            <tr class="KOTRA-fontsize-80">
                                <input type="hidden" class="orderId" value="${items.id}"/>

                                <td rowspan="">${items.entryDate}</td>
                                <td rowspan="">${items.username}</td>
                                <td>${items.name}</td>
                                <td><img src="/resources/${items.image}" width="80px"></td>
                                <td>${items.productCount}</td>
                                <td>${items.price * items.productCount}</td>
                                <td rowspan="">${items.totalPrice}</td>
                                <td rowspan="">${items.sellerId}</td>
                                <td class="text-center">
                                    <span class="orderProcess">${items.processing}</span>
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
            <canvas class="my-4 w-100" id="myChart" width="946" height="199"
                    style="display: block; box-sizing: border-box; height: 199px; width: 946px;">

            </canvas>
        </main>
    </div>
</div>
</body>
</html>
