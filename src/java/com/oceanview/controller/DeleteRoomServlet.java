package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.RoomDAO;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            RoomDAO dao = new RoomDAO();
            dao.deleteRoom(id);

            response.sendRedirect(
                request.getContextPath() + "/admin/manage-rooms.jsp"
            );

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting room");
        }
    }
}