<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ page import="com.oceanview.invoice.Invoice" %>
<%@ page import="com.oceanview.decorator.BasicInvoice" %>
<%@ page import="com.oceanview.decorator.TaxDecorator" %>
<%@ page import="com.oceanview.decorator.ServiceChargeDecorator" %>
<%@ page import="com.oceanview.decorator.QRCodeDecorator" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    ReservationDAO dao = new ReservationDAO();
    Reservation r = dao.getReservationById(id);

    if(r == null){
        out.println("Reservation not found");
        return;
    }

    // Create decorated invoice
    Invoice invoice = new BasicInvoice();
    invoice = new TaxDecorator(invoice);
    invoice = new ServiceChargeDecorator(invoice);
    invoice = new QRCodeDecorator(invoice);

    String billContent = invoice.generate(r);
%>

<!DOCTYPE html>
<html>
<head>
<title>Invoice</title>

<style>
body{
    font-family:Arial;
    padding:40px;
    background:#f4f6f9;
}
.invoice-box{
    max-width:800px;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 25px rgba(0,0,0,0.08);
}
.header{
    text-align:center;
    margin-bottom:30px;
}
.footer{
    margin-top:40px;
    text-align:center;
    font-size:14px;
    color:#777;
}
</style>
</head>

<body onload="window.print()">

<div class="invoice-box">

    <div class="header">
        <h2>Ocean View Resort</h2>
        <p>Hotel Invoice</p>
    </div>

    <div>
        <%= billContent %>
    </div>

    <div class="footer">
        Thank you for staying with us!
    </div>

</div>

</body>
</html>