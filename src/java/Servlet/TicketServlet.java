package Servlet;

import Model.Ticket;
import controller.TicketDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TicketServlet")
public class TicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private TicketDAO ticketDAO;

    @Override
    public void init() {
        try {
            ticketDAO = new TicketDAO(); // Initialize TicketDAO in servlet context
        } catch (SQLException ex) {
            Logger.getLogger(TicketServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all tickets from DAO
        List<Ticket> ticketList = ticketDAO.getAllTickets();
        // Set tickets list in request attribute
        request.setAttribute("ticketList", ticketList);
        // Get session and check user role
        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("AdminOn");
        // Redirect to appropriate JSP based on user role
        if (isAdmin != null && isAdmin) {
            request.getRequestDispatcher("tickets.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("pilihtiket.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("update".equals(action)) {
                // Retrieve parameters from request
                String id_tiket = request.getParameter("id_tiket");
                String day = request.getParameter("day");
                String ticketType = request.getParameter("ticketType");
                double harga = Double.parseDouble(request.getParameter("harga"));
                String stok = request.getParameter("stok");
                String id_event = request.getParameter("id_event");
                String id_type = request.getParameter("id_type");

                // Create a Ticket object and set values
                Ticket ticket = new Ticket();
                ticket.setId_tiket(id_tiket);
                ticket.setDay(day);
                ticket.setHarga(harga);
                ticket.setTicketType(ticketType);
                ticket.setStok(stok);
                ticket.setId_event(id_event);
                ticket.setId_type(id_type);

                // Update the ticket in the database
                boolean updateSuccess = ticketDAO.updateTicket(ticket);

                if (updateSuccess) {
                    // Store ticket details in session
                    HttpSession session = request.getSession();
                    session.setAttribute("id_tiket", id_tiket);
                    session.setAttribute("day", day);
                    session.setAttribute("ticketType", ticketType);
                    session.setAttribute("harga", harga);
                    session.setAttribute("stok", stok);
                    session.setAttribute("id_event", id_event);
                    session.setAttribute("id_type", id_type);

                    // Redirect to KonfirmasiPembayaranServlet after successful update
                    response.sendRedirect("KonfirmasiPembayaranServlet");
                } else if("delete".equals(action)) {
                    // Handle update failure
                    request.setAttribute("error", "Failed to update ticket.");
                    RequestDispatcher rd = request.getRequestDispatcher("errorll.jsp");
                    rd.forward(request, response);
                }else{
                        
                        }
            } else if ("delete".equals(action)) {
                // Delete ticket action
                int id_tiket = Integer.parseInt(request.getParameter("id_tiket"));
                boolean deleteSuccess = ticketDAO.deleteTicket(id_tiket);

                if (deleteSuccess) {
                    // Redirect to doGet after successful delete
                    response.sendRedirect("TicketServlet");
                } else {
                    // Handle delete failure
                    request.setAttribute("errorkk", "Failed to delete ticket.");
                    RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                    rd.forward(request, response);
                }
            }
        }catch (NumberFormatException e) {
            // Log the error
            Logger.getLogger(TicketServlet.class.getName()).log(Level.SEVERE, null, e);

            // Forward to error page with specific message
            request.setAttribute("error", "Invalid input: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
        // Log the SQL error
        // Forward to error page with specific message
        
    }

}
