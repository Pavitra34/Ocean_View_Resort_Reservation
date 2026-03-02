<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("GUEST")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Reserve Room</title>

<style>
body{
    font-family:'Segoe UI';
    background:#f4f6f9;
    padding:40px;
}

.form-card{
    background:white;
    padding:30px;
    border-radius:15px;
    max-width:500px;
    margin:auto;
    box-shadow:0 5px 25px rgba(0,0,0,0.08);
}

input, select, textarea{
    width:100%;
    padding:10px;
    margin:10px 0;
}

button{
    padding:10px 20px;
    background:#2ecc71;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
}
</style>
</head>
<body>

<div class="form-card">

<h2>Reserve Room</h2>

<form action="<%= request.getContextPath() %>/GuestReservationServlet" method="post">

    <input type="hidden" name="guestName" 
           value="<%= session.getAttribute("username") %>">

    <textarea name="address" 
              placeholder="Enter Your Address" required></textarea>

    <input type="text" name="contactNumber" 
           placeholder="Contact Number" required>

    <select name="roomType">
        <option>Single</option>
        <option>Double</option>
        <option>Suite</option>
    </select>

    <input type="date" name="checkIn" required>
    <input type="date" name="checkOut" required>

    <button type="submit">Book Now</button>

</form>

</div>
<a href="<%= request.getContextPath() %>/guest/dashboard.jsp" class="back-link">
   Back to Dashboard
</a>
</body>
</html>