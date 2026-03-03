<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>
<%@ page import="java.util.*" %>
<%@ page import="com.oceanview.dao.UserDAO" %>
<%@ page import="com.oceanview.model.User" %>

<%
UserDAO userDao = new UserDAO();
List<User> guests = userDao.getAllGuests();
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Reservation</title>

<style>
body{
    font-family:'Segoe UI';
    background:#f4f6f9;
    padding:40px;
}

/* Form Card */
.form-card{
    background:white;
    padding:30px;
    border-radius:12px;
    max-width:600px;
    margin:auto;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
}

input, select{
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:6px;
    border:1px solid #ccc;
}

button{
    padding:10px 20px;
    background:#2ecc71;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}

button:hover{
    background:#27ae60;
}

/* Toast */
.toast{
    position:fixed;
    top:20px;
    right:20px;
    background:#2ecc71;
    color:white;
    padding:15px 25px;
    border-radius:8px;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
    display:none;
    z-index:999;
    animation:slideIn 0.5s ease;
}

@keyframes slideIn{
    from{ transform:translateX(100px); opacity:0; }
    to{ transform:translateX(0); opacity:1; }
}
</style>

</head>
<body>

<% if(request.getParameter("success") != null){ %>
    <div id="toast" class="toast">
        Reservation Added Successfully!
    </div>

    <script>
        const toast = document.getElementById("toast");
        toast.style.display = "block";
        setTimeout(() => {
            toast.style.display = "none";
        }, 3000);
    </script>
<% } %>

<div class="form-card">

<h2>Add Reservation</h2>

<form action="<%= request.getContextPath() %>/AddReservationServlet" method="post">

    <label>Select Guest</label>
<select id="guestSelect" onchange="fillGuestDetails()" required>

<option value="">-- Select Guest --</option>

<%
for(User g : guests){
%>
<option value="<%= g.getId() %>"
        data-name="<%= g.getFirstname() + " " + g.getLastname() %>"
        data-address="<%= g.getAddress() %>"
        data-contact="<%= g.getContactNumber() %>">

    <%= g.getFirstname() + " " + g.getLastname() %>

</option>
<%
}
%>

</select>
    <label>Guest Name</label>
<input type="text" id="guestName" name="guestName" readonly>

<label>Address</label>
<input type="text" id="address" name="address" readonly>

<label>Contact Number</label>
<input type="text" id="contactNumber" name="contactNumber" readonly>

<input type="hidden" id="userId" name="userId">
    
    <select name="roomType">
        <option>Single</option>
        <option>Double</option>
        <option>Suite</option>
    </select>

    <input type="date" name="checkIn" required>
    <input type="date" name="checkOut" required>
    <input type="number" name="totalAmount" placeholder="Total Amount" required>

    <button type="submit">Add Reservation</button>

</form>

</div>

    <a class="back-btn" href="dashboard.jsp">
        Back to Dashboard
    </a>
<script>
function fillGuestDetails(){

    var select = document.getElementById("guestSelect");
    var option = select.options[select.selectedIndex];

    document.getElementById("guestName").value = option.getAttribute("data-name");
    document.getElementById("address").value = option.getAttribute("data-address");
    document.getElementById("contactNumber").value = option.getAttribute("data-contact");
    document.getElementById("userId").value = option.value;
}
</script>
</body>
</html>