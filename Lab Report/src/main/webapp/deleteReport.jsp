<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String rrid=request.getParameter("rid");
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update report set deleted=true where rpid = "+rrid+"") ;
	response.sendRedirect("adminHome.jsp");
	
}catch(Exception e)
{
	
	System.out.println(e);
}




%>