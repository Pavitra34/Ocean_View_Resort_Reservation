<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oceanview.dao.UserDAO" %>
<%@ page import="com.oceanview.model.User" %>

<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();
    List<User> receptionists = dao.getUsersByRole("RECEPTIONIST");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Receptionists</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">

    <style>
        .page-card{
            background:white;
            padding:30px;
            border-radius:15px;
            box-shadow:0 5px 20px rgba(0,0,0,0.1);
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

        .action-btn{
            padding:6px 12px;
            border-radius:6px;
            text-decoration:none;
            color:white;
            font-size:13px;
        }

        .edit-btn{
            background:#3498db;
        }

        .delete-btn{
            background:#e74c3c;
        }

    </style>
</head>

<body>

<div class="container">

    <div class="main">

        <div class="topbar">
            <h3>Manage Receptionists</h3>
            <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="back-link">
       Back to Dashboard
    </a>
        </div>

        <div class="page-card">

            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Actions</th>
                </tr>

                <%
                    if(receptionists.isEmpty()){
                %>
                <tr>
                    <td colspan="5" style="text-align:center;">
                        No Receptionists Found
                    </td>
                </tr>
                <%
                    } else {
                        for(User u : receptionists){
                %>

                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getFirstname() %> <%= u.getLastname() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getContactNumber() %></td>
                    <td>

<a class="action-btn edit-btn"
   href="<%= request.getContextPath() %>/admin/edit-staff.jsp?id=<%= u.getId() %>">
   Edit
</a>

                        <a class="action-btn delete-btn"
                           href="<%= request.getContextPath() %>/DeleteStaffServlet?id=<%= u.getId() %>"
                           onclick="return confirm('Are you sure you want to delete?');">
                           Delete
                        </a>

                    </td>
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