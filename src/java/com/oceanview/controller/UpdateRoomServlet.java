package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.oceanview.dao.RoomDAO;
import com.oceanview.model.Room;

@WebServlet("/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String number = request.getParameter("roomNumber");
            String type = request.getParameter("roomType");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");

            Room room = new Room(number, type, price, status);
            room.setId(id);

            RoomDAO dao = new RoomDAO();
            dao.updateRoom(room);

            response.sendRedirect(
                request.getContextPath() + "/admin/manage-rooms.jsp"
            );

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating room");
        }
    }
}