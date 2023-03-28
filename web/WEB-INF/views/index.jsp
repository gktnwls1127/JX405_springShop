<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LUMINOUS</title>
    <link rel="stylesheet"
          href="https://owlcarousel2.github.io/OwlCarousel2/assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet"
          href="https://owlcarousel2.github.io/OwlCarousel2/assets/owlcarousel/assets/owl.theme.default.min.css">
</head>
<body>
<jsp:include page="tools/header.jsp"/>
<jsp:include page="tools/mainBanner.jsp"/>
<hr/>
<div>
    <h1 class="m-5">신제품</h1>
</div>
<div class="container">
    <div class="col">
        <div class="owl-carousel owl-theme">
            <c:forEach items="${list}" var="item">
                <div class="item">
                    <div class="card" style="width: 18rem; margin: 10px"
                         onclick="location.href='/product/showOne/${item.id}'">
                        <img src="/resources/${item.image}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">${item.name}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<hr/>
<div>
    <h1 class="m-5">베스트셀러</h1>
</div>
<div class="container">
    <div class="col">
        <div class="owl-carousel owl-theme">
            <c:forEach items="${bestList}" var="item">
                <div class="item">
                    <div class="card" style="width: 18rem; margin: 10px"
                         onclick="location.href='/product/showOne/${item.id}'">
                        <img src="/resources/${item.image}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">${item.name}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script src="https://owlcarousel2.github.io/OwlCarousel2/assets/vendors/jquery.min.js"></script>
<script src="https://owlcarousel2.github.io/OwlCarousel2/assets/owlcarousel/owl.carousel.js"></script>
<script>
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        responsiveClass: true,
        autoplay:true,
        autoplayTimeout:2000,
        autoplayHoverPause:true,
        responsive: {
            0: {
                items: 1,
                nav: true
            },
            600: {
                items: 2,
                nav: false
            },
            1000: {
                items: 4,
                nav: true,
                loop: false
            }
        }
    })

</script>
<jsp:include page="tools/footer.jsp"/>
</body>
</html>
