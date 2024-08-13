package com.cognizant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.model.BookingModel;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class BookTicketController
 */
public class PrintTicketController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintTicketController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		BookingModel model = new BookingModel();
		HttpSession session = request.getSession();
			
			model.setUserID(request.getParameter("email"));
			

			String bookingID = "";
			try {
                                System.out.println("paran em2 .."+request.getParameter("email"));
				bookingID = model.getBookingIDByEmail();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!bookingID.equals("")) {
				
					ResultSet rs = null;
					BookingModel bm = new BookingModel();
					bm.setBookingID(bookingID);
					String email = request.getParameter("email");
					String ticketPrice = request.getParameter("ticketPrice");
                                        String noOfseats =request.getParameter("numberOfset"); 
                                        System.out.println("before set seat "+noOfseats+" bus id "+request.getParameter("busid"));
                                        bm.setNoOfSeats(noOfseats);
                                        bm.setBusID(request.getParameter("busid"));
					bm.setUserID(email);
                                        //create ticket no
                                        String busNoAndUser =request.getParameter("busid")+"-"+email;
                                        
                                        //save payment information
                                        String ticketNO = bm.savePayment(busNoAndUser);
                                        //get all bookin info by Id
					rs = bm.getBookingInfo("user", "na");
					RequestDispatcher rd = request
							.getRequestDispatcher("PrintTicket.jsp");
					request.setAttribute("ticket", rs);
                                        request.setAttribute("ticketPrice", ticketPrice);
                                        request.setAttribute("noOfseats", noOfseats);
                                        request.setAttribute("ticketNO", ticketNO);
					rd.forward(request, response);

				
			} else {
				PrintWriter out = response.getWriter();
				out.print("error");
			}
		
	}
}
