<%@ page import="java.util.*" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<%
RoomDAO dao = new RoomDAO();
List<Room> rooms = dao.getAllRooms();
%>

<!DOCTYPE html>
<html>
<head>
<title>Room Status</title>

<link rel="stylesheet" 
href="<%= request.getContextPath() %>/css/table.css">

</head>
<body>

<h2>Room Status Management</h2>

<table>
<tr>
    <th>Room No</th>
    <th>Type</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
for(Room r : rooms){
%>

<tr>

<td><%= r.getRoomNumber() %></td>

<td><%= r.getRoomType() %></td>

<td>
    <% if("AVAILABLE".equalsIgnoreCase(r.getStatus())){ %>
        <span class="status-badge available">AVAILABLE</span>

    <% } else if("BOOKED".equalsIgnoreCase(r.getStatus())){ %>
        <span class="status-badge booked">BOOKED</span>

    <% } else if("OCCUPIED".equalsIgnoreCase(r.getStatus())){ %>
        <span class="status-badge occupied">OCCUPIED</span>

    <% } else if("MAINTENANCE".equalsIgnoreCase(r.getStatus())){ %>
        <span class="status-badge maintenance">MAINTENANCE</span>
    <% } %>
</td>

<td>

    <% if("AVAILABLE".equalsIgnoreCase(r.getStatus())){ %>

        <a class="btn-red"
           href="<%=request.getContextPath()%>/RoomStatusServlet?id=<%=r.getId()%>&status=OCCUPIED">
            Mark Occupied
        </a>

        <a class="btn-orange"
           href="<%=request.getContextPath()%>/RoomStatusServlet?id=<%=r.getId()%>&status=MAINTENANCE">
            Maintenance
        </a>

    <% } else if("OCCUPIED".equalsIgnoreCase(r.getStatus())){ %>

        <a class="btn-green"
           href="<%=request.getContextPath()%>/RoomStatusServlet?id=<%=r.getId()%>&status=AVAILABLE">
            Mark Available
        </a>

    <% } else if("MAINTENANCE".equalsIgnoreCase(r.getStatus())){ %>

        <a class="btn-green"
           href="<%=request.getContextPath()%>/RoomStatusServlet?id=<%=r.getId()%>&status=AVAILABLE">
            Mark Available
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