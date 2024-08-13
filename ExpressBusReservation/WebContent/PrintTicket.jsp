<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Express Bus Reservation System</title>
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <!--  css links -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="assets/css/mainStyle.css" type="text/css"/>
        <link rel="stylesheet" href="assets/css/dashboardStyle.css" type="text/css"/>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-theme.css" />
        <link rel="stylesheet" type="text/css" href="assets/calendar/tcal.css" />
        <link rel="stylesheet" href="assets/css/flexselect.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="assets/css/jqueryCalendar.css">
        <link rel="stylesheet" type="text/css" href="assets/calendar/tcal.css" />

        <!-- javascript links -->
        <script type="text/javascript" src="assets/calendar/tcal.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/liquidmetal.js" type="text/javascript"></script>
        <script src="assets/js/query.flexselect.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/calendar/tcal.js"></script>
        <script type="text/javascript" src="assets/js/blank.js"></script>
        <script type="text/javascript">
            function openPage(pageURL)
            {
                window.location.href = pageURL;
            }
        </script>
    </head>
    <%
        System.out.println("comming PrintTicket.jsp file");

        String ticketNO = request.getAttribute("ticketNO").toString();
        String bookingId = "";
        String busId = "";
        String travelDate = "";
        String travelTime = "";

        ResultSet rs = (ResultSet) request.getAttribute("ticket");
        if (rs != null) {
            while (rs.next()) {
                bookingId = rs.getString(1);
                System.out.println(bookingId);
                busId = rs.getString(2);
                System.out.println(busId);
                travelDate = rs.getString(4);
                System.out.println(travelDate);
                travelTime = rs.getString(5);
                System.out.println(travelTime);
            }
        }
        double numberOfset;
        double ticketPrice;
        double totalAmount;
        numberOfset = Double.parseDouble(request.getAttribute("noOfseats").toString());
        System.out.println(numberOfset);
        ticketPrice = Double.parseDouble(request.getAttribute("ticketPrice").toString());
        System.out.println(ticketPrice);

        totalAmount = ticketPrice * numberOfset;
        System.out.println(totalAmount);

    %>

    <body background="assets/img/bg.png">
        <div class="row">
            <div class="col-md-3 col-md-offset-9">

            </div>
            <div class="col-md-3 col-md-offset-9" style="padding-top: 20px;padding-bottom: 20px">
                <div class="form-inline">
                    <button class="btn btn-success" onclick="javascript:window.print()"><span class="glyphicon glyphicon-print">&nbsp;&nbsp;</span>Print</button>
                    <button class="btn btn-success" onclick="openPage('indexUser.jsp')"><span class="glyphicon glyphicon-home">&nbsp;&nbsp;</span>Home</button>
                </div>
            </div>
            <div class="col-md-3 col-md-offset-9">

            </div>
        </div>
        <div class="container-fluid">



            <div class="row">
                <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12  col-lg-offset-2">


                    <!--start tacket panal-->
                    <div class="panel panel-info">
                        <!-- Default panel contents -->
                        <div class="panel-heading"><label style="color: #aa9911; font-size: 35;">Online Reservation</label></div>
                        <div class="panel-body">
                            <center>
                                <label style="color: #2b542c; font-size: 15;">Ticket No &emsp;:</label>&emsp;
                                <label style="color: #2b542c; font-size: 15;"><%=ticketNO%></label><br/>
                                <label style="color: #2b542c; font-size: 15;">Booking Id &emsp;:</label>&emsp;
                                <label style="color: #2b542c; font-size: 15;"><%=bookingId%></label><br/>
                                <label style="color: #2b542c; font-size: 15;">Bus Id &emsp;:</label>&emsp;
                                <label style="color: #2b542c; font-size: 15;"><%=busId%></label><br/>
                            </center>
                            <label style="color: #2b542c; font-size: 18;">Travel Date &emsp;: &emsp; <%=travelDate%> </label>
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            <label style="color: #2b542c; font-size: 18;">Time &emsp;: &emsp; <%=travelTime%></label>
                        </div>

                        <!-- Table -->
                        <div class="table-responsive">
                            <table class="table">
                                <tr class="warning">
                                    <td><label style="color: black; font-size: 18;">Ticket Price </label></td>
                                    <td><label style="color: black; font-size: 18;">:</label>&emsp;</td>
                                    <td><label style="color: black; font-size: 18;"><%=ticketPrice%></label></td>
                                </tr>
                                <tr class="danger">
                                    <td><label style="color: black; font-size: 18;">Number Of Seat</label></td>
                                    <td><label style="color: black; font-size: 18;">:</label></td>
                                    <td><label style="color: black; font-size: 18;"><%=numberOfset%></label></td>
                                </tr>
                                <tr class="success">
                                    <td><label style="color: black; font-size: 18;">Total Amount</label></td>
                                    <td><label style="color: black; font-size: 18;">:</label></td>
                                    <td><label style="color: black; font-size: 18;"><%=totalAmount%></label></td>
                                </tr>
                            </table>
                        </div>
                        <div class="panel-body">
                            <center>
                                <p class="well">
                                <label style="color: green; font-size: 22;font-style: italic">Have a nice journey</label> 
                                </p>
                            </center>
                        </div>


                    </div>

                    <!--stop ticket-->




                </div>
            </div>


        </div>
    </body>
</html>







