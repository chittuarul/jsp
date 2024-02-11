<%@page import="project.ConnectionProvider" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@page import="java.sql.*" %>

<%
String ppid=request.getParameter("pid");
String aamt=request.getParameter("amt");
String sspec=request.getParameter("spec");
String rrdt=request.getParameter("rdt");
String rrcmt=request.getParameter("rcmt");
String ttid="";
String ttrslt="";

try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	Statement st2=con.createStatement();	
	
	//rid +=1;
	if(ppid!="")
	{
	st1.executeUpdate("insert into report (prid,comments,rdate,dtime,amount,spec) values("+ppid+",'"+rrcmt+"', '"+rrdt+"' ,NOW(),"+Integer.parseInt(aamt)+",'"+sspec+"')");
	
	ResultSet rs= st.executeQuery("select max(rpid) from report");
	rs.next();
	int rid=Integer.parseInt(rs.getString(1));
	ResultSet rs1= st1.executeQuery("select tid from test");
	while(rs1.next())
	{
	   
		ttid = rs1.getString(1);
		ttrslt = request.getParameter(ttid);
	
		//st2.executeUpdate("insert into result (rpid,testid,testresult,cmt) values("+rid+",1,'dddd','test')");	
		
       if(ttrslt != "")
		{
		  st2.executeUpdate("insert into result (rpid,testid,testresult,cmt) values("+rid+","+Integer.parseInt(ttid)+",'"+ttrslt+"','')");	
		}
		
	}
//	}	
}
	 con.close();
response.sendRedirect("index.html");
	
}catch(Exception e)
{
	System.out.println(e); 
	
 }

%>

