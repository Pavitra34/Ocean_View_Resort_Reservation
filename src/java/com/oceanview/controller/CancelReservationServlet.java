package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

@WebServlet("/CancelReservationServlet")
public class CancelReservationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userIdObj = (Integer) session.getAttribute("userId");

            if(userIdObj == null){
                response.sendRedirect("auth/login.jsp");
                return;
            }

            int userId = userIdObj;
            int id = Integer.parseInt(request.getParameter("id"));

            ReservationDAO dao = new ReservationDAO();
            Reservation r = dao.getReservationById(id);

            // 🔐 Ensure reservation belongs to logged user
            if(r != null && r.getUserId() == userId){

                dao.updateStatus(id, "CANCELLED");

                response.sendRedirect(request.getContextPath()
                        + "/guest/my-reservations.jsp?cancelled=true");

            } else {

                response.sendRedirect(request.getContextPath()
                        + "/guest/my-reservations.jsp?error=unauthorized");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/guest/my-reservations.jsp?error=server");
        }
    }
}