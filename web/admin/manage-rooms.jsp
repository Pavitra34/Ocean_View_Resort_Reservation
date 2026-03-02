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
<title>Room Management</title>

<style>

body{
    font-family: 'Segoe UI', sans-serif;
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

h2{
    margin-bottom:25px;
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

/* Status badge */
.status{
    padding:6px 12px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
    display:inline-block;
}

.available{
    background:#d4edda;
    color:#28a745;
}

.booked{
    background:#fff3cd;
    color:#856404;
}

.maintenance{
    background:#f8d7da;
    color:#dc3545;
}

/* Buttons */
.action-btn{
    padding:6px 12px;
    border-radius:6px;
    text-decoration:none;
    font-size:13px;
    color:white;
    margin-right:5px;
}

.edit{
    background:#3498db;
}

.edit:hover{
    background:#2980b9;
}

.delete{
    background:#e74c3c;
}

.delete:hover{
    background:#c0392b;
}

.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.add-btn{
    background:#2ecc71;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
}

.add-btn:hover{
    background:#27ae60;
}

</style>
</head>

<body>

<div class="page-card">

    <div class="top-bar">
        <h2>Room Management</h2>
        <a class="add-btn" href="add-room.jsp">+ Add Room</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Room No</th>
            <th>Type</th>
            <th>Price (LKR)</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

<%
for(Room r : rooms){

    String statusClass = "";

    if(r.getStatus().equalsIgnoreCase("AVAILABLE")){
        statusClass = "available";
    } else if(r.getStatus().equalsIgnoreCase("BOOKED")){
        statusClass = "booked";
    } else {
        statusClass = "maintenance";
    }
%>

<tr>
    <td><%= r.getId() %></td>
    <td><%= r.getRoomNumber() %></td>
    <td><%= r.getRoomType() %></td>
    <td><%= r.getPricePerNight() %></td>
    <td>
        <span class="status <%= statusClass %>">
            <%= r.getStatus() %>
        </span>
    </td>
    <td>
        <a class="action-btn edit"
           href="edit-room.jsp?id=<%= r.getId() %>">
           Edit
        </a>

        <a class="action-btn delete"
           href="<%= request.getContextPath() %>/DeleteRoomServlet?id=<%= r.getId() %>"
           onclick="return confirm('Delete this room?')">
           Delete
        </a>
    </td>
</tr>

<% } %>

    </table>

</div>

<div style="margin-top:30px; text-align:right;">
    <a class="add-btn" href="dashboard.jsp">
        Back to Dashboard
    </a>
</div>

</body>
</html>