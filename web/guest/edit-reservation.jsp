<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
ReservationDAO dao = new ReservationDAO();
Reservation r = dao.getReservationById(id);
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Reservation</title>

<style>
body{
    font-family:'Segoe UI';
    background:linear-gradient(135deg,#667eea,#764ba2);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.card{
    background:white;
    padding:40px;
    width:400px;
    border-radius:20px;
    box-shadow:0 20px 40px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:25px;
}

input, select{
    width:100%;
    padding:12px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid #ddd;
    font-size:14px;
}

button{
    width:100%;
    padding:12px;
    background:#667eea;
    color:white;
    border:none;
    border-radius:8px;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#5a67d8;
}

.back-link{
    display:block;
    text-align:center;
    margin-top:15px;
    text-decoration:none;
    color:#555;
}
</style>

</head>
<body>

<div class="card">

<h2>Edit Reservation</h2>

<form action="<%= request.getContextPath() %>/UpdateReservationServlet" method="post">

    <input type="hidden" name="id" value="<%= r.getId() %>">

    <label>Room Type</label>
    <select name="roomType">
        <option <%= r.getRoomType().equals("Single") ? "selected" : "" %>>Single</option>
        <option <%= r.getRoomType().equals("Double") ? "selected" : "" %>>Double</option>
        <option <%= r.getRoomType().equals("Suite") ? "selected" : "" %>>Suite</option>
    </select>

    <label>Check In</label>
    <input type="date" name="checkIn" value="<%= r.getCheckIn() %>" required>

    <label>Check Out</label>
    <input type="date" name="checkOut" value="<%= r.getCheckOut() %>" required>

    <button type="submit">Update Reservation</button>

</form>

<a href="<%= request.getContextPath() %>/guest/dashboard.jsp" class="back-link">
   Back to Dashboard
</a>

</div>

</body>
</html>