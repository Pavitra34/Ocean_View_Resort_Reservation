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

    ReservationDAO dao = new ReservationDAO();
    List<Reservation> reservations = dao.getAllReservations();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation List</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">

    <style>
        .table-container{
            background:white;
            padding:25px;
            border-radius:12px;
        }

        table{
            width:100%;
            border-collapse:collapse;
        }

        th{
            background:#1e2a38;
            color:white;
            padding:12px;
            text-align:left;
        }

        td{
            padding:12px;
            border-bottom:1px solid #ddd;
        }

        tr:hover{
            background:#f5f5f5;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- Sidebar -->


    <!-- Main Content -->
    <div class="main">

        <div class="topbar">
            <h3>Reservation List</h3>
        </div>

        <div class="table-container">

            <table>
                <tr>
                    <th>Reservation No</th>
                    <th>Guest Name</th>
                    <th>Room</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Total</th>
                </tr>

                <%
                    if(reservations.isEmpty()){
                %>
                    <tr>
                        <td colspan="6" style="text-align:center;">
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
                    <td>LKR <%= r.getTotalAmount() %></td>
                </tr>

                <%
                        }
                    }
                %>

            </table>

        </div>

    </div>

</div>

</body>
</html>