<%@ page session="true" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    RoomDAO dao = new RoomDAO();
    Room room = dao.getRoomById(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>

    <style>
        body{
            font-family:Arial;
            background:#f4f6f9;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .card{
            background:white;
            padding:40px;
            width:450px;
            border-radius:15px;
            box-shadow:0 5px 20px rgba(0,0,0,0.1);
        }

        input, select{
            width:100%;
            padding:12px;
            margin:10px 0;
            border-radius:8px;
            border:1px solid #ccc;
        }

        button{
            width:100%;
            padding:12px;
            border:none;
            border-radius:8px;
            background:#3498db;
            color:white;
            cursor:pointer;
        }

        .back{
            margin-top:15px;
            display:block;
            text-align:center;
        }
    </style>
</head>

<body>

<div class="card">

    <h2>Edit Room</h2>

    <form action="<%= request.getContextPath() %>/UpdateRoomServlet" method="post">

        <input type="hidden" name="id" value="<%= room.getId() %>">

        <label>Room Number</label>
        <input type="text" name="roomNumber"
               value="<%= room.getRoomNumber() %>" required>

        <label>Room Type</label>
        <select name="roomType">
            <option <%= room.getRoomType().equals("Single") ? "selected" : "" %>>Single</option>
            <option <%= room.getRoomType().equals("Double") ? "selected" : "" %>>Double</option>
            <option <%= room.getRoomType().equals("Suite") ? "selected" : "" %>>Suite</option>
        </select>

        <label>Price</label>
        <input type="number" name="price"
               value="<%= room.getPricePerNight() %>" required>

        <label>Status</label>
        <select name="status">
            <option <%= room.getStatus().equals("AVAILABLE") ? "selected" : "" %>>AVAILABLE</option>
            <option <%= room.getStatus().equals("BOOKED") ? "selected" : "" %>>BOOKED</option>
            <option <%= room.getStatus().equals("MAINTENANCE") ? "selected" : "" %>>MAINTENANCE</option>
        </select>

        <button type="submit">Update Room</button>

    </form>

    <a class="back" href="manage-rooms.jsp">Back</a>

</div>

</body>
</html>