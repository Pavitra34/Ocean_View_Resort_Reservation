<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ page import="java.util.*" %>

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
List<Reservation> list = dao.getConfirmedReservationsByUser(userId);
%>

<h2>My Invoices</h2>

<table border="1" cellpadding="10">
<tr>
    <th>Reservation No</th>
    <th>Room</th>
    <th>Total</th>
    <th>Invoice</th>
</tr>

<%
for(Reservation r : list){
%>

<tr>
    <td><%= r.getReservationNumber() %></td>
    <td><%= r.getRoomType() %></td>
    <td>LKR <%= r.getTotalAmount() %></td>
    <td>
        <a href="../admin/invoice.jsp?id=<%= r.getId() %>" target="_blank">
            View Invoice
        </a>
    </td>
</tr>

<%
}
%>
</table>