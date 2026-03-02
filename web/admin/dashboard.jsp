<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<%@ page import="com.oceanview.dao.ReservationDAO" %>

<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<%
ReservationDAO dao = new ReservationDAO();
double revenue = dao.getTotalRevenue();
%>


<%@ page session="true" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>

<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>
<%
ReservationDAO rdao = new ReservationDAO();
RoomDAO roomDao = new RoomDAO();

int totalReservations = rdao.getTotalReservations();
int availableRooms = roomDao.getAvailableRoomsCount();
%>

<%@ page import="com.oceanview.dao.UserDAO" %>

<%
UserDAO userDao = new UserDAO();
int totalGuests = userDao.getTotalGuests();
%>



<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">
</head>
<body>

<div class="dashboard-container">

    <div class="header-box">
        <h2>Ocean View Resort - Admin Dashboard</h2>
        <span>Welcome, <%= session.getAttribute("username") %></span>
    </div>

    <!-- Statistics Cards -->
    <div class="cards-grid">

        <div class="stat-card blue">
            <h4>Total Guests</h4>
            <p><%= totalGuests %></p>
        </div>

        <div class="stat-card green">
            <h4>Total Reservations</h4>
            <p><%= totalReservations %></p>
          
        </div>

        <div class="stat-card orange">
            <h4>Available Rooms</h4>
           <p><%= availableRooms %></p>
        </div>

        <div class="stat-card red">
            <h4>Revenue (This Month)</h4>
            <p> LKR <%= revenue %></p>
        </div>

    </div>

    <!-- Quick Actions -->
    <div class="actions-box">

        <h3>Quick Actions</h3>

        <div class="actions-grid">
            <a href="<%= request.getContextPath() %>/admin/add-receptionist.jsp" class="action-card">
                + Add Receptionist
            </a>

            <a href="<%= request.getContextPath() %>/admin/add-room.jsp" class="action-card">
                + Add Room
            </a>
                             <a href="<%= request.getContextPath() %>/admin/manage-rooms.jsp"
                class="action-card">
                Manage Rooms
                </a>

            <a href="<%= request.getContextPath() %>/admin/add-reservation.jsp" class="action-card">
                + Add Reservation
            </a>

            <a href="<%= request.getContextPath() %>/admin/reservation-list.jsp" class="action-card">
                View Reservations
            </a>
                
                <a href="<%= request.getContextPath() %>/ViewReceptionistsServlet" class="action-card">
                 Manage Receptionists
                </a>
                 
              <div class="stat-card blue">
     <a href="help.jsp" style="color:white;text-decoration:none;">
        Help Center
    </a>
    </div>

            <a href="<%= request.getContextPath() %>/LogoutServlet" class="action-card logout">
                Logout
            </a>

        </div>
                

    </div>

</div>
                

</body>
</html>