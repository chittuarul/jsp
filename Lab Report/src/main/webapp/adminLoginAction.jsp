<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String username1 =request.getParameter("username");
String password1 =request.getParameter("password");
String uud="";
boolean found = false;
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from user where uname= '"+username1+"' and pwd = '"+password1+"' " ) ;
//st.executeQuery("select * from user");
while(rs.next())
{
	uud=rs.getString(1);
	if(username1.equalsIgnoreCase(rs.getString(2)) && password1.equalsIgnoreCase(rs.getString(3)) ) 
	{
		found = true; 
    session.setAttribute("uname",username1); 
     response.sendRedirect("adminHome.jsp");
     break;
	}

}
if(!found)
{
	
	if(username1.equalsIgnoreCase("admin") && password1.equalsIgnoreCase("1234"))
	{
		session.setAttribute("uname",username1); 
		session.setMaxInactiveInterval(10);
		response.sendRedirect("adminHome.jsp");
		
	}
	else
	{	
	response.sendRedirect("errorAdminLogin.html");
	}
}
con.close();
%>
</html>	