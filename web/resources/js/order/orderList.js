function deliveryStart(){
    let formData ={
        id : $('.orderId').val(),
        processing : '배송중'
    }
    $.ajax({
        url : '/order/updateProcessing',
        type : 'post',
        data : formData,
        success: (result) =>{
            if (result == "success"){
                $('.delivery').remove()
                location.reload();
            }
        }
    })
}

function buyFinish(){
    let formData ={
        id : $('.orderId').val(),
        processing : '구매확정'
    }
    $.ajax({
        url : '/order/finish',
        type : 'post',
        data : formData,
        success: (result) =>{
            if (result == "success"){
                location.reload();
            }
        }

    })
}