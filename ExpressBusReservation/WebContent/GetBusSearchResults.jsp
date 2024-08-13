<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />

<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
            Search Results
        </div>
        <div class="tableContent col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <table class ="col-lg-6 col-md-6 col-sm-12 col-xs-12 table table-bordered">
                <tr>
                    <td>Bus ID</td>
                    <td>Bus Name</td>
                    <td>Bus Type</td>
                    <td>Departure Time</td>
                    <td>Travel Time</td>
                    <td>From</td>
                    <td>To</td>
                    <td>Cost</td>
                    <td>Booking</td>
                </tr>
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("busInformation");
                    try {
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></a>
                    <td><%=rs.getString(2)%></a>
                    <td><%=rs.getString(3)%></a>
                    <td><%=rs.getString(4)%></a>
                    <td><%=rs.getString(5)%></a>
                    <td><%=rs.getString(6)%></a>
                    <td><%=rs.getString(7)%></a>
                    <td><%=rs.getString(8)%></a>
                    <td><a href="BookTicket.jsp?busid=<%=rs.getString(1)%>&date=<%=String.valueOf(request.getAttribute("Date"))%>">confirm</a></td>
                </tr>
                <%
                        }
                        rs.close();

                    } catch (Exception e) {

                    }
                %>
            </table>
        </div>
    </div>
</div>

<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />