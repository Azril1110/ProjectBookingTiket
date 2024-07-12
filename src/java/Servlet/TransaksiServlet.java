package Servlet;

import java.io.IOException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TransaksiServlet", urlPatterns = {"/TransaksiServlet"})
public class TransaksiServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form
        String idTiket = request.getParameter("id_tiket");
        String day = request.getParameter("day");
        String ticketType = request.getParameter("ticketType");
        String harga = request.getParameter("harga");
        String stok = request.getParameter("stok");
        String idEvent = request.getParameter("id_event");
        String idType = request.getParameter("id_type");
        String idUser = request.getParameter("id_user");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // Generate unique payment code combining userId, eventId, and random number
        String paymentCode = generatePaymentCode(idUser, idEvent, idType);

        // Set attributes for pembelian.jsp
        request.setAttribute("id_tiket", idTiket);
        request.setAttribute("day", day);
        request.setAttribute("ticketType", ticketType);
        request.setAttribute("harga", harga);
        request.setAttribute("stok", stok);
        request.setAttribute("id_event", idEvent);
        request.setAttribute("id_type", idType);
        request.setAttribute("id_user", idUser);
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("paymentCode", paymentCode);

        // Forward to pembelian.jsp
        RequestDispatcher rd = request.getRequestDispatcher("pembelian.jsp");
        rd.forward(request, response);
    }

    private String generatePaymentCode(String userId, String eventId, String idType) {
        // Generate random number
        Random random = new Random();
        int randomNumber = random.nextInt(10000); // Example: random number between 0 and 9999

        // Combine userId, eventId, timestamp, and randomNumber to form payment code
        String paymentCode = userId + eventId + idType + System.currentTimeMillis() + randomNumber;

        return paymentCode;
    }
}
