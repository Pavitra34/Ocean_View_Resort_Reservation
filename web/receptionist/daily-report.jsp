<%@ page import="com.oceanview.dao.ReservationDAO" %>

<%
ReservationDAO dao = new ReservationDAO();

int checkIns = dao.getTodayCheckIns();
int checkOuts = dao.getTodayCheckOuts();
int confirmed = dao.getTodayConfirmed();
double revenue = dao.getTodayRevenue();
%>

<!DOCTYPE html>
<html>
<head>
<title>Daily Report</title>

<style>
body{
    font-family:'Segoe UI';
    background:#f4f6f9;
    padding:40px;
}

h2{
    margin-bottom:30px;
}

.dashboard{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.card{
    flex:1;
    min-width:220px;
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
    text-align:center;
}

.card h3{
    margin:0;
    font-size:28px;
}

.card p{
    margin:8px 0 0;
    color:gray;
}

.green{border-left:5px solid #2ecc71;}
.blue{border-left:5px solid #3498db;}
.orange{border-left:5px solid #f39c12;}
.purple{border-left:5px solid #8e44ad;}

a{
    display:inline-block;
    margin-top:30px;
    text-decoration:none;
    background:#2c3e50;
    color:white;
    padding:10px 18px;
    border-radius:8px;
}
</style>

</head>
<body>

<h2>Daily Report - Receptionist</h2>

<div class="dashboard">

    <div class="card green">
        <h3><%= checkIns %></h3>
        <p>Check-Ins Today</p>
    </div>

    <div class="card blue">
        <h3><%= checkOuts %></h3>
        <p>Check-Outs Today</p>
    </div>

    <div class="card orange">
        <h3><%= confirmed %></h3>
        <p>Confirmed Today</p>
    </div>

    <div class="card purple">
        <h3>LKR <%= revenue %></h3>
        <p>Revenue Today</p>
    </div>

</div>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>