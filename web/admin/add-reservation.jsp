<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<%
    java.time.LocalDate today = java.time.LocalDate.now();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">

    <style>
        .form-container{
            background:white;
            padding:35px;
            border-radius:15px;
            box-shadow:0 8px 25px rgba(0,0,0,0.1);
            max-width:800px;
        }

        .form-row{
            display:flex;
            gap:20px;
            margin-bottom:20px;
        }

        .form-group{
            flex:1;
            display:flex;
            flex-direction:column;
        }

        .form-group label{
            font-size:14px;
            margin-bottom:5px;
            font-weight:600;
        }

        .form-group input,
        .form-group select,
        .form-group textarea{
            padding:10px;
            border-radius:8px;
            border:1px solid #ccc;
            font-size:14px;
        }

        .form-group textarea{
            resize:none;
            height:80px;
        }

        .btn-submit{
            padding:12px 25px;
            background:#2ecc71;
            border:none;
            border-radius:8px;
            color:white;
            font-size:15px;
            cursor:pointer;
            transition:0.3s;
        }

        .btn-submit:hover{
            background:#27ae60;
        }

        .toast{
            position:fixed;
            top:20px;
            right:20px;
            background:#2ecc71;
            color:white;
            padding:15px 20px;
            border-radius:8px;
            display:none;
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

    <div class="container">

    <!-- Main Content -->
    <div class="main">

        <div class="topbar">
            <h3>Add New Reservation</h3>
        </div>

        <div class="form-container">

            <form action="<%= request.getContextPath() %>/AddReservationServlet" method="post">

                <div class="form-row">
                    <div class="form-group">
                        <label>Guest Name</label>
                        <input type="text" name="guestName" required>
                    </div>

                    <div class="form-group">
                        <label>Contact Number</label>
                        <input type="text" name="contact" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Room Type</label>
                        <select name="roomType">
                            <option>Single</option>
                            <option>Double</option>
                            <option>Suite</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Check-In Date</label>
                        <input type="date" name="checkIn" min="<%= today %>" required>
                    </div>

                    <div class="form-group">
                        <label>Check-Out Date</label>
                        <input type="date" name="checkOut" min="<%= today %>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address"></textarea>
                </div>

                <br>
                <button type="submit" class="btn-submit">Add Reservation</button>

            </form>

        </div>

    </div>

</div>

<% if(request.getParameter("success") != null){ %>
<div class="toast" id="toast">Reservation Added Successfully!</div>

<script>
    const toast = document.getElementById("toast");
    toast.style.display = "block";
    setTimeout(() => toast.style.display = "none", 3000);
</script>
<% } %>

<% if("pastdate".equals(request.getParameter("error"))){ %>
<div style="color:red;margin-top:15px;">
    Check-in date cannot be in the past.
</div>
<% } %>

<% if("invalidrange".equals(request.getParameter("error"))){ %>
<div style="color:red;margin-top:15px;">
    Check-out must be after Check-in date.
</div>
<% } %>

</body>
</html>