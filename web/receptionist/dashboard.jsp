<%@ page session="true" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>

<%
if(session.getAttribute("role") == null || 
   !session.getAttribute("role").equals("RECEPTIONIST")){
    response.sendRedirect("../auth/login.jsp");
    return;
}

ReservationDAO rdao = new ReservationDAO();
RoomDAO roomDao = new RoomDAO();

int totalReservations = rdao.getTotalReservations();
double revenue = rdao.getTotalRevenue();
int availableRooms = roomDao.getAvailableRoomsCount();
%>

<!DOCTYPE html>
<html>
<head>
<title>Receptionist Dashboard</title>

<link rel="stylesheet" 
      href="<%= request.getContextPath() %>/css/receptionist.css">

</head>
<body>

<div class="header">
    <h1>Welcome, <%= session.getAttribute("username") %></h1>
    <a class="logout" href="../LogoutServlet">Logout</a>
</div>

<div class="stats">

    <div class="stat-card">
        <h3>Total Reservations</h3>
        <p><%= totalReservations %></p>
    </div>

    <div class="stat-card">
        <h3>Total Revenue</h3>
        <p>LKR <%= revenue %></p>
    </div>

    <div class="stat-card">
        <h3>Available Rooms</h3>
        <p><%= availableRooms %></p>
    </div>

</div>

<div class="quick-actions">

    <h2>Quick Actions</h2>

    <div class="actions">

        <a class="action-btn" href="reservation-list.jsp">
            Manage Reservations
        </a>

        <a class="action-btn" href="rooms.jsp">
            Room Status
        </a>

        <a class="action-btn" href="daily-report.jsp">
            Daily Report
        </a>
<a class="action-btn"
   href="<%=request.getContextPath()%>/receptionist/help.jsp">
   Help Center
</a>
    </div>

</div>

</body>
</html>