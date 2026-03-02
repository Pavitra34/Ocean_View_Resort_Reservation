<%@ page session="true" %>
<%@ page import="com.oceanview.dao.UserDAO" %>
<%@ page import="com.oceanview.model.User" %>

<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));

    UserDAO dao = new UserDAO();
    User user = dao.getUserById(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Receptionist</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">
</head>
<body>

<div style="display:flex;justify-content:center;align-items:center;height:100vh;background:#f4f6f9;">

    <div style="background:white;padding:40px;border-radius:15px;width:500px;box-shadow:0 5px 20px rgba(0,0,0,0.1);">

        <h2>Edit Receptionist</h2>

        <form action="<%= request.getContextPath() %>/UpdateStaffServlet" method="post">

            <input type="hidden" name="id" value="<%= user.getId() %>">

            <input type="text" name="firstname"
                   value="<%= user.getFirstname() %>"
                   required style="width:100%;padding:10px;margin:10px 0;">

            <input type="text" name="lastname"
                   value="<%= user.getLastname() %>"
                   required style="width:100%;padding:10px;margin:10px 0;">

            <input type="email" name="email"
                   value="<%= user.getEmail() %>"
                   required style="width:100%;padding:10px;margin:10px 0;">

            <input type="text" name="contact"
                   value="<%= user.getContactNumber() %>"
                   style="width:100%;padding:10px;margin:10px 0;">

            <textarea name="address"
                      style="width:100%;padding:10px;margin:10px 0;"><%= user.getAddress() %></textarea>

            <button type="submit"
                    style="background:#3498db;color:white;padding:12px;border:none;border-radius:8px;width:100%;">
                Update
            </button>

        </form>

        <br>
       

    </div>

</div>

</body>
</html>