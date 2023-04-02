<%--
  Created by IntelliJ IDEA.
  User: BTC-N01
  Date: 2023-03-31
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문내역</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/js/order/orderList.js"></script>
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
                    <th>Date</th>
                    <th>Customer</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>count</th>
                    <th>price</th>
                    <th>totalPrice</th>
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
                        <td class="text-center">
                            <div>
                                <span class="orderProcess">${items.processing}</span>
                            </div>
                            <div>
                                <c:if test="${items.processing == '주문완료'}">
                                    <button class="btn btn-info delivery" onclick="deliveryStart()">배송시작
                                    </button>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>


                <!-- pagination -->
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
