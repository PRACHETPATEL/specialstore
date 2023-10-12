const paymentStart=(amount)=>{
    console.log("payment started for RS. ",amount);
    $.ajax(
        {
            url:'checkout',
            data:JSON.stringify({amount:amount,info:'order_request'}),
            contentType:'application/json',
            type:'POST',
            dataType:'json',
            success:function (response){
            },
            error:function (error){
                console.log(error);
                alert("something went wrong!!");
            }
        }
    )
};