<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html>

<html>
<title>Edit Test Result</title>

<!------ Include the above in your HEAD tag ---------->
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>

<script>

</script>
<style>


body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
label
{
display: inline-block;
  width: 80px;
}
input
{
display: inline-block;
  width: 180px;
}
</style>
</head>

<body> 
<div class="w3-container">
  <div class="w3-bar w3-black">  
    <a href="index.html" class="w3-bar-item w3-button  w3-left" >Home</a> 
    <a href="viewReportsAll.jsp" class="w3-bar-item w3-button  w3-right" >Back</a> 
  </div>

</body>
</html>
  

<% 
String rrid=request.getParameter("rid");
String tstrslt="";
try{
	  
	 
	  Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
		Statement st4=con.createStatement();
		Statement st5=con.createStatement();
		ResultSet rs=st.executeQuery("select * from report where rpid=" +Integer.parseInt(rrid)+ "");
		ResultSet rs1=st1.executeQuery("select DISTINCT typename from test");
		ResultSet rs2,rs3,rs4 = null;
	//	ResultSet rs3=st3.executeQuery("select distinct testname from test where typename=rs1.getString(1) & gpname=rs2.getString(1)");		
	    rs.next(); 
	    ResultSet rs5=st5.executeQuery("select * from patient where pid=" +Integer.parseInt(rs.getString(1))+ "");
		rs5.next();
%>  


<form name="my-form" onsubmit="return validform()" action="editNewResult.jsp" method="post">
<input type="hidden" name="rid" value="<%=rrid%>">
<div id="Tokyo" class="w3-container w3-border city" >
<section>
<div class="tbl-header">
 <table  cellpadding="0" cellspacing="0" border="0">
 <tr>
      <td >Patient id</td>    
    <td > Patient Name</td>
    <td > Age / Sex </td>    
    <td > Doctor Referance</td>
    <td > Speciman</td>
    <td > Report Date</td>
    <td > Amount</td>
 </tr>
 </table>
 </div> 

<div class="tbl-content" style="height:auto">
    <table  cellpadding="0" cellspacing="0" border="0" >    
   
  <tr >
       
    <td colspan="2"> <input type="text" name="pid" value="<%=rs5.getString(1)%>" required> </td>    
    <td colspan="2"> <%=rs5.getString(2) %>  </td>      
    <td colspan="2"><%=rs5.getString(3) %> / <%=rs5.getString(4) %> </td>   
    <td colspan="2"> <%=rs5.getString(6) %> </td> 
    <td colspan="2"><input type="text" name="spec" value="<%=rs.getString(7) %>" required> </td>
    <td colspan="2"><input type="date" name="rdt" value="<%=rs.getString(4) %>" id = "rdt" placeholder="dd-mm-yyyy" min="2024-01-01" max="2030-12-31" required> </td>
    <td colspan="2"><input type="text" name="amt" value="<%=rs.getString(6) %>" > </td>
 
      
  </tr>  
 
</table>
 </div> 



<br>
<!--  
<table>

<label>Type :</label> <input id='searchInput0' onkeyup='searchTable(0)' type='text'>
<label>group : </label> <input id='searchInput1' onkeyup='searchTable(1)' type='text'>
<label>Test :</label> <input id='searchInput2' onkeyup='searchTable(2)' type='text'>
<hr>

</table>-->
<table id='searchInputtab'>
<% 
while (rs1.next())
{   %>
<div id='0' >
	<h4 id='0'><%=rs1.getString(1).toUpperCase()%></h4>	
<%  rs2=st2.executeQuery("select DISTINCT gpname from test where typename='"+rs1.getString(1)+"' ");
while (rs2.next())
{ %>
<section>
<hr>
<div id='1' >
	 <h5 id='1'><%=rs2.getString(1).toUpperCase()%></h5> 
<% rs3=st3.executeQuery("select DISTINCT testname,comboname,tid,units,bioref from test where typename='"+rs1.getString(1)+"' and gpname='"+rs2.getString(1)+"'  ");

while (rs3.next())
{ 
	rs4=st4.executeQuery("select DISTINCT testresult from result where rpid = "+Integer.parseInt(rs.getString(1))+ " and testid= " +Integer.parseInt(rs3.getString(3))+ "");
	if( rs4.next())
    {
		tstrslt=rs4.getString(1);
    }	
    
	 %>   
     <div id='2'>
         <label for="x" ><%=rs3.getString(1)%> :</label>    
         <input type="text" name="<%=rs3.getString(3)%>" value=<%=tstrslt%>> 
         <label for="x" >( <%=rs3.getString(4)%> )</label>  
         <label for="x" >( <%=rs3.getString(5)%> ) </label>  
	</div>
 <br>
<% }
tstrslt ="";
%>
 </div>
 </section>

<%  } %>	

<hr>
</div>
</table>
<% } %>
<label>Comment :</label><input value="<%=rs.getString(3) %>" name="rcmt" > </input> 
<hr>
      <button type="submit" class="w3-button w3-black center">
         Save
     </button>
  
 
</div>     
</form>


<%  }  	catch(Exception e)
{System.out.println(e);}		 
	 
	 %> 
</div>
  