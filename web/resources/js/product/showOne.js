function addCart(pId, mId) {
    let formData = {
        productId: pId,
        memberId: mId,
        productCount: $(".numBox").val()

    }

    $.ajax({
        url: "/cart/addCart",
        type: "POST",
        data: formData,
        success: (response) => {
            if (response == "success") {
                Swal.fire({
                    title: "성공",
                    text: "성공적으로 장바구니에 추가 되었습니다.",
                    icon: "success"
                }).then(() => {
                    location.reload()
                })
            } else {
                Swal.fire({
                    title: "!!! ERROR !!!",
                    text: "상품을 장바구니에 추가하지 못하었습니다.",
                    icon: "error"
                }).then(() => {
                    location.reload()
                })

            }
        }
    })
}

$(function () {
    $(".plus").click(function () {
        let num = $(".numBox").val();
        let plusNum = Number(num) + 1;

        if (plusNum >= 100) {
            $(".numBox").val(num);
        } else {
            $(".numBox").val(plusNum);
        }
    });

    $(".minus").click(function () {
        let num = $(".numBox").val();
        let minusNum = Number(num) - 1;

        if (minusNum <= 0) {
            $(".numBox").val(num);
        } else {
            $(".numBox").val(minusNum);
        }
    });

    $(".likeButton").click(function (){

        console.log($(this).children('svg').attr('class'))
        if ($(this).children('svg').attr('class') == 'bi bi-heart'){
            let formData = {
                "productId" : $(".productId").val()
            }
            $.ajax({
                url : '/like/insertLike',
                type : 'post',
                data: formData,
                success : ((message)=>{
                    if (message == "success") {
                        $(this).html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"20\" height=\"20\" fill=\"currentColor\"\n" +
                            "                                 class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\"\n" +
                            "                                 style=\"color: #fe62b6; border-color: #ff009c\">\n" +
                            "                                <path fill-rule=\"evenodd\"\n" +
                            "                                      d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\"/>\n" +
                            "                            </svg>")
                    }
                })
            })

        } else if ($(this).children('svg').attr('class') == 'bi bi-heart-fill'){
            let formData = {
                "id" : $(".likeId").val()
            }
            $.ajax({
                url : '/like/removeLike',
                type : 'get',
                data: formData,
                success : ((message)=>{
                    if (message == "success") {
                        $(this).html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"20\" height=\"20\" fill=\"currentColor\"\n" +
                            "                                 class=\"bi bi-heart\" viewBox=\"0 0 16 16\">\n" +
                            "                                <path d=\"m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815\n" +
                            "                                2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878\n" +
                            "                                10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z\"></path>\n" +
                            "                            </svg>")
                    }
                })
            })
        }
    })
})


