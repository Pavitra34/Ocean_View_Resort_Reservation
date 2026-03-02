<%@ page import="com.oceanview.dao.ReservationDAO" %>

<%
ReservationDAO dao = new ReservationDAO();

double revenue = 0;

String monthParam = request.getParameter("month");
String yearParam = request.getParameter("year");

if(monthParam != null && yearParam != null){

    int month = Integer.parseInt(monthParam);
    int year = Integer.parseInt(yearParam);

    revenue = dao.getMonthlyRevenue(month, year);
}
%>

<% if(monthParam != null){ %>
    <h3>Monthly Revenue: LKR <%= revenue %></h3>
<% } %>

<form method="get">
    <label>Month:</label>
    <input type="number" name="month" min="1" max="12" required>

    <label>Year:</label>
    <input type="number" name="year" required>

    <button type="submit">Generate Report</button>
</form>
