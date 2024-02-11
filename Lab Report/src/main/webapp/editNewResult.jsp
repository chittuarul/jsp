<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String rrid=request.getParameter("rid");
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
	Statement st3=con.createStatement();
    
	//rid +=1;
	if(rrid!="")
	{
	st.executeUpdate("update report set prid = "+Integer.parseInt(ppid)+" , amount = "+Integer.parseInt(aamt)+" ,spec = '"+sspec+"',rdate ='"+rrdt+"',comments='"+rrcmt+"' where rpid= "+Integer.parseInt(rrid)+"");

	ResultSet rs1= st1.executeQuery("select tid from test");
	while(rs1.next())
	{
	    
		ttid = rs1.getString(1);
		ttrslt = request.getParameter(ttid);
		 if(ttrslt != "")
		{    
		  st2.executeUpdate("delete from result where rpid= "+Integer.parseInt(rrid)+" and testid= "+Integer.parseInt(ttid)+"");
		  st3.executeUpdate("insert into result (rpid,testid,testresult,cmt) values("+Integer.parseInt(rrid)+","+Integer.parseInt(ttid)+",'"+ttrslt+"','')");	
		
		}
	}
//	}	
}
	 con.close();
response.sendRedirect("viewReportsAll.jsp");
	
}catch(Exception e)
{
	
	System.out.println(e);
}




%>
