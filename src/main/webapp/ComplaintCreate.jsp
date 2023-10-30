<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Report A Complaint</title>
<link rel="icon" type="image/png" href="images/ramen78.png"/>
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
/>

<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.css"
  rel="stylesheet"
/>

<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"
></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


<style type="text/css">

div{
  width: auto;
  margin: auto;
}


.img{
transform: translateX(150%);
transition-timing-function: cubic-bezier(0.25, 0.1, 0.25, 1);
}

#footer h2 {
  text-align: center;
  font-size: 1.8rem;
  padding: 2.6rem;
  font-weight: 500;
  color: #fff;
  background: rgb(65, 65, 65);
}

</style>
</head>
<body>
<%
String OrderID=request.getParameter("orderID");
String UserID=request.getParameter("userID");
%>

<input type="hidden" id="complaintPresent" value="<%=request.getAttribute("complaintPresent")%>">
<input type="hidden" id="insertStatus" value="<%=request.getAttribute("insertStatus")%>">
<div>
<section class="vh-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 text-black">

        <div class="px-5 ms-xl-4" style="margin-top:-2px" >
          <center><img alt="Logo png" src="images/ramen78.png" width=300px height=300px></center>
        </div>

        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

          <form style="width: 23rem;" action="http://localhost:8080/JAVAWebApplication/ComplaintsCreate" method="post">
			<br>
            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Report A Complaint</h3>
							<input type="hidden" class="form-control" name="userId" value="<%=UserID%>" required>	
			<div class="form-group">			
							<label>Order ID</label>
							<input type="text" class="form-control" name="orderId" value="<%=OrderID%>" required>
			  </div>
			    <br>
	        <div class="form-group">
	            <label for="reason">Reason</label>
	            <select name="reason" class="form-control" id="reason" onchange="showReasonInput()">
	                <option value="Food Quality">Food Quality</option>
	                <option value="Portion Size">Portion Size</option>
	                <option value="Delivery and Packaging">Delivery and Packaging</option>
	                <option value="Pricing">Pricing</option>
	                <option value="Other">Other</option>
	            </select>
	        </div>
	          <br>
	        <div id="otherInput" style="display: none;">
            <div class="form-group">
                <label for="otherReason">Other Reason : </label>
                <input type="text" class="form-control" name="otherReason" id="otherReason">
            </div>
        </div>
         
            <div class="pt-1 mb-4" style="margin-top:5px">
            <input type="submit" value="Submit" type="button" class="btn btn-info btn-lg btn-block" />
            <p><a href="http://localhost:8080/JAVAWebApplication/userProfilePage.jsp" class="link-info">Go back</a> to User Profile</p>
            </div>

          </form>

        </div>

      </div>
      
      <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src="images/p8.jpg"
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
      </div>
    </div>
  </div>
</section>
</div>			
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
let insert=document.getElementById("insertStatus").value;
if(insert=="success"){
	swal("Complaint Was Successfully Created","Wait Till Customer Services Reply","success");
}

</script>

<script type="text/javascript">
let present=document.getElementById("complaintPresent").value;
if(present=="error"){
	swal("There Is A Complaint Already For That Order","Please Contact Customer Services","error");
}

</script>

<script>
        function showReasonInput() {
            var category = document.getElementById("reason").value;
            var reasonInput = document.getElementById("otherInput");
            
            if (category === "Other") {
                reasonInput.style.display = "block";
            } else {
                reasonInput.style.display = "none";
            }
        }
    </script>

				


</body>
</html>