<%@page import="com.cognizant.model.BusModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>

<jsp:include page="layout/Header.jsp" />


<script type="text/javascript" src="assets/js/blank.js"></script>
<script src="assets/js/form.js" type="text/javaScript"></script>

<!-- ***********   START   *********** -->

<%
    
    System.out.println("comming PaymentConfirm.jsp file");
    
    String check=request.getParameter("a");
    
   
    
    String email;
    String busid;
    double numberOfset ;
    double ticketPrice;
    double totalAmount;
    email = request.getParameter("email");
    numberOfset = Double.parseDouble(request.getParameter("noOfseats"));
    ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));
    busid = request.getParameter("busid");
   // System.out.println(email+numberOfset+ticketPrice+busid);
    totalAmount = ticketPrice*numberOfset;
    
//    if(check.equalsIgnoreCase("attribute")){
//        System.out.println("inside if");
//        email = (String)request.getAttribute("email");
//        numberOfset = Integer.parseInt((String)request.getAttribute("noOfseats"));
//        ticketPrice = Integer.parseInt((String)request.getAttribute("ticketPrice"));
//        totalAmount = ticketPrice*numberOfset;
//    }else{
//        System.out.println("inside else");
//        email = request.getParameter("email");
//        numberOfset = Integer.parseInt(request.getParameter("noOfseats"));
//        ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));
//        System.out.println(email+numberOfset+ticketPrice);
//        totalAmount = ticketPrice*numberOfset;
//    }
%>

<div class="errordiv col-lg-9 col-md-9 col-sm-10 col-xs-10">
    <%
        if (request.getParameter("msg") != null) {
    %>
    <h4><%=request.getParameter("msg")%></h4>
    <%
        }
    %>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-success">
            <div class="panel-body">
                <form  action="PrintTicketController" onsubmit="return m1();" method="post"> 
                    <div class="row">
                    <div class="col-lg-2 col-lg-offset-10">
                        <img src="assets/img/mcard.png" class="img-responsive" alt="Responsive image">
                    </div>

                    <div class="col-lg-10 col-lg-offset-1" style="padding-top: 20px">
                        <div class="panel panel-default">
                            <div class="panel-heading">Transaction Details</div>
                            <div class="panel-body">
                                
                                <table style="width: 70%">
                                    <tr>
                                        <td><label for="paymentType" style="color: black">Payment Type</label></td>
                                        <td></td>
                                        <td><label for="paymentType" style="color: black">Credit Card</label></td>
                                    </tr>
                                    <tr>
                                        <td>:</td>
                                    </tr>
                                    <tr>
                                        <td><label for="tranAmoount" style="color: black">Total Transaction Amount</label></td>
                                        <td></td>
                                        <td><input type="text" name="tranAmoount" value="<%=totalAmount%>" class="form-control" disabled="disabled"/></td>
                                    </tr>
                                    <tr>
                                        <td>:</td>
                                    </tr>
                                    <tr>
                                        <td><label for="cardNumber" style="color: black">Card Number</label></td>
                                        <td></td>
                                        <td><input type="text" name="cardNumber"  class="form-control" size="50" id="cardNumber"/></td>
                                        <td><span id="sp1" style="color: red; font-size: 7"></span></td>
                                    </tr>
                                    <tr>
                                        <td>:</td>
                                    </tr>
                                    <tr>
                                        <td><label for="expiryDate" style="color: black">Expiry Date</label></td>
                                        <td></td>
                                        <td><input type="text" name="expiryDate"  class="form-control" id="exDate"/></td>
                                        <td><span id="sp2" style="color: red; font-size: 87"></span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>:</td>
                                    </tr>
                                    <input type="hidden" name="email" value="<%=email%>"/>
                                    <input type="hidden" name="numberOfset" value="<%=numberOfset%>"/>
                                    <input type="hidden" name="busid" value="<%=busid%>"/>
                                    <input type="hidden" name="ticketPrice" value="<%=ticketPrice%>"/>
                                    <tr>
                                        <td><button type="submit" class="btn btn-success">Pay Now</button></td>
                                        <td><button type="reset" class="btn btn-danger">Reset</button></td>
                                        <td></td>
                                    </tr>
                                </table>
                                    
                                    
                                 
                               

                            </div>
                        </div>
                    </div>
                </div>
               </form>	
            </div>
        </div>
    </div>

</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />






