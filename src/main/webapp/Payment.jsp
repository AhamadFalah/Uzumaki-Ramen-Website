<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="images/ramen78.png"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
<title>Payment</title>
</head>
<body>

<input type="hidden" id="present" value="<%=request.getAttribute("present") %>"/>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="http://localhost:8080/JAVAWebApplication/AddPayment" method="post">
        <h1 style="align: left;">Total:<%=request.getParameter("total") %></h1>
        <h1 style="align: left;">Total with discount:<%=request.getAttribute("finalvalue") %></h1>
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
      <input type="hidden" value="<%=session.getAttribute("id") %>" name="UserID">
      <input type="hidden" value="<%=request.getParameter("total") %>" name="Total">
      <input type="hidden" value="<%=request.getParameter("ItemList") %>" name="ItemList">
            <label for="fname"><i class="fa fa-user" ></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe" required>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com" required>
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street" required>
            <label for="paymentMethod">Select Payment Method:</label>
			<select id="paymentMethod" name="paymentMethod">
  					<option value="CashOnDelivery">Cash On Delivery</option>
  					<option value="creditCard">Card Payment</option>
		   </select>          
          </div>
			
		<div id="cardPaymentSection">
          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          </div>
        </div>
        <input type="submit" value="Finalise Payment" class="btn">
      </form>
      <br>
        <a href="ShoppingCart.jsp"><button class="btn">Go back to Shopping Cart</button></a>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
     <!-- <a href="<c:url value='ListItemsInPayment'/>?userID=<%=session.getAttribute("id") %>">List Items</a> -->
      <p><%=request.getParameter("ItemList") %></p>
      <p><a href="#"></a> <span class="price"></span></p>
      <hr>
      <p>Total <span class="price" style="color:black"><b><%=request.getParameter("total") %></b></span></p>
      <p>Discount <span class="price" style="color:black"><b><%=request.getAttribute("discount") %></b></span></p>
      <p>Final total <span class="price" style="color:black"><b><%=request.getAttribute("finalvalue") %></b></span></p>
    </div>
        <div class="col-25" style="margin-top:25px;">
    <div class="container">
      <h4>Promo Code<span class="price" style="color:black"><b></b></span></h4>
      <form method="post" action="http://localhost:8080/JAVAWebApplication/PromoCodeCheckCal">
      <input type="hidden" value="<%=session.getAttribute("id") %>" name="UserID">
      <input type="hidden" value="<%=request.getParameter("ItemList") %>" name="ItemList">
      <input type="hidden" name="total" value=<%=request.getParameter("total") %> />
      <input type="text" name="promocode" style="text-transform: uppercase"/>
      <input type="submit" value="submit" class="btn"/>
      </form>
    </div>
  </div>
  </div>

</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">	
<script type="text/javascript">
let present=document.getElementById("present").value;
if(present=="error"){
	swal("Wrong Promo Code","Try again","error");
	//alert("Wrong promo Code");
}
</script>

<script>
document.addEventListener('DOMContentLoaded', function () {
  // Get references to the payment method and card payment section
  const paymentMethod = document.getElementById('paymentMethod');
  const cardPaymentSection = document.getElementById('cardPaymentSection');

  // Add an event listener to the payment method dropdown
  paymentMethod.addEventListener('change', function () {
    if (paymentMethod.value === 'creditCard') {
      cardPaymentSection.style.display = 'block'; // Show card payment section
    } else {
      cardPaymentSection.style.display = 'none'; // Hide card payment section
    }
  });

  // Set the initial state based on the default selection
  if (paymentMethod.value === 'creditCard') {
    cardPaymentSection.style.display = 'block'; // Show card payment section
  } else {
    cardPaymentSection.style.display = 'none'; // Hide card payment section
  }
});
</script>

</body>
</html>
