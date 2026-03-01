package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.oceanview.model.Room;
import com.oceanview.dao.RoomDAO;

public class AddRoomServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {

        String roomNumber = request.getParameter("roomNumber");
        String roomType = request.getParameter("roomType");
        double price = Double.parseDouble(request.getParameter("price"));

        Room room = new Room(roomNumber, roomType, price, "AVAILABLE");

        RoomDAO dao = new RoomDAO();
        boolean success = dao.addRoom(room);

        if(success){
            response.sendRedirect("admin/add-room.jsp?success=true");
        } else {
            response.sendRedirect("admin/add-room.jsp?error=true");
        }

    } catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("admin/add-room.jsp?error=exception");
    }
}

}