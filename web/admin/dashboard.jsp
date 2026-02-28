<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
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
            <p>120</p>
        </div>

        <div class="stat-card green">
            <h4>Total Reservations</h4>
            <p>85</p>
        </div>

        <div class="stat-card orange">
            <h4>Available Rooms</h4>
            <p>25</p>
        </div>

        <div class="stat-card red">
            <h4>Revenue (This Month)</h4>
            <p>LKR 450,000</p>
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

            <a href="<%= request.getContextPath() %>/admin/add-reservation.jsp" class="action-card">
                + Add Reservation
            </a>

            <a href="<%= request.getContextPath() %>/admin/reservation-list.jsp" class="action-card">
                View Reservations
            </a>

            <a href="<%= request.getContextPath() %>/LogoutServlet" class="action-card logout">
                Logout
            </a>
        </div>

    </div>

</div>

</body>
</html>