<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/showOne.css">

</head>
<body>
<jsp:include page="../tools/header.jsp"/>
<div class="container">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="col">
            <img src="/resources/${result.image}" width="500">
        </div>
        <div class="product-detail-info col" data-v-3b418965="">
            <div class="product-detail-title" data-v-3b418965="">${result.name}
                <div class="wish-icon cursor-pointer ">
                    <svg class="svg-icon undefined" aria-hidden="true" data-v-1324286a=""
                         style="width: 20px; height: 20px;">
                        <use xlink:href="#icon-wish" data-v-1324286a=""></use>
                    </svg>
                </div>
            </div>
            <div class="product-detail-price" data-v-3b418965="">
                <div class="price-wrapper" data-v-ece30fdc=""><span class="price-main f-black"
                                                                    data-v-ece30fdc="">₩${result.price}</span></div>
            </div>
            <div class="product-discount-tags" data-v-3b418965=""></div>
            <div class="cider-type-selector" data-v-a8fd4026="">
            </div>
            <div class="cider-num-selector" data-v-a97909b0="">
                <div class="cider-num-child" data-v-a97909b0="">
                    <div class="cider-button cursor-pointer button-large is-bold"
                         style="min-width: 100%; font-size: 16px;">
                        <svg class="cider-svg-icon " aria-hidden="true"
                             style="margin-right: 10px; width: 20px; height: 20px;">
                            <use xlink:href="#icon-add-bag" style="--color:#fff;"></use>
                        </svg>
                        장바구니에 넣기
                    </div>
                </div>
            </div>
            <div class="product-detail-desc">
                <div class="cider-accordion">
                    <div class="accordion-title"><span class="title"><div
                            class="desc-accordion-title">
                        배송 안내</div></span><span class="icon-arrow-down active"></span>
                    </div>
                    <div class="accordion-children" style="transition-duration: 300ms;">
                        <div class="desc-accordion-wrap">
                            <ul class="product-detail-shippingReturns">
                                <li>배송지:&nbsp;<span class="cider-popover-tooltip-content"><span
                                        class="hyperlinks cursor-pointer country">South Korea</span></span></li>
                                <ul class="list">
                                    <li><span class="">무료배송, ₩50,000+</span></li>
                                    <li><span class="">출고일부터: 3 - 5 영업일 (월-금) 기준</span></li>
                                    <li><span class="cursor-pointer"
                                              style="font-weight: bold; text-decoration: underline;">교환, 환불 정책</span>
                                    </li>
                                    <li><span class="cursor-pointer"
                                              style="font-weight: bold; text-decoration: underline;">배송 정책</span>
                                    </li>
                                </ul>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="cider-accordion">
                    <div class="accordion-title"><span class="title"><div
                            class="desc-accordion-title">제품 상세사항</div></span><span class="icon-arrow-down "></span>
                    </div>
                    <div class="accordion-children" style="height: 0px; transition-duration: 300ms;">
                        <div class="desc-accordion-wrap">
                            <ul>
                                <li>상황: 휴가</li>
                                <li>아이웨어 모양: 캣 아이</li>
                                <li>아이웨어 유형: 풀 림 안경</li>
                                <li>소재: PC</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="lazy-load-component" data-v-fdf2a5a3="">
            <div data-v-fdf2a5a3="" style="display: none;">
                <div class="lazy-component-loading" data-v-fdf2a5a3="" style="min-height: 0px;"></div>
            </div>
            <div data-v-fdf2a5a3="" style="display: block;"></div>
        </div>
    </div>
</div>
<hr/>
<div class="container">
    <h1 class="m-5">RECOMMEND ITEMS</h1>
    <hr class="mb-5"/>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <c:forEach var="items" items="${recommendItem}">
            <div class="col" onclick="location.href='/product/showOne/${items.id}'">
                <div class="card">
                    <img src="/resources/${items.image}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" style=" overflow: hidden; text-overflow: ellipsis; line-height: 1.4em; height: 2.8em; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">${items.name}</h5>
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
