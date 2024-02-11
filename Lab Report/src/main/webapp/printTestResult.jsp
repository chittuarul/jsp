<%@page import="java.sql.*" %>
 <%@page import="project.ConnectionProvider" %>
      <%
      try{
    	  String rrid=request.getParameter("rid");
    	  Connection con=ConnectionProvider.getCon();
  		Statement st=con.createStatement();
  		Statement st1=con.createStatement();
  		Statement st2=con.createStatement();
  		Statement st3=con.createStatement();
  		ResultSet rs=st.executeQuery("select pp.name,pp.age,pp.gender,pp.refdoc,rr.rdate,rr.spec from report rr join patient pp on rr.prid=pp.pid where rr.rpid=" +Integer.parseInt(rrid)+ "");
  		ResultSet rs2,rs3;
  		ResultSet rs1=st1.executeQuery("select DISTINCT tt.typename from report rr join result rs on rr.rpid=rs.rpid join test tt on rs.testid=tt.tid where rr.rpid=" +Integer.parseInt(rrid)+ "");
  		if(rs.next())
  		{
      %>
 
 
  
<style>

  @media print {
           .noprint {
              visibility: hidden;
           print-color-adjust: none !important ;
            
           }
           
           a[href]:after {
        content: none !important;
        
       } 
      
     
        }
 @page {
    size: auto;
    margin: auto;
    height: 842px;
        width: 595px;
        /* to centre page on screen*/
        margin-left: auto;
        margin-right: auto;
}

@print {
    @page :footer {
        display: none
    }
 
    @page :header {
        display: none
    }
}       
       
table{
  width:100%;
  table-layout: fixed;
  border: 0px solid;
}
table,th ,td{
     color:black;
  text-align:left; 
    border-collapse: collapse;
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

html ,body {
 font-family: 'Roboto', sans-serif;
  font-family:sans-serif;
  font-size: 20px;
        height: auto;
        width: 595px;
        /* to centre page on screen*/
        margin-left: auto;
        margin-right: auto;
      background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
}
p{
  font-family:sans-serif;
  font-weight:normal;
  font-size: 12px;
   padding: 0px;
    margin: 0px;
     font-weight:bold; 
  text-align:center;
}
.p1{
  font-family:sans-serif;
  font-weight:normal;
  font-size: 10px;
   padding: 0px;
    margin: 0px;
  text-align:center;
}
table {
  color:black;
  text-align:left;
  padding: 0px;
 margin:0px;
    
}

table >tr:nth-child(even) {
  background: #D1D0CE;
}

.t1 {
  font-family:sans-serif;
  font-size: 11px;
  border: 0px solid;
  font-weight:normal; 
  padding: 3px;
  border-width: thin;
    
    border-collapse: collapse;
}
.t2 {
  font-family:sans-serif;
  font-size: 10px;  
  font-weight:normal;
  padding: 3px;
  text-decoration: underline;
  border-bottom:0px solid LightGrey;
   border: 1px solid LightGrey;  
   border-collapse: collapse;
}

.t3 {
  font-family:sans-serif;
  font-size: 10px;
  color:black;
  text-align:left;
  padding: 3px;
  border-left: 1px solid LightGrey; 
   border-collapse: collapse;
}
.t4 {
  font-family:sans-serif;
  font-size: 10px;
  border: 1px;
   color:black;
  text-align:left;
  padding: 5px;
  background: grey;
  border-width: thin;
}
.t5 {
  font-family:sans-serif;
  font-size: 10px;
  border: 0px;
  margin: 0px;
   color:black;
  font-weight:bold;
  padding: 0px;

  vertical-align: bottom;
  text-align:right;  
}

.hh1 {
  font-family:sans-serif;
  font-size: 12px;
  border: none;
   color:black;
   font-weight:bold;
  text-align:center;
}
.hh2 {
  font-family:sans-serif;
  font-size: 10px;
  border: none;
   color:black;
   font-weight:bold;
  text-align:center;
}





</style>
  <!--for demo wrap-->

<head>

</head>
<body>
  <table class ="t3" style="border:1px solid LightGrey; border-bottom:0px solid" >
<tr>
   <td>      <p >
          Rasipuram Xrays </p>      
         <p class="p1">    
           Kadaiveethi       <br> Rasipuram          <br> Ph:6980970970
          </p>
          </td>
          </tr>
</table>

   <table class ="t3" style="border:1px solid LightGrey;border-bottom:0px solid">    
        <tr>
          <td>Patient Name : </td>
          <td colspan=2><%=rs.getString(1) %></td>
           <td>Report Date : </td>
         <td colspan=2><%=rs.getString(5) %></td>
         </tr>
         <tr> 
            <td>Age / Sex   : </td>
          <td colspan=2><%=rs.getString(2) %> / <%=rs.getString(3) %></td>
               <td>Speciman   : </td>
          <td colspan=2><%=rs.getString(6) %></td>      
          </tr>
          <tr>
          <td>Ref. Doctor    :</td>
          <td colspan=2><%=rs.getString(4) %></td>
          </tr>

 </table>
  <table style=" border:1px solid LightGrey ;border-bottom:0px solid" >
  <tbody>     
       <tr class ="t1" style="background-color: LightGrey; text-transform:uppercase">
        <td colspan=2 >Test Name</td>        
        <td >Result</td>
        <td >Units</td>
        <td >Bio Ref.</td>
       
       </tr>
 
  
 <%   
   while (rs1.next())
{   %>


<!--<div class="t1"> <%=rs1.getString(1).toUpperCase()%> </div> -->

<% rs2=st2.executeQuery("select DISTINCT  tt.gpname from report rr join result rs on rr.rpid=rs.rpid join test tt on rs.testid=tt.tid where tt.typename='" +rs1.getString(1)+ "' and rr.rpid=" +Integer.parseInt(rrid)+ "");

while (rs2.next())
{ %>
<tr class ="t2">
<td colspan="3" >
	<u><%=rs1.getString(1).toUpperCase()%> - <%=rs2.getString(1).toUpperCase()%> </u> :-
</td>
</tr>
<%rs3=st3.executeQuery("select DISTINCT tt.testname,rs.testresult,tt.units,tt.bioref,rs.cmt from report rr join result rs on rr.rpid=rs.rpid join test tt on rs.testid=tt.tid where tt.typename='"+rs1.getString(1)+"' and tt.gpname='"+rs2.getString(1)+"' and rr.rpid=" +Integer.parseInt(rrid)+ "");

     while (rs3.next())
     { %>
  
      <tr class="t3">            
        <td colspan=2><%=rs3.getString(1) %></td>        
        <td><%=rs3.getString(2) %> </td>
        <td> <%=rs3.getString(3) %></td>
        <td><%=rs3.getString(4) %> </td>       
      </tr>
   
 <% 
  } %>

 <% 
  } %>

 <% 
  } %>

</tbody>
  </table>
<table>
<tr height = 50px> 
<td  class="t5" style="border:1px solid LightGrey;">  Laboratory In-charge </td>
</tr>

  </table>
  
</body>
<hr class="noprint">
   <th ><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center class="noprint" ><img src="print.png"></center></a></th>
   <br>    
  <center class="noprint" ><a href="viewReportsAll.jsp"><Button class="w3-button w3-black" >BACK </Button></a></center>
  <% 
  
 con.close();
  } 
  		else {
		 response.sendRedirect("errorPrintReports.html");
		 
		 }
      }
		catch(Exception e)
{System.out.println(e);}	 
 
      
	 
	 
	 %>
