<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String ppid=request.getParameter("pid");
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update patient set pdelete= true where pid = "+ppid+"") ;
	response.sendRedirect("adminHome.jsp");
	
}catch(Exception e)
{
	
	System.out.println(e);
}




%>