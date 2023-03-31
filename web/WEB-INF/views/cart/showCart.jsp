<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CART</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/js/cart/showCart.js"></script>
    <style>
        #cart .cartList {
            padding: 20px;
            border-bottom: 1px solid #000;
            width: 100%;
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
        }

        #cart .cartImg {
            float: left;
            width: 150px;
        }

        #cart .cartInfo {
            float: left;
            width: calc(100% - 150px);
            padding-left: 30px;
            position: relative;
        }
    </style>
</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container-fluid" id="cart">
    <div class="row">
        <div class="col-8" style="border: 1px solid black">
            <div style="padding: 20px 20px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #000; position: relative;">
                CART
                <span><input id="product_select_all" class="all_check_input" onclick="selectAll()" type="checkbox" checked="checked" style="position: absolute; right: 20px; top: 22px;"></span>
            </div>
            <table class="col-12">
                <c:forEach items="${cartList}" var="items">
                    <c:if test="${items.order ne 'ordered'}">
                        <tr class="cartList">
                            <td class="cartImg">
                                <a href="/product/showOne/${items.productId}">
                                    <img src="/resources/${items.image}" height="150">
                                </a>
                            </td>
                            <td class="cartInfo">
                                <input class="cartId" type="hidden" value="${items.id}"/>
                                <input class="cartMemberId" type="hidden" value="${items.memberId}"/>
                                <div class="productName">
                                    <input class="productId" type="hidden" value="${items.productId}">
                                    <a href="/product/showOne/${items.productId}">${items.name}</a>
                                    <ul>
                                        <li>
                                            <span>${items.name}</span>(<span class="productCount">${items.productCount}</span>개)
                                        </li>
                                    </ul>
                                </div>
                                <div class="checkbox" style="position: absolute; right: 0;top: 0;">
                                    <input type="checkbox" id="cartCheck" class="cartCheck"
                                           name="check" checked="checked"></div>
                                <div class="cartPrice"
                                     style="font-weight: 400; position: absolute; right: 0; bottom: 0; margin: 0;">
                                    <input type="hidden" class="cartPrice_input" value="${items.price * items.productCount}">
                                    <fmt:formatNumber pattern="₩ #,###" value="${items.price * items.productCount}"/>
                                </div>
                                <dl class="cartQty"
                                    style="letter-spacing: 0.5px; line-height: 1.56; position: absolute; bottom: 0;">
                                    <a  class="down" style="display: inline-block; vertical-align: baseline;">−</a>
                                    <input id="input-quantity" class="quantity" name="quantity" size="2" value="${items.productCount}" onchange="countChange()"
                                           type="text"
                                           style="width: 50px; height: auto; text-align: center; vertical-align: baseline;">
                                    <a class="up" style="display: inline-block; vertical-align: baseline;">+</a>
                                </dl>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
            <div style="padding: 20px; border-bottom: 1px solid #000; display: flex;">
                <a href="#none" class="select_delete" onclick="delRow()"
                   style="flex: 0 0 auto; width: 50%; color: #a8a9ad; font-size: 15px; letter-spacing: -0.1em;">선택 상품 삭제</a>
                <a href="#none" class="all_delete" onclick="deleteAll()"
                   style="flex: 0 0 auto; width: 50%; color: #a8a9ad; font-size: 15px; letter-spacing: -0.1em; text-align: right;">전체 상품 삭제</a>
            </div>
        </div>

        <div class="col-4 " style="border: 1px solid black">
            <div style="padding: 20px 20px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #000; position: relative;">
                SUMMARY
            </div>
            <div class="bagArea_sum mb-5" style="text-align: center; padding: 20px 20px 0;">
                <ul style="margin: 0 0 10px; font-size: 0; display: flex;list-style:none; padding-left: 0px;">
                    <li style="flex: 0 0 auto; width: 50%; font-size: 16px; text-align: left;list-style:none;">결제예정금액
                    </li>
                    <li class="totalPrice" style="text-align: right;flex: 0 0 auto; width: 50%; font-size: 16px;">
                        <strong id="total_order_price_front"><fmt:formatNumber pattern="#,###원" value=""/></strong>
                    </li>
                </ul>
                <ul style="margin: 0 0 10px; font-size: 0; display: flex;list-style:none; padding-left: 0px;">
                    <li style="flex: 0 0 auto; width: 50%; font-size: 16px; text-align: left;list-style:none;">총 상품금액
                    </li>
                    <li class="sumPrice" style="text-align: right;flex: 0 0 auto; width: 50%; font-size: 16px;">
                        <span><fmt:formatNumber pattern="#,###원" value=""/></span>
                    </li>
                </ul>
                <ul style="margin: 0 0 10px; font-size: 0; display: flex; padding-left: 0px;">
                    <li style="flex: 0 0 auto; width: 50%; font-size: 16px; text-align: left;list-style:none;">배송비</li>
                    <li class="deliveryPrice"
                        style="text-align: right;flex: 0 0 auto; width: 50%; font-size: 16px;list-style:none;">
                        <span id="total_delv_price_front" class="total_delv_price_front"><fmt:formatNumber pattern="#,###원" value=""/></span>
                        <span class="displaynone"><span class="total_delv_price_back">
                            <span class="total_delv_price_back"></span></span></span>
                    </li>
                </ul>
                <%--                <ul class="">--%>
                <%--                    <li>총 할인금액</li>--%>
                <%--                    <li class="sum_price">--%>
                <%--                        <span id="total_product_discount_price_front">0</span>원					--%>
                <%--                        <span class="refer displaynone"></span>--%>
                <%--                    </li>--%>
                <%--                </ul>--%>
            </div>
            <div>
                <button class="btn btn-info col-12" style="border-radius: 30px; background-color: #fe62b6 !important; border-color: #fe62b6; font-size: 20px" onclick="buyButton()">구매하기</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../tools/footer.jsp"/>
</body>
</html>
