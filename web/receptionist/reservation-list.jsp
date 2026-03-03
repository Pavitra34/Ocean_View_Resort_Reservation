<%@ page import="java.util.*" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%
ReservationDAO dao = new ReservationDAO();
List<Reservation> list = dao.getAllReservations();

String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Reservations</title>

<link rel="stylesheet" 
href="<%= request.getContextPath() %>/css/table.css">

</head>
<body>

<h2>Manage Reservations</h2>

<table>
<tr>
    <th>No</th>
    <th>Guest</th>
    <th>Room</th>
    <th>Check-In</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
for(Reservation r : list){
%>

<tr>
<td><%= r.getReservationNumber() %></td>
<td><%= r.getGuestName() %></td>
<td><%= r.getRoomType() %></td>
<td><%= r.getCheckIn() %></td>
<td><%= r.getStatus() %></td>

<td>

<% if("PENDING".equalsIgnoreCase(r.getStatus())) { %>

    <a class="btn-confirm"
       href="<%=request.getContextPath()%>/StatusUpdateServlet?id=<%=r.getId()%>&status=CONFIRMED">
        Confirm
    </a>

    <a class="btn-cancel"
       href="<%=request.getContextPath()%>/StatusUpdateServlet?id=<%=r.getId()%>&status=CANCELLED">
        Cancel
    </a>

<% } else if("CONFIRMED".equalsIgnoreCase(r.getStatus())) { %>

    <a class="btn-checkin"
       href="<%=request.getContextPath()%>/StatusUpdateServlet?id=<%=r.getId()%>&status=CHECKED_IN">
        Check-In
    </a>

<% } else if("CHECKED_IN".equalsIgnoreCase(r.getStatus())) { %>

    <a class="btn-checkout"
       href="<%=request.getContextPath()%>/StatusUpdateServlet?id=<%=r.getId()%>&status=CHECKED_OUT">
        Check-Out
    </a>

<% } %>

</td>

</tr>

<%
}
%>

</table>
<div style="margin-top:30px; text-align:right;">
    <a class="add-btn" href="dashboard.jsp">
        Back to Dashboard
    </a>
</div>
</body>
</html>