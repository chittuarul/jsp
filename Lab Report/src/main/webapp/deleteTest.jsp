<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String ttid=request.getParameter("tid");
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from test where tid = "+ttid+"") ;
	response.sendRedirect("adminHome.jsp");
	
}catch(Exception e)
{
	
	System.out.println(e);
}




%>