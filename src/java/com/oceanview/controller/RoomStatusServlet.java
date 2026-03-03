package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.RoomDAO;

@WebServlet("/RoomStatusServlet")
public class RoomStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("role") == null){
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        if(!role.equals("RECEPTIONIST") && !role.equals("ADMIN")){
            response.sendRedirect("auth/login.jsp");
            return;
        }

        try{

            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");

            RoomDAO dao = new RoomDAO();
            dao.updateRoomStatus(id, status);

            if(role.equals("ADMIN")){
                response.sendRedirect("admin/rooms.jsp");
            } else {
                response.sendRedirect("receptionist/rooms.jsp");
            }

        }catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}