<%@ page import="java.util.*" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ page import="java.util.*" %>

<%
Integer userIdObj = (Integer) session.getAttribute("userId");

if(userIdObj == null){
    response.sendRedirect("../auth/login.jsp");
    return;
}

int userId = userIdObj;

ReservationDAO dao = new ReservationDAO();
List<Reservation> reservations = dao.getReservationsByUser(userId);
%>

<!DOCTYPE html>
<html>
<head>
<title>My Reservations</title>
<style>
body{font-family:Segoe UI;background:#f4f6f9;padding:40px;}
.card{background:white;padding:25px;border-radius:15px;
box-shadow:0 5px 20px rgba(0,0,0,0.08);}
table{width:100%;border-collapse:collapse;}
th,td{padding:12px;border-bottom:1px solid #eee;}
th{background:#1e2a38;color:white;}
.btn{padding:6px 10px;border-radius:6px;color:white;text-decoration:none;}
.edit{background:#3498db;}
.cancel{background:#e74c3c;}
</style>
</head>
<body>

<div class="card">
<h2>My Reservations</h2>

<table>
<tr>
<th>Reservation No</th>
<th>Room</th>
<th>Check-In</th>
<th>Check-Out</th>
<th>Total</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
for(Reservation r : reservations){
%>

<tr>
<td><%= r.getReservationNumber() %></td>
<td><%= r.getRoomType() %></td>
<td><%= r.getCheckIn() %></td>
<td><%= r.getCheckOut() %></td>
<td>LKR <%= r.getTotalAmount() %></td>
<td><%= r.getStatus() %></td>
<td>

<% if("PENDING".equalsIgnoreCase(r.getStatus())){ %>

<a class="btn edit"
href="edit-reservation.jsp?id=<%= r.getId() %>">
Edit
</a>

<a class="btn cancel"
href="<%= request.getContextPath() %>/CancelReservationServlet?id=<%= r.getId() %>"
onclick="return confirm('Cancel reservation?')">
Cancel
</a>

<% } else { %>
-
<% } %>

</td>
</tr>

<% } %>

</table>

</div>
<a href="<%= request.getContextPath() %>/guest/dashboard.jsp" class="back-link">
   Back to Dashboard
</a>
</body>
</html>