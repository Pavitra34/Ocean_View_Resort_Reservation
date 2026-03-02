<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<% if(request.getParameter("error") != null){ %>
<div style="color:red;margin-top:10px;">
Error adding room. Check console for details.
</div>
<% } %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">

    <style>
        body{
            margin:0;
            font-family:'Segoe UI', sans-serif;
            background:#f4f6f9;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .form-card{
            background:white;
            padding:35px;
            border-radius:18px;
            box-shadow:0 10px 30px rgba(0,0,0,0.1);
            width:420px;
            animation:fadeIn 0.4s ease-in-out;
        }

        .form-card h2{
            text-align:center;
            margin-bottom:20px;
        }

        .form-card label{
            font-weight:500;
        }

        .form-card input,
        .form-card select{
            width:100%;
            padding:12px;
            margin:10px 0 15px 0;
            border-radius:10px;
            border:1px solid #ddd;
            font-size:14px;
        }

        .form-card button{
            width:100%;
            padding:12px;
            border:none;
            border-radius:10px;
            background:#2ecc71;
            color:white;
            font-size:15px;
            cursor:pointer;
            transition:0.3s;
        }

        .form-card button:hover{
            background:#27ae60;
        }

        .back-link{
            display:block;
            text-align:center;
            margin-top:15px;
            text-decoration:none;
            color:#3498db;
        }

        .back-link:hover{
            text-decoration:underline;
        }

        /* Toast */
        .toast{
            position:fixed;
            top:30px;
            right:30px;
            background:#2ecc71;
            color:white;
            padding:15px 25px;
            border-radius:10px;
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
            display:none;
            
        }

        @keyframes slideIn{
            from{ transform:translateX(100%); opacity:0; }
            to{ transform:translateX(0); opacity:1; }
        }

        @keyframes fadeIn{
            from{ opacity:0; transform:translateY(10px); }
            to{ opacity:1; transform:translateY(0); }
        }
    </style>
</head>

<body>

<div class="form-card">

    <h2>Add Room</h2>

    <form action="<%= request.getContextPath() %>/AddRoomServlet" method="post">

        <label>Room Number</label>
        <input type="text" name="roomNumber" required>

        <label>Room Type</label>
        <select name="roomType">
            <option>Single</option>
            <option>Double</option>
            <option>Suite</option>
        </select>

        <label>Price per Night (LKR)</label>
        <input type="number" name="price" required>

        <button type="submit">Add Room</button>

    </form>

    <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="back-link">
       Back to Dashboard
    </a>

</div>

<% if(request.getParameter("success") != null){ %>
<div class="toast" id="toast">Room Added Successfully!</div>

<script>
    const toast = document.getElementById("toast");
    toast.style.display = "block";
    setTimeout(() => toast.style.display = "none", 3000);
</script>
<% } %>

</body>
</html>