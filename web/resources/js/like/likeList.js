$(function () {
    $(".likeButton").click(function () {
        console.log("start")
        if ($(this).children('svg').attr('class') == 'bi bi-heart-fill') {
            let formData = {
                "id": $(".likeId").val()
            }

            $.ajax({
                url: '/like/removeLike',
                type: 'get',
                data: formData,
                success: ((message) => {
                    if (message == "success") {
                        Swal.fire({
                            title: "♡",
                            text: "UNLIKE",
                            showConfirmButton: false,
                            timer: 1500
                        }).then(() => {
                            location.reload()
                        })
                    }
                })
            })
        }

    })
})