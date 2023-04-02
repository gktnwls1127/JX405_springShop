$(document).ready(function () {
    setTotalInfo();
})

function setTotalInfo() {
    let totalPrice = 0;
    let deliveryPrice = 0;
    let sumPrice = 0;


    $('.cartInfo').each(function (index, element) {
        if ($(element).find(".cartCheck").is(":checked") === true) {
            totalPrice += parseInt($(element).find(".cartPrice_input").val());
        }
    })

    if (totalPrice >= 50000) {
        deliveryPrice = 0;
    } else if (totalPrice == 0) {
        deliveryPrice = 0;
    } else {
        deliveryPrice = 3000;
    }

    sumPrice = totalPrice + deliveryPrice;

    $('.totalPrice').text(totalPrice.toLocaleString() + "원");
    $('.sumPrice').text(sumPrice.toLocaleString() + "원");
    $('.deliveryPrice').text(deliveryPrice.toLocaleString() + "원");

}

$(function () {
    $(".cartCheck").on("change", function () {
        const checkboxes
            = document.querySelectorAll('input[name="check"]');
        // 선택된 체크박스
        const checked
            = document.querySelectorAll('input[name="check"]:checked');

        if (checkboxes.length === checked.length) {
            $('.all_check_input').prop("checked", true)
        } else {
            $('.all_check_input').prop("checked", false)
        }
        setTotalInfo($(".cartInfo"));
    });

    $(".up").on("click", function(){
        let quantity = $(this).parent("dl").find("input").val();
        $(this).parent("dl").find("input").val(++quantity);
        let cartId = $(this).closest('td').find('.cartId').val();

        countChange(cartId, quantity);
    });

    $(".down").on("click", function(){
        let quantity = $(this).parent("dl").find("input").val();
        if(quantity > 1){
            $(this).parent("dl").find("input").val(--quantity);

        }
        let cartId = $(this).closest('td').find('.cartId').val();
        countChange(cartId, quantity);
    });

})

function countChange(id, count){
    let formData ={
        id : id,
        productCount: count
    }

    $.ajax({
        url: "/cart/updateCount",
        type: "POST",
        data: formData,
        success: (response) => {
            if (response == "success") {
                location.reload();
            } else {
                Swal.fire({
                    title: "!!! ERROR !!!",
                    text: "수량 변경에 실패하였습니다.",
                    icon: "error"
                }).then(() => {
                    location.reload()
                })

            }
        }
    })
}

function selectAll() {
    let check = $("input[name=check]")
    /* 체크박스 체크/해제 */
    if ($(".all_check_input").is(":checked")) {
        check.prop("checked", true);
    } else {
        check.prop("checked", false);
    }

    setTotalInfo($(".cartInfo"));

}

function delRow() {
    let checkRows = $("[name='check']:checked");

    if (checkRows.length == 0) {
        Swal.fire({
            title: "Warning",
            text: "삭제하실 상품을 선택해주세요.",
            icon: "warning"
        })
    } else {
        let formData = [];
        checkRows.each((index, element) => {
            let cartId = $(element).closest('td').find('.cartId').val();
            formData.push(cartId)
        })

        console.log(formData)

        Swal.fire({
            title: '장바구니 상품삭제',
            text: "정말로 해당 상품을 삭제하시겠습니까? 하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/cart/deleteSelect",
                    type: "GET",
                    data: {cartId : formData},
                    traditional : true,
                    success: (response) => {
                        if (response == "success") {
                            Swal.fire({
                                title: "성공",
                                text: "성공적으로 장바구니에 삭제 되었습니다.",
                                icon: "success"
                            }).then(() => {
                                location.reload()
                            })
                        } else {
                            Swal.fire({
                                title: "!!! ERROR !!!",
                                text: "전체 삭제가 실패하였습니다.",
                                icon: "error"
                            }).then(() => {
                                location.reload()
                            })

                        }
                    }
                })
            }
        })
    }

}

function deleteAll() {

    let formData = {
        "memberId": $(".cartMemberId")[0].value,
    }

    $.ajax({
        url: "/cart/deleteAll",
        type: "GET",
        data: formData,
        success: (response) => {
            if (response == "success") {
                Swal.fire({
                    title: "성공",
                    text: "성공적으로 장바구니에 삭제 되었습니다.",
                    icon: "success"
                }).then(() => {
                    location.reload()
                })
            } else {
                Swal.fire({
                    title: "!!! ERROR !!!",
                    text: "전체 삭제가 실패하였습니다.",
                    icon: "error"
                }).then(() => {
                    location.reload()
                })

            }
        }
    })
}

function buyButton(){
    let checkRows = $("[name='check']:checked");
    let formData = []

    checkRows.each((index, element) => {
        let cartId = $(element).closest('td').find('.cartId').val();
        let totalPrice = $('.sumPrice').text().replace('원', '').replace(",", "");
        let productId = $(element).closest('td').find('.productId').val();
        let memberId = $(element).closest('td').find('.cartMemberId').val();
        formData.push({"memberId" : memberId, "cartId": cartId, "totalPrice" : totalPrice, "productId" : productId})

    })

    $.ajax({
        url: "/order/buy",
        type: "POST",
        data: {cart : JSON.stringify(formData)},
        traditional : true,
        success: (response) => {
            if (response == "success") {
                Swal.fire({
                    title: "성공",
                    text: "구매가 완료되었습니다.",
                    icon: "success"
                }).then(() => {
                    location.reload()
                })
            } else {
                Swal.fire({
                    title: "!!! ERROR !!!",
                    text: "구매가 실패하였습니다.",
                    icon: "error"
                }).then(() => {
                    location.href='/cart/payPage'
                })

            }
        }
    })

    console.log(formData)

}