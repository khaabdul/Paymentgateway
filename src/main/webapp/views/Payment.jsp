<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">Hello Welcome TO Paymnet Intregration</h1>
	<form action="pay" method="post">
		<div class="form-group" align="center">
			<label for="exampleInputEmail1">Email address</label> <input
				type="text" class="form-control" name="Amount" id="payment_field"
				placeholder="Enter Amount">
		</div>
		<div align="center">
			<button onclick="paymentStart()" class="btn btn-primary"
				type="button">Pay</button>
		</div>
	</form>
	<h1 align="center">${succ }</h1>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	const paymentStart = () => {
	console.log("Payment Started....");
	let amount=$("#payment_field").val();
	console.log(amount);
	$.ajax(
	{
	url:'/order',
	data:JSON.stringify({amount:amount}),
	contentType:'application/json',
	type:'POST',
	dataType:"json",
	success:function(response){
	console.log(response)
	if(response.status=="created"){
	let options={
	key: "rzp_test_GbSpoVJ9EMyiIA",
	amount:response.amount,
	currency:"INR",
	name:"TeckSkills",
	description:"Fees Payment",
	order_id:response.id,
	handler:function(response){
	console.log(response.razorpay_payment_id)
	console.log(response.razorpay_order_id)
	console.log(response.razorpay_signature)
	console.log("payment Done")	},
		};
		var rzp1 = new Razorpay(options);
	rzp1.on('payment.failed', function (response){
	alert(response.error.code);
	alert(response.error.description);
	alert(response.error.source);
	alert(response.error.step);
	alert(response.error.reason);
	alert(response.error.metadata.order_id);
	alert(response.error.metadata.payment_id);	
});
rzp1.open();
	}
},
	error:function(error){
	console.log(error)
	}
	}
	)
	};
	</script>
</body>
</html>