package com.cognizant.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.cognizant.helper.Validate;
import com.cognizant.model.BookingModel;

/**
 * Servlet implementation class BookTicketController
 */
public class BookTicketFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookTicketFormController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookingModel model = new BookingModel();
		HttpSession session = request.getSession();
		if (!String.valueOf(session.getAttribute("type")).equals("user")) {
			model.setBusID(request.getParameter("busid"));
			model.setDepartureDate(request.getParameter("deptdate"));
			model.setDepartureTime(request.getParameter("depttime"));
			if (session.getAttribute("userid") == null) {
				model.setUserID(request.getParameter("email"));
			} else {
				model.setUserID(String.valueOf(session.getAttribute("email")));
			}

			String bookingID = "";
			try {
                                //insert in booking and seatallocation
				bookingID = model.insertNewGuestBooking(request
						.getParameter("noOfseats"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!bookingID.equals("")) {
				if (session.getAttribute("userid") == null) {
					ResultSet rs = null;
					BookingModel bm = new BookingModel();
					bm.setBookingID(bookingID);
					String email = request.getParameter("email");
                                        String ticketPrice =request.getParameter("ticketPrice");
                                        String noOfseats =request.getParameter("noOfseats"); 
                                        
					bm.setUserID(email);
                                        //get all bookin info by Id
					rs = bm.getBookingInfo("user", "na");

					RequestDispatcher rd = request
							.getRequestDispatcher("PaymentConfirm.jsp");
					request.setAttribute("ticket", rs);
                                        request.setAttribute("ticketPrice", ticketPrice);
                                        request.setAttribute("noOfseats", noOfseats);
                                        request.setAttribute("email", email);
                                        request.setAttribute("busid", request.getParameter("busid"));
					rd.forward(request, response);

				} else {
					response.sendRedirect("GetBookingInformation.jsp?msg=Success&booking="
							+ bookingID);
				}
			} else {
				PrintWriter out = response.getWriter();
				out.print("error");
			}
		} else {
			model.setBusID(request.getParameter("busid"));
			model.setDepartureDate(request.getParameter("deptdate"));
			model.setDepartureTime(request.getParameter("depttime"));
			String email = String.valueOf(session.getAttribute("userid"));
			model.setUserID(email);
			String bookingID = "";

			try {
				bookingID = model.insertNewGuestBooking(request
						.getParameter("noOfseats"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!bookingID.equals("")) {
				PrintWriter out = response.getWriter();
				response.sendRedirect("GetBookingInformation.jsp?msg=Success&booking="
						+ bookingID);
			} else {
				PrintWriter out = response.getWriter();
				out.print("error");
			}

		}
	}
}
