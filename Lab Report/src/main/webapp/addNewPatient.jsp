<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String pname=request.getParameter("pname");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String refdoc=request.getParameter("refdoc");
String comment=request.getParameter("comment");



try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into patient (name,age ,gender,refdoc,COMMENT) values('"+pname+"','"+age+"','"+gender+"','"+refdoc+"','"+comment+"')");
	response.sendRedirect("adminHome.jsp");
	
}catch(Exception e)
{
	
	System.out.println(e);
}




%>