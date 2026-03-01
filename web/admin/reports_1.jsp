


<form method="get">
    <select name="month">
        <option value="1">January</option>
        ...
    </select>

    <input type="number" name="year" placeholder="Year">

    <button type="submit">Generate Report</button>
</form>

int month = Integer.parseInt(request.getParameter("month"));
int year = Integer.parseInt(request.getParameter("year"));

double revenue = dao.getMonthlyRevenue(month, year);