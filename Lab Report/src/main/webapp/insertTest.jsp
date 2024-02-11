<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String type=request.getParameter("type");
String group=request.getParameter("group");
String tname=request.getParameter("tname");
String cname=type+"-"+group+"-"+tname;
String tunit=request.getParameter("tunit");
String tbref=request.getParameter("tbref");




try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into test (typename,gpname,testname,comboname,units,bioref) values('"+type+"','"+group+"','"+tname+"','"+cname+"','"+tunit+"','"+tbref+"')");
	response.sendRedirect("adminHome.jsp");
	
}catch(Exception e)
{
	
	System.out.println(e);
}




%>