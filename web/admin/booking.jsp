<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%
    String idParam = request.getParameter("id");

    if(idParam == null){
        response.sendRedirect("reservation-list.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);

    ReservationDAO dao = new ReservationDAO();
    Reservation r = dao.getReservationById(id);

    if(r == null){
        response.sendRedirect("reservation-list.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Booking Payment</title>

<style>
body{
    font-family:'Segoe UI';
    background:#f4f6f9;
    padding:40px;
}

.card{
    background:white;
    padding:30px;
    border-radius:15px;
    max-width:500px;
    margin:auto;
    box-shadow:0 5px 25px rgba(0,0,0,0.08);
}

h2{
    margin-bottom:20px;
}

.info{
    margin-bottom:15px;
}

input{
    width:100%;
    padding:10px;
    margin-top:8px;
    margin-bottom:15px;
}

button{
    padding:10px 20px;
    background:#2ecc71;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

button:hover{
    background:#27ae60;
}

.back-link{
    display:block;
    margin-top:25px;
    text-align:center;
    text-decoration:none;
    color:#34495e;
}
</style>
</head>

<body>

<div class="card">

    <h2>Confirm Booking Payment</h2>

    <div class="info">
        <strong>Guest:</strong> <%= r.getGuestName() %>
    </div>

    <div class="info">
        <strong>Room:</strong> <%= r.getRoomType() %>
    </div>

    <div class="info">
        <strong>Total Amount:</strong> LKR <%= r.getTotalAmount() %>
    </div>

    <form action="<%= request.getContextPath() %>/CompleteBookingServlet" method="post">
        
        <input type="hidden" name="id" value="<%= r.getId() %>">

        <label>Payment Amount</label>
        <input type="number" 
               name="amount" 
               value="<%= r.getTotalAmount() %>" 
               required>

        <button type="submit">Confirm Payment</button>

    </form>

</div>

<a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="back-link">
   Back to Dashboard
</a>

</body>
</html>