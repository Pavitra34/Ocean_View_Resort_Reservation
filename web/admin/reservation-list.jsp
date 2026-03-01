<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    String keyword = request.getParameter("search");

    ReservationDAO dao = new ReservationDAO();
    List<Reservation> reservations;

    if(keyword != null && !keyword.trim().isEmpty()){
        reservations = dao.searchReservations(keyword);
    } else {
        reservations = dao.getAllReservations();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Reservation List</title>

<style>
body{
    font-family:'Segoe UI', sans-serif;
    background:#f4f6f9;
    margin:0;
    padding:40px;
}

.page-card{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 25px rgba(0,0,0,0.08);
}

.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.search-box input{
    padding:10px;
    border-radius:8px;
    border:1px solid #ccc;
    width:250px;
}

.search-box button{
    padding:10px 15px;
    border:none;
    background:#3498db;
    color:white;
    border-radius:8px;
    cursor:pointer;
}

.search-box button:hover{
    background:#2980b9;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#1e2a38;
    color:white;
    padding:15px;
    text-align:left;
}

td{
    padding:15px;
    border-bottom:1px solid #eee;
}

tr:hover{
    background:#f9fbfd;
}

.total{
    margin-bottom:15px;
    font-weight:bold;
}

.invoice-btn{
    padding:6px 12px;
    background:#2ecc71;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-size:13px;
}

.invoice-btn:hover{
    background:#27ae60;
}

.back-btn{
    margin-top:30px;
    display:inline-block;
    padding:10px 18px;
    background:#34495e;
    color:white;
    text-decoration:none;
    border-radius:8px;
}

.back-btn:hover{
    background:#2c3e50;
}
</style>

</head>
<body>

<div class="page-card">

    <div class="top-bar">
        <h2>Reservation List</h2>

        <form class="search-box" method="get">
            <input type="text" name="search" 
                   placeholder="Search by Reservation No / Guest"
                   value="<%= keyword != null ? keyword : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="total">
        Total Reservations: <%= reservations.size() %>
    </div>

    <table>
        <tr>
            <th>Reservation No</th>
            <th>Guest Name</th>
            <th>Room</th>
            <th>Check-In</th>
            <th>Check-Out</th>
            <th>Total (LKR)</th>
            <th>Invoice</th>
        </tr>

<%
if(reservations.isEmpty()){
%>
<tr>
    <td colspan="7" style="text-align:center;">
        No Reservations Found
    </td>
</tr>
<%
} else {
    for(Reservation r : reservations){
%>

<tr>
    <td><%= r.getReservationNumber() %></td>
    <td><%= r.getGuestName() %></td>
    <td><%= r.getRoomType() %></td>
    <td><%= r.getCheckIn() %></td>
    <td><%= r.getCheckOut() %></td>
    <td><%= r.getTotalAmount() %></td>
    <td>
        <a class="invoice-btn"
           href="invoice.jsp?id=<%= r.getId() %>"
           target="_blank">
           View Invoice
        </a>
    </td>
</tr>

<%
    }
}
%>

    </table>

    <a class="back-btn" href="dashboard.jsp">
        Back to Dashboard
    </a>

</div>

</body>
</html>